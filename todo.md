
| Done?                | Feature               |       Argument           |       Notes           |
| ---------------------| --------------------- | ------------------------ | ------------------------ |
|| Play Movie            | -p Sintel                |  how?                    |
|| Play Local File       | -l Sintel.2010.1080p.mkv |  http server             |
|yes| Play Url              | -u http://               | `curl --user $user --header "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"Player.Open","params":{"item": {"file":"'"$OPTARG"'"}},"id":1}' "$host/jsonrpc" `|
|yes| Volume 0-100          | -v 0-100                 | `curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc": "2.0", "method": "Application.SetVolume", "params": {"volume":30}, "id": 1}' "http://$hostname:$port/jsonrpc"` |
|| Add to playlist       | -ap                      | `curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"Playlist.Add","params":{"playlistid":1,"item": {"file":"url"}},"id":1}' "$host/jsonrpc"`|
|| Play Playlist         | -pp                      | `curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"Player.Open","params":{"item": {"playlistid":1}}}' "$host/jsonrpc"` |
|| Play next in playlist | -pn                      | `curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"Player.GoTo","params":{"playerid":1,"to": "next"},"id":1}' "$host/jsonrpc"` |
|yes| Mute Audio | -m | `curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc": "2.0", "method": "Application.SetMute", "params": {"mute":"toggle"}, "id": 1}' "$host/jsonrpc"`	|
|yes| Stop Playing | -s | `curl --user "$user" --header "Content-Type: application/json" --data '{"jsonrpc": "2.0", "method": "Player.Stop", "params": {"playerid":1}, "id": 1}' "$host/jsonrpc"` |
