{
  gsub(/[^ ]+/,"\x27&\x27");
  print "<host mac="$3" name="$2" ip=\x27""192.168."third_octet"."NR+1"\x27""/>"
}
