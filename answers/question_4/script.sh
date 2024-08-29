#/bin/bash

# File all the files with .mp4 extension and get its owner
# user is column 3
# filename is column 9

ls -lah | grep ".mp4$" | awk '{print $9" : "$3}'

