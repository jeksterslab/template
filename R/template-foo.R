#' foo
#'
#' Sum function.
#'
#' @author Ivan Jacob Agaloos Pesigan
#' @param x Numeric.
#' @param y Numeric.
#' @export
#' @family Template
#' @keywords template
foo <- function(x, y) {
  stopifnot(
    is.numeric(x),
    is.numeric(y)
  )
  return(x + y)
}
