set terminal pdf enhanced font "Times,12"
set output "plot.pdf"

set boxwidth 0.9 relative
set style  fill transparent solid 0.5

set grid

set xlab "Quantity"
set ylab "Average and Standard deviation"

# Customize errorbars
set errorbars 3.0

# Filename
dir="datafiles/"

# First, setup a dummy text file
tfile="/tmp/file.dat"
set print tfile

do for [i=1:6] {
#	This is the file dir/f.1, dir/f.2, etc.
	stats dir."f.".(i) nooutput
	print STATS_mean, STATS_stddev
}

# Reset print to the normal output
set print

plot tfile u 1 w boxes lc rgb "blue" not,\
tfile u 0:1:2 w yerr lw 1 pt 3 ps .3 lc rgb "blue" t "Measuremets"
