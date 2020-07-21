set terminal pdf enhanced font "Times,9" size 3,4
set output "multiplot.pdf"

set boxwidth 0.9 relative
set style  fill transparent solid 0.5

set grid

set xlab "Quantity"
set ylab "Average and Standard deviation"

# Customize errorbars
set errorbars 1.5

# Filename
dir="datafiles/"

set multi layout 2,3

unset key

set xrange [0:15]

do for [i=1:6] {
#	This is the file dir/f.1, dir/f.2, etc.
	stats dir."f.".(i) noout;
	plot dir."f.".(i) u 1 w boxes lc rgb "blue" not,\
	"" u 0:1:($1-1):($1+0.1*$1) w yerr lw 1 pt 3 ps .3 lc rgb "blue" t "Measuremets"
#	This is x:y:ylow:yhigh
}
