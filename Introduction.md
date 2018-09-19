# Effect of Buffering on the Throughput of ALOHA 

This paper aims to explore the advantages of using ALOHA in media having a high relative propagation delay like Deep Underwater or Space communication. Previously it had been widely accepted that ALOHA could achieve a maximum throughput of 18.6%, which is substantially less than other complex MAC protocols like CSMA, T-Lohi, MACA and FS-MACA. But an important observation is that the performance of ALOHA is independent of the relative propagation delay of the medium, unlike any other complex MAC protocol.

Previously, Abramson had only derived the throughput performance under the assumption of infinite number of active nodes, the traffic following poisson’s distribution and every node producing traffic at random intervals. In this paper, the authors have mathematically derived the throughput performance for a finite number of active nodes with and without buffering. The experimental and analytical/simulation results  go hand-in-hand with each other. The collisions of packets has been classified into two types, and the effect of buffering in the ALOHA protocol is analysed for the two types of collisions separately. 

# Theoretical aspects dealt in the paper:

## Definitions:
1. __Offered Load (G):__ Ratio between the total network load (data generation rate in the network) and the channel capacity (data rate).<br>  
$$G = \frac{Data Generation Rate}{Channel Capacity (Data Rate)}$$
2. __Transmitted Load (T):__ Ratio of the carried traffic (data transmission per unit time by a transmitter) to the overall channel capacity.<br>
$$T = \frac{Data Trans. Rate per Tranmitter}{Channel Capacity (Data Rate)}$$
3. __Throughput(S):__ Rate of successful data transfer through the network as a proportion of the channel capacity.<br>
$$S = \frac{Successful Data Transfer Rate}{Channel Capacity (Data Rate)}$$

## Throughput derivation
```Throughput of ALOHA Protocol = Transmitted load - Losses caused by collisions```

Collisions are classified into 2 types:
* Case when interfering packet arrives while the packet of interest is being received.
* Case where the packet of interest arrives at its destination while interference is already present.

#### Type-1 Collision Probability:
$$D = \frac{T}{N}$$
$$P_{1} = 1-(1-D)^{N-1} = 1- (1- \frac{T}{N})^{N-1}$$

Here,
D = Duty Cycle
T = Transitted Load
N = Number of active nodes
$$P_{1}$$ = Probability of Type-1 Collision

#### Type-2 Collision Probability for Unbuffered ALOHA:
$$P_{2} = 1-P_{t}^{N-1}$$
$$P_{t} = e^{-\omega d}$$
$$P_{2} = 1-e^{-(N-1)\omega d}$$

Here,
$$\omega$$ = Packet Generation Rate
$$P_{t}$$ =  Probability of any other  single  active  node commencing  transmission  during  the  packet  duration $$d$$
$$P_{2}$$ = Probability of Type-2 Collision

#### Output Process for Unbuffered ALOHA: 
$$G = N\omega d$$
$$P_{D} = \frac{T}{N}$$
$$\overline P_{D} = 1-\frac{T}{N}$$
$$T = G* \overline P_{D} = G(1- \frac{T}{N})$$
$$\Rightarrow G = \frac{T}{1 - \frac{T}{N}}$$

$$\lim_{N\to\infty} G = T$$
$$T = \frac{G}{1 + \frac{G}{N}} = \frac{N\omega d}{1+\omega d}$$
$$\omega d = \frac{T}{N-T}$$

$$S = T(1-P_{1})(1-P_{2})$$
$$\Rightarrow S = T((1-\frac{T}{N})^{N-1})(e^{-(N-1\frac{T}{N-T})})$$
$$\lim_{N\to\infty} S = Ge^{-2G}$$

Here,
$$G$$ = Offered Load
$$P_{D}$$ =  Probability of packet being dropped
$$S$$ = Throughput of unbuffered ALOHA

#### Output Process for Buffered ALOHA: 
$$G = N\omega d = T$$
$$\omega = \frac{G}{Nd} = \frac{T}{Nd}$$
$$D = \frac{T}{N} = \omega d$$
$$P_{nb} = 1-D = 1- \frac{T}{N} = 1-\omega d$$

$$S = T(1-P_{1})(1-P_{2})$$
$$\Rightarrow S = T((1-\frac{T}{N})^{N-1})(e^{-(N-1)\omega d})$$
$$\Rightarrow S = T((1-\frac{T}{N})^{N-1})(e^{-(N-1\frac{T}{N})})$$

As offered load $$G$$ is equal to transmitted load $$T$$,
$$\lim_{N\to\infty} S = Ge^{-2G}$$

Here,
$$P_{nb}$$ =    Probability  of  an  offered  packet  not being buffered

Since  the  effect  of  buffering  decreases  with  the  increasing  numbers  of  active  nodes, the  buffered and unbuffered cases converge for an infinite number of active nodes.

####  Salient Points:
1. In the case of Buffered ALOHA, the Transmitted Load = Offered Load if and only if:<br>
    a. There are no buffer overflows <br>
    b. The Offered Load (G) < Network Capacity <br>