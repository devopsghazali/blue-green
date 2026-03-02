# scripts/switch-to-green.sh

#!/bin/bash

kubectl patch ingress app-ing -n prod \
  --type=json \
  -p='[{"op":"replace","path":"/spec/defaultBackend/service/name","value":"app-green"}]'

echo "Traffic switched to GREEN"
