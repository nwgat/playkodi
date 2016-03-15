#!/bin/sh

#kodi
user=kodi:kodi
host=htpc:8080

#local http
lhost=yourmachine


usage () {
echo "### nwgat.ninja kodi player ###"
echo "-u = play url "
echo "-m = mute audio"
echo "-s stop = stop playing"
echo "$OPTARG"
}

while getopts ":uhmsv:" option; do
  case "$option" in
    u)  curl --user $user --header "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"Player.Open","params":{"item": {"file":"'"$OPTARG"'"}},"id":1}' "$host/jsonrpc" 
		exit 0
        ;;
    h)  # it's always useful to provide some help 
        usage
        exit 0
        ;;
    m)  curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc": "2.0", "method": "Application.SetMute", "params": {"mute":"toggle"}, "id": 1}' "$host/jsonrpc"		
		exit 1
        ;;
	s)  curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc": "2.0", "method": "Player.Stop", "params": {"playerid":1}, "id": 1}' "$host/jsonrpc"
        exit 1
        ;;
	v) curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc": "2.0", "method": "Application.SetVolume", "params": {"volume":'"$OPTARG"'}, "id": 1}' "$host/jsonrpc"
		;;
	?)  echo "Error: unknown option -$OPTARG" 
        usage
        exit 1
        ;;
  esac
done    
