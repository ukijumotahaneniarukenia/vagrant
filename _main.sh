#!/bin/bash
OUTPUT=$(pwd)/output
CMD_DIR=$(pwd)/cmd
TMP_DIR=$(pwd)/tmp
AWK_DIR=$(pwd)/awk
LVT_DIR=/etc/libvirt/qemu
LVT_NET_DIR=${LVT_DIR}/networks

_offnet(){
  START_RN=$1
  END_RN=$2
  ( cd ${LVT_NET_DIR} && \
    seq ${START_RN} ${END_RN} | while read RN;do
      virsh net-destroy mynet${RN} && virsh net-undefine mynet${RN};
    done )
}

_mknet(){
  START_RN=$1
  END_RN=$2
  ( cd ${LVT_NET_DIR} && \
    seq ${START_RN} ${END_RN} | while read RN;do
      cp $(pwd)/tmpl/mynet@.xml $(pwd)/mynet${RN}.xml && sed -i s/@/${RN}/g $(pwd)/mynet${RN}.xml;
    done )
}

_onnet(){
  START_RN=$1
  END_RN=$2
  ( cd ${LVT_NET_DIR} && \
    seq ${START_RN} ${END_RN} | while read RN;do
      virsh net-define mynet${RN}.xml && virsh net-start mynet${RN};
    done )
}

_rebnet(){
  START_RN=$1
  END_RN=$2
  ( cd ${LVT_NET_DIR} && \
    seq ${START_RN} ${END_RN} | while read RN;do
      virsh net-destroy mynet${RN} && virsh net-define mynet${RN}.xml && virsh net-start mynet${RN}
    done )
}

_buildnet(){
  START_RN=$1
  END_RN=$2
  _offnet ${START_RN} ${END_RN}
  _mknet ${START_RN} ${END_RN}
  _onnet ${START_RN} ${END_RN}
}

_rmdir(){
  rm -rf {${OUTPUT},${CMD_DIR},${TMP_DIR},${AWK_DIR}};  
}

_mkdir(){
  mkdir -p {${OUTPUT},${CMD_DIR},${TMP_DIR},${AWK_DIR}};
}

_initdir(){
  _rmdir
  _mkdir
}

_mkvxnm(){
  START_RN=$1
  END_RN=$2
  seq ${START_RN} ${END_RN} | while read RN;do
    echo ${LVT_DIR}/vx_node${RN}.xml >>${OUTPUT}/vx_node;
  done
}

_grp(){
  RN=$1
  GRP=$2
  while read line; do
     echo ${line} | sed -e s/GRP/${GRP}/ | bash;
  done < <(seq ${RN} | xargs -I@ bash -c 'echo echo $\(\(@%GRP\)\)') | sort >${OUTPUT}/grp
}

_join(){
  LFT=$1
  RGT=$2
  OPT_FNM=$3
  paste -d ' ' ${LFT} ${RGT} >${OPT_FNM};
}

_callcmd(){
  RPT=$1
  while read line; do
    OPT_FNM=$(basename ${line} | sed -e s/\_/\\t/g | awk '{print $2}')
    [ -e ${OUTPUT}/${OPT_FNM} ] && rm -f ${OUTPUT}/${OPT_FNM};
    seq ${RPT} | while read rpt; do
      cat ${line} | sed -e s/@/${rpt}/ | bash >>${OUTPUT}/${OPT_FNM};
    done
  done < <(find ${CMD_DIR}/* -name "*")
}

_mkcmd(){
  CMD_FNM=$1
  CMD=$2
  echo ${CMD} > ${CMD_DIR}/${CMD_FNM};
}

_split(){
  LFT=$1
  RGT=$2
  paste -d ' ' ${LFT} ${RGT} | awk '
    OUTPUT="'"${OUTPUT}"'"
    {print>OUTPUT"\x2f""split_"$1}
  ' 1>/dev/null 
}

_mk_def_ip_script_with_awk(){
  cat <<EOF >${AWK_DIR}/def_ip.awk
{
  gsub(/[^ ]+/,"\x27&\x27");
  print "<host mac="\$3" name="\$2" ip=\x27""192.168."third_octet"."NR+1"\x27""/>"
}
EOF
}

_call_def_ip_script_with_awk(){
  START_RN=$1
  END_RN=$2
  seq ${START_RN} ${END_RN} | while read RN;do
    gawk -v "third_octet=$((${RN}+100))" -f ${AWK_DIR}/def_ip.awk ${OUTPUT}/split_${RN} > ${OUTPUT}/def_host_tag_$((${RN}+100));
  done
}

_kvm_guest_modify_network(){
  START_RN=$1
  END_RN=$2
  
  while read line; do
    OPT_FNM=$(basename ${line})
    sed -e "/range/a @" < <(cat ${line}) > ${TMP_DIR}/${OPT_FNM}
  done < <(find ${LVT_NET_DIR} -maxdepth 1 -name "mynet*")
  
  seq ${START_RN} ${END_RN} | while read RN; do
    SRC_FILE=${TMP_DIR}/mynet${RN}.xml;
    EMBED_STR=$(cat ${OUTPUT}/def_host_tag_${RN} | tr "\n" " ");
    TAR_FILE=${LVT_NET_DIR}/mynet${RN}.xml
    awk '{
      SRC_FILE="'"${SRC_FILE}"'"
      EMBED_STR="'"${EMBED_STR}"'"
      gsub("@",EMBED_STR);
      print;
    }' ${SRC_FILE} > ${LVT_NET_DIR}/mynet${RN}.xml
  done
}

_kvm_guest_modify_machine(){
  while read line; do
    echo ${line} | awk '
      BEGIN{
      }
      {
        net_name="mynet"$2+100;
        tar_file=$3;
        #system("virsh dumpxml "node_name" | cat - | sed -e s/vagrant-libvirt/"net_name"/g ");
        system("sed -i -e s/vagrant-libvirt/"net_name"/g "tar_file" ");
      }
      END{
      }
    ' 
  done < <(cat ${OUTPUT}/vx_node_grp|nl) 1>/dev/null
}

_redefvm(){
  START_RN=$1
  END_RN=$2
  ( cd ${LVT_DIR} && \
    seq ${START_RN} ${END_RN} | while read RN;do
      virsh define vx_node${RN}.xml;
    done )
}

_buildnet 100 102
_initdir
_mkcmd "get_macaddr_cmd" "virsh dumpxml vx_node@ | grep \"mac address\" | awk 'match(\$0, /[a-f0-9]{2}(:[a-f0-9]{2}){5}/) {print substr(\$0, RSTART, RLENGTH)}'"
_mkcmd "get_nodename_cmd" "echo node@"
_callcmd 6
_join ${OUTPUT}/nodename ${OUTPUT}/macaddr ${OUTPUT}/vminfo
_grp 6 3
_split ${OUTPUT}/grp ${OUTPUT}/vminfo
_mk_def_ip_script_with_awk
_call_def_ip_script_with_awk 0 2
_kvm_guest_modify_network 100 102
_rebnet 100 102
_mkvxnm 1 6
_join ${OUTPUT}/grp ${OUTPUT}/vx_node ${OUTPUT}/vx_node_grp
_kvm_guest_modify_machine
_redefvm 1 6
