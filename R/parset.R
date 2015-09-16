#' Create a Parallel Sets Visualization
#'
#' @param data 
#'
#' @import htmlwidgets
#' @importFrom vcdExtra expand.dft
#'
#' @export
parset <- function(data = NULL, width = NULL, height = NULL) {
  
  # if table then expand grid
  if(inherits(data, "table")){
    data = expand.dft(data)
  }
  
  # forward options using x
  x = list(
    data = data
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'parset',
    x,
    width = width,
    height = height,
    package = 'parsetR'
  )
}

#' Shiny bindings for parset
#'
#' Output and render functions for using parset within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a parset
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name parset-shiny
#'
#' @export
parsetOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'parset', width, height, package = 'parsetR')
}

#' @rdname parset-shiny
#' @export
renderParset <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, parsetOutput, env, quoted = TRUE)
}
