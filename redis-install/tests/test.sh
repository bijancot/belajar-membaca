echo "please either run it with sudo or run it as root"
while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "please either run it with sudo or run it as root"
      echo "$package - attempt to capture frames"
      echo " "
      echo "$package [options] application [arguments]"
      echo " "
      echo "options:"
      echo "-h, --help       show brief help"
      echo "-p, --port       specify port"
      exit 0
      ;;
    -p)
      shift
      if test $# -gt 0; then
        if [ $1 -gt 65535 ]; then
            echo "port number not valid due greater than 65535"
        else
            PORT=$1
            export PORT=$1
            apt-get update && apt-get install -y redis && \
            echo "ACL SETUSER redis on >panjiganteng" | redis-cli && \
            oldport=$(awk -v key="port" '$1 == key {print $2}' "/etc/redis/redis.conf") && \
            sed -i -r "s/port $oldport/port $PORT/" /etc/redis/redis.conf && \
            service redis restart 
        fi
      else
        echo "no port specified"
        exit 1
      fi
      shift
      ;;
    --output-dir*)
      export OUTPUT=`echo $1 | sed -e 's/^[^=]*=//g'`
      shift
      ;;
    *)
      echo "$package - attempt to capture frames"
      echo " "
      echo "$package [options] application [arguments]"
      echo " "
      echo "options:"
      echo "-h, --help                show brief help"
      echo "-a, --action=ACTION       specify an action to use"
      echo "-o, --output-dir=DIR      specify a directory to store output in"
      exit 0
      ;;
  esac
done



65535