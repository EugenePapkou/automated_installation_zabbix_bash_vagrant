#!/bin/bash

#Authentication
AUTH_TOKEN="$(curl -d '{"jsonrpc": "2.0","method": "user.login","params":{"user":"Admin","password":"zabbix"},"id": 1,"auth": null}' -H "Content-Type: application/json-rpc" -X POST http://192.168.1.2/api_jsonrpc.php)"

#here's the auth_key
AUTH_TOKEN="$(echo $AUTH_TOKEN | cut -c28-59)"


#creating a host group
GROUP_ID="$(curl -d '{"jsonrpc": "2.0","method": "hostgroup.create","params": {"name": "CloudHosts"},"auth": "'$AUTH_TOKEN'","id": 1}' -H "Content-Type: application/json-rpc" -X POST http://192.168.1.2/api_jsonrpc.php)"


#here's the group ID (works only if it's 2-digital ID)
GROUP_ID="$(echo $GROUP_ID | cut -c41)"

#creating a template
TEMPLATE_ID="$(curl -d '{"jsonrpc": "2.0","method": "template.create","params": {"host": "Customtemplate","groups": {"groupid": '$GROUP_ID'}},"auth":"'$AUTH_TOKEN'","id":1}' -H "Content-Type: application/json-rpc" -X POST http://192.168.1.2/api_jsonrpc.php)"


#here's the template ID (works only if it's 5-digital ID)
TEMPLATE_ID="$(echo $TEMPLATE_ID | cut -c44-48)"



#creating host
curl -d '{"jsonrpc": "2.0","method": "host.create","params": {"host": "Hostname","interfaces": [{"type": 1,"main": 1,"useip": 1,"ip": "192.168.1.3","dns": "","port": "10050"}],"groups": [{"groupid": "'$GROUP_ID'"}],"templates": [{"templateid": "'$TEMPLATE_ID'"}]},"auth": "'$AUTH_TOKEN'","id": 1}' -H "Content-Type: application/json-rpc" -X POST http://192.168.1.2/api_jsonrpc.php

