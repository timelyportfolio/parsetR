# devtools::install_github("timelyportfolio/parsetR")
library(parsetR)

# using defaults
parset(Titanic)

# curved lines
parset(Titanic, tension = 0.2)
