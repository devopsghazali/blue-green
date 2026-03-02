# scripts/switch-to-blue.sh

#!/bin/bash

kubectl patch ingress app-ing -n prod \
  --type=json \
  -p='[{"op":"replace","path":"/spec/defaultBackend/service/name","value":"app-blue"}]'

echo "Traffic switched to BLUE"
