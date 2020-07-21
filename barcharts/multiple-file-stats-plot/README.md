Barchart with errorbars and stats on for loops
###

In this plot, I have multiple files of a single column

```
12
46
79
```

I need to plot the statistics (e.g., averages and std dev) for all files, in a single plot.
I do this in file **plot.gp**. In order to plot all files over a multiplot, refer to file **multiplot.gp**.



Info on configuration
---

``` set boxwidth ``` to create a space between the bars;
``` set style fill transparent ... ``` to set the transparency of the items
``` set grid ``` to enable the grid on both x and y
``` set print tfile``` to redirect the output on tfile (previously defined as a string variable).
 
Info on plot
---

The plot should be done with 

```
do for [i=1:6] {
	stats file nooutput;	
	print STATS_mean, STATS_stddev
}
plot tfile u 1:2 w boxes, "" u 0:1:2 w yerr, ...
```

Info on plot config
---

```... stats ``` to get the variable STATS_*
```... print ``` to redirect the variable STATS_* to the file
```... u 0:1:2 w yerr``` to plot with the error bar on x:y:stddev.
