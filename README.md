# Murphy's line algorithm

The Matlab function `murphy_line_draw.m` implements Murphy's line algorithm [1] to draw lines of arbitrary thickness.
It is a modified version of Bresenham's line algorithm [2].
Further information can be found on http://www.zoo.co.uk/~murphy/thickline/.

This implementation works in all octants of the Cartesian coordinate system.

## Demo

The Matlab script `demo.m` provides a simple example of how to use the Matlab function `murphy_line_draw.m`.

## References

1. Line Thickening by Modification To Bresenham's Algorithm, 
   A.S. Murphy, 
   IBM Technical Disclosure Bulletin, Vol. 20, No. 12, May 1978.
   
2. Algorithm for computer control of a digital plotter, 
   J.E. Bresenham,
   IBM Systems Journal, 4, 1, 1965, S. 25–30.
