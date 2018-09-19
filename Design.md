# Design and Implementation

### Steps to be undertaken for implementation of the paper:

1.  Derivation of a method to calculate the throughput of ALOHA for both buffered and unbuffered cases with finite number of nodes.

2. Calculation of theoretical values for two different collision cases and thereby determination of the relationship between offered load and transmitted load.

3. By analysis and simulation, we demonstrate that while the accepted ```maximum throughput for ALOHA is 18.6%```, it approaches to ```32.22% with buffering and 27.37% for unbuffered ALOHA```. 
(The highest throughput is achieved for the lowest number of active nodes, i.e N=2)

4. To demonstrate the validity of the proposed theory, an equivalent simulator will be developed in MATLAB to present simulation results in order to represent the relationship between offered load and transmitted load. 

5. To evaluate network performance, three parameters are taken into consideration: Offered Load, Transmitted Load, Throughput.

6. Graph demonstrating the variation between ```Transmitted Load v/s Offered Load on varying the number of active nodes(N)``` is to be plotted.

7. Furthermore, graphs between ```Throughput v/s Offered Load``` are plotted, which makes the differences between the buffered and unbuffered cases evident, not only due to the efficiency with which they use the channel but also because of the differences in the proportion of offered packets actually transmitted.
