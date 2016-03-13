# PlayKodi #
a cli based remote for kodi
written in bash

i didnt find a good cli based kodi player so i wrote my own

**Current Arguments**

| Feature       |    Argument   |
| ------------- | ------------- |
| Play url     | -u             | 
| Mute Audio   | -m             |
| Stop Playing | -s             |

**Examples**

* `playkodi -u http://download.blender.org/demo/movies/Sintel.2010.1080p.mkv`

**Todo**

* fix the harcoded url

| Feature               |       Argument           |
| --------------------- | ------------------------ |
| Play Movie            | -p Sintel                | 
| Play Local File       | -l Sintel.2010.1080p.mkv |
| Volume 0-100          | -v 0-100                 |
| Add to playlist       | -ap                      |
| Play Playlist         | -pp                      |
| Play next in playlist | -pn                      |
