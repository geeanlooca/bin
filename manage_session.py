#!/usr/bin/python3

from os import listdir
from os.path import isfile, join
from subprocess import *
from random import choice
from shlex import quote


ps = Popen(('echo', "Lock\nLogout\nShutdown\nReboot"), stdout=PIPE)
# dmenu_cmd = "echo  | rofi -dmenu"
# dmenu_cmd = "rofi -show"
# dmenu_cmd = "ls"
# output = run(dmenu_cmd, shell=True)
output = check_output(('rofi', '-dmenu'), stdin=ps.stdout).strip().decode('utf-8')

diction = { 
        'Lock' : '~/bin/locker',
        'Logout' : 'i3-msg exit',
        'Reboot' : 'systemctl reboot',
        'Shutdown' : 'systemctl poweroff'
}

cmd_string = diction.get(output, 'i3-msg-exit')

call(cmd_string, shell=True)

