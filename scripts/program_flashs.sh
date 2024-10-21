#!/usr/bin/expect

#expect << EOF

set file [lindex $argv 0]
set fd [open $file r]
set hosts [read $fd]
close $fd
set data [split $hosts "\n"]

foreach i $data {
	if { $i == "" } {
		continue
	}
	puts $i
	spawn ssh root@$i
		expect {
			"yes/no" {send "yes\r"; exp_continue}
			"*password" {send "123\r"}
		}
		expect root@
		send "tmux\r"
		expect "]#"
		send "\r"
		expect "]#"
		send "cd OsTools/\r"
		expect "]#"
		send "make\r"
		expect "]#"
		send "./OsTools\r"
		expect "Dev Name:"
		send "spi -u ../gz_7a1000\r"
		expect "]#"
		send "echo 'program done!'\r"
		send "reboot'\r"
#		send "gdb\r"
#		expect "(gdb)"
#		send "p/d 8*9\r"
}

set timeout 2
expect eof
