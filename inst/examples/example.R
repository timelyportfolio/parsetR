# devtools::install_github("timelyportfolio/parsetR")
library(parsetR)

# using defaults
parset(Titanic)

# curved lines
parset(Titanic, tension = 0.2)

# examples from ggparallel
#  http://artax.karlin.mff.cuni.cz/r-help/library/ggparallel/html/ggparallel.html
#  ggparallel(list("gear", "cyl"), data=mtcars)
parset(mtcars[,c("gear","cyl")])

data(genes,package="ggparallel")
parset(genes[,c("path","chrom")])
