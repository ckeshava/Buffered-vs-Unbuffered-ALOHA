BEGIN{udp=0;tcp=0;drops=0;}{
	if($1 == "r" && $5 == "cbr")
	{
		udp++;
	}
	else if($1 == "r" && $5 == "tcp")
	{
		tcp++;
	}
	else if($1 == "d")
	{
		drops++;
	}
}
END{
	printf("\n\n<=============== Simulation of Buffered ALOHA with Five Active Nodes  (N = 5)  ============>\n\n");
	printf("Number of packets sent by TCP = %d\n", tcp);
	printf("Number of packets sent by UDP = %d\n", udp);
	printf("Total number of packets dropped = %d\n", drops);
	printf("Throughput = %d\n", (tcp*1040 + udp*210)/(0.9));
	printf("Transmitted Load/Offered Load = %d%%\n", (tcp + udp)/(tcp + udp + drops) * 100);

	printf("\n\n");
	printf("<============= End of stats ==============>\n\n");
}