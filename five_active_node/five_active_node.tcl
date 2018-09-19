
# Step-1: Object of class Simulator
set ns [new Simulator]

# Step-2: Trace File
set tf [open five_active_node.tr w]
$ns trace-all $tf

# Forcing the network to use Pure ALOHA MAC protocol
$ns macType Mac/Sat/UnslottedAloha


# Step-3: NAM File
set nf [open five_active_node.nam w]
$ns namtrace-all $nf

# Step-4: End Procedure
proc finish { } {
	global ns nf tf
	$ns flush-trace
	close $nf
	close $tf
	exec nam five_active_node.nam &
	exit 0
}

# Step-5: Creating Topology
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

$n0 label "source"
$n1 label "link1"
# $n3 label "D"

$ns color 1 "Blue"
$ns color 2 "Red"

# Mesh Topology
$ns duplex-link $n0 $n1 10Mb 1ms DropTail
$ns duplex-link $n0 $n2 10Mb 1ms DropTail
$ns duplex-link $n0 $n3 10Mb 1ms DropTail
$ns duplex-link $n0 $n4 10Mb 1ms DropTail

$ns duplex-link $n1 $n2 10Mb 1ms DropTail
$ns duplex-link $n1 $n3 10Mb 1ms DropTail
$ns duplex-link $n1 $n4 10Mb 1ms DropTail

$ns duplex-link $n2 $n3 10Mb 1ms DropTail
$ns duplex-link $n2 $n4 10Mb 1ms DropTail

$ns duplex-link $n3 $n4 10Mb 1ms DropTail



# $ns duplex-link-op $n0 $n1 orient right-down
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
$ns attach-agent $n4 $sink0

# Step-6.14: Connecting TCP Source and Destination Agents
$ns connect $tcp0 $sink0

# second type of connection
# Step-6.21: UDP Agent for Source
set udp1 [new Agent/UDP] 
$ns attach-agent $n3 $udp1
$udp1 set class_ 2

# Step-6.22: UDP Applicaion for source
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1

# Step-6.23: UDP Agent for Destination
set null0 [new Agent/Null] 
$ns attach-agent $n2 $null0

# Step-6.14: Connecting UDP Source and Destination Agents
$ns connect $udp1 $null0
$ns at 0.1 "$cbr1 start"
$ns at 0.2 "$ftp0 start"
$ns at 0.8 "$ftp0 stop"
$ns at 1.0 "finish"

# Step-8: Running the simulation
$ns run