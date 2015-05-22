#!/usr/bin/expect -f

spawn su -root
expect "Password:"
#expect "密码："
#expect "*$"
send "password\r"
expect "root*]#"
#expect "root]#"
interact
exit
