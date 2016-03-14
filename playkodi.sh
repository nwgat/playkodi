#!/bin/sh
#
# nwgat.ninja kodi player
# http://nwgat.ninja
#
# some parts borrowed from
# https://github.com/pla1/utils/blob/master/kodiJsonExamples.sh
#
# Requires curl
#

# kodi
host="htpc:8080"
user="kodi:kodi"

# local ip so you can play local files using devd http server
lhost="yourmachine"

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# help
echo ""
echo "### nwgat.ninja kodi player ###"
echo "-u = play url "
echo "-m = mute audio"
echo "-v = change volume (0-100)"
echo "-s stop = stop playing"
echo ""


## arguments
while getopts "u?msv:" opt; do
    case "$opt" in
    u|\?)
    	read url
	curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"Player.Open","params":{"item": {"file":"'"$url"'"}},"id":1}' "$host/jsonrpc"
        exit 0
        ;;
    m)  curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc": "2.0", "method": "Application.SetMute", "params": {"mute":"toggle"}, "id": 1}' "$host/jsonrpc"
        ;;
    s)  curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc": "2.0", "method": "Player.Stop", "params": {"playerid":1}, "id": 1}' "$host/jsonrpc"
        ;;
    v)  
        read vol
        curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc": "2.0", "method": "Application.SetVolume", "params": {"volume":'"$vol"'}, "id": 1}' "$host/jsonrpc"
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

# End of file
