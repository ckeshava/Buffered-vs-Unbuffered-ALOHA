

# Step-1: Object of class Simulator
set ns [new Simulator]

# Step-2: Trace File
set tf [open two_active_node.tr w]
$ns trace-all $tf

# Forcing the network to use Pure ALOHA MAC protocol
$ns macType Mac/Sat/UnslottedAloha


# Step-3: NAM File
set nf [open two_active_node.nam w]
$ns namtrace-all $nf

# Step-4: End Procedure
proc finish { } {
	global ns nf tf
	$ns flush-trace
	close $nf
	close $tf
	exec nam two_active_node.nam &
	exit 0
}

# Step-5: Creating Topology
set n0 [$ns node]
set n1 [$ns node]
# set n2 [$ns node]
# set n3 [$ns node]

$n0 label "source"
$n1 label "link1"
# $n3 label "D"

$ns color 1 "Blue"
$ns color 2 "Red"

$ns duplex-link $n0 $n1 10Mb 1ms DropTail

# $ns duplex-link $n1 $n2 10Mb 1ms DropTail
# $ns duplex-link $n2 $n3 10Mb 1ms DropTail

$ns duplex-link-op $n0 $n1 orient right-down
# $ns duplex-link-op $n1 $n2 orient right-up
# $ns duplex-link-op $n2 $n3 orient right

# Step-6: Configuring Source and Destination TCP/UDP Agent with Application

# Step-6.11: TCP Agent for Source
set tcp0 [new Agent/TCP] 
$ns attach-agent $n0 $tcp0
$tcp0 set class_ 1

# Step-6.12: TCP Applicaion for source
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0

$ftp0 set packetSize_ 500
$ftp0 set interval_ 0.001

# Step-6.13: TCP Agent for Destination
set sink0 [new Agent/TCPSink] 
$ns attach-agent $n1 $sink0

# Step-6.14: Connecting TCP Source and Destination Agents
$ns connect $tcp0 $sink0

$ns at 0.2 "$ftp0 start"
$ns at 0.8 "$ftp0 stop"
$ns at 1.0 "finish"

# Step-8: Running the simulation
$ns run