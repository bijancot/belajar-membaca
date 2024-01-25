echo "please either run it with sudo or run it as root"
if [ -z "$1" ]
  then
    echo "No argument supplied"
      echo "$package - attempt to capture frames"
      echo " "
      echo "$package [options] application [arguments]"
      echo " "
      echo "options:"
      echo "-h, --help       show brief help"
      echo "-p, --port       specify port"
      exit 0
fi
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
        curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg && \
        echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list && \
        apt-get update && apt-get install -y redis && \
        echo "ACL SETUSER redis on >panjiganteng" | redis-cli && \
        oldport=$(awk -v key="port" '$1 == key {print $2}' "/etc/redis/redis.conf") && \
        sed -i -r "s/port $oldport/port $PORT/" /etc/redis/redis.conf && \
        sudo systemctl unmask  redis-server.service && \
        service redis restart && \
        echo "redis run on port $PORT" && \
        echo "run redis-cli -p $PORT to connect"
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
