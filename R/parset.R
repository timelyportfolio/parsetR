#' Create a Parallel Sets Visualization
#'
#' @param data \code{table} such as \code{Titanic}
#' @param dimensions If dimensions is specified, sets the categorical dimensions to be visualised. If a function is specified, it is invoked for every element in the target selection and an array of dimension names is expected in return. If an array is specified, it should be an array of dimension names (object keys).
#'          If dimensions is not specified, returns the current dimensions.
#' @param value Specifies the value accessor. If value is not specified, returns the current value accessor. The default accessor simply returns 1 for each input data element i.e. the absolute frequency count. This value is used to set the width of the horizontal bars and connecting ribbons in proportion to the value.
#'          If the input data is a pivot table, you’ll want to set this to return the aggregate sum for each input data element. You could also use an arbitrary numerical measure instead of frequency if appropriate.
#' @param spacing Specifies the total amount of spacing in pixels to be divided between the horizontal category bars. If spacing is not specified, returns the current spacing, which defaults to 20.
#' @param tension Specifies the tension for the ribbon curves. This should be a value between 0 and 1 inclusive. If tension is not specified, returns the current tension, which defaults to 1 (straight lines).
#' @param duration Specifies the duration for the animated transitions in milliseconds. If duration is not specified, returns the current duration, which defaults to 500.
#' @param dimensionFormat Specifies a formatting function for the dimension name. If dimensionFormat is not specified, returns the current formatting function, which defaults to String.
#' @param tooltip Specifies a formatting function for the ribbon tooltip. If tooltip is not specified, returns the current formatting function.
#' @param categoryTooltip Specifies a formatting function for the category tooltip. If categoryTooltip is not specified, returns the current formatting function, which defaults to:
#' @param width,height Any valid \code{CSS} height and width for the htmlwidget container.
#' 
#' @example ./inst/examples/example.R
#'
#' @import htmlwidgets
#' @importFrom vcdExtra expand.dft
#'
#' @export
parset <- function(
  data = NULL,
  dimensions = NULL,
  value = NULL,
  spacing = NULL,
  tension = NULL,
  duration = NULL,
  dimensionFormat = NULL,
  tooltip = NULL,
  categoryTooltip = NULL,
  width = NULL,
  height = NULL
) {
  
  # if table then expand grid
  if(inherits(data, "table")){
    data = expand.dft(data)
  }
  
  # forward options using x
  x = list(
    data = data,
    options = Filter(
      Negate(is.null),
      list(
        dimensions = dimensions,
        value = value,
        spacing = spacing,
        tension = tension,
        duration = duration,
        dimensionFormat = dimensionFormat,
        tooltip = tooltip,
        categoryTooltip = categoryTooltip
      )
    )
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
