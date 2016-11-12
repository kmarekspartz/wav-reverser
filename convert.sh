echo "Content-type: audio/wav"
echo

case "$REQUEST_METHOD" in
  POST)
    tempfile=$(mktemp)
    sox -t wav - -t wav $tempfile reverse <&0
    cat $tempfile
    rm $tempfile
    ;;
  *)
    echo 'Status: 405 Method Not Allowed'
    echo
esac
