## Introduction
Name removed for peer assessment phase
February 2015 -- Brighton, Michigan, USA<P>

This second programming assignment required that I write an R
function that is able to cache a potentially time-consuming computation,
finding the inverse of a matrix. Finding the inverse of a matrix is typically
a fast operation, however, as the dimensions of the matrix become large, the
computational complexity increases on the order of n raised to the 2.8 to 3.0
power, depending upon the implementation of the algorithm used to compute it.<P><P>
On my MacBook Pro (late 2013) equipped with an Intel Core i5 processor with a clock
frequency of 2.6 GHz, a 2500 x 2500 matrix requires approximately 35 seconds
to invert.  The solve.default() function included with R version 3.1.2 (2014-10-31)
requires time on the order of n^2.8 to invert this large matrix.<P><P>
This combination
of processing power and algorithm may make the time required too long to compute
the inverse, especially if it has to be computed repeatedly (e.g. in a loop).
If the contents of a matrix are not changing, it
may make sense to cache the value of the inverse so that when it is needed
again, it can be looked up in the cache rather than recomputed. In this
Programming Assignment I took advantage of the scoping rules of
the R language and how the scoping can be manipulated to preserve state inside
of an R object.

##GitHub Repository

This project is stored in a GitHub repository at<P><P>
[https://github.com/p736m3dmht7t/ProgrammingAssignment2](https://github.com/p736m3dmht7t/ProgrammingAssignment2)
