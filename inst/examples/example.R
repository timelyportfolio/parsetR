# devtools::install_github("timelyportfolio/parsetR")
library(parsetR)

# using defaults
parset(Titanic)

# curved lines
parset(Titanic, tension = 0.2)

# with HairEyeColor
parset(HairEyeColor)

# examples from ggparallel
#  http://artax.karlin.mff.cuni.cz/r-help/library/ggparallel/html/ggparallel.html
#  ggparallel(list("gear", "cyl"), data=mtcars)
parset(mtcars[,c("gear","cyl")])

data(genes,package="ggparallel")
parset(genes[,c("path","chrom")])


# demonstrate working with non-table
data(Alligator, package="vcdExtra")
# with data.frame to demo how it doesn't work
parset(Alligator)
# contrived example converting to data.frame first
parset(
  Alligator,
  # dimensions are the categorical columns
  dimensions = colnames(Alligator)[-5],
  # use some JavaScript to inform parset that Freq has the value
  value = htmlwidgets::JS("function(d){return d.count}")
)

