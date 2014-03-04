CalculatorTest
==============

This calculator was designed as a basic tool. 

Notes:
Due to time limitations as well as simplicity, the following functionality is not supported:

Calculations with negative numbers
==================================
The tool will, as it stands now, consider it illegal to have more than one operator in consecutive order. In addition, it considers any symbol other than numbers an operator. This means that equations like:

-20+5
20+-2

are NOT supported. Any other floating point calculations should be fine.


Duration
========
The code itself did not take very long to write, though a significant amount of time was required to set my system up for MongoDB, NPM and Node JS. Taken into consideration that all of these things are now finished, future work should be much faster.
