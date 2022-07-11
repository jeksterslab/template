#' Format Number
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param x Numeric.
#' @param digits Integer.
#'   Decimal places.
#' @param nozero Logical.
#'   If `TRUE`, no leading zeroes before the decimal point.
#'
#' @returns A matrix.
#'
#' @examples
#' format_num(0.1092, digits = 2, nozero = FALSE)
#' format_num(0.1092, digits = 2, nozero = TRUE)
#' @export
#' @family Bibliography Functions
#' @keywords texTools format internal
.FormatNum <- function(x,
                       digits = 2,
                       nozero = TRUE) {
  y <- format(
    round(
      x,
      digits = digits
    ),
    nsmall = digits
  )
  if (nozero) {
    y <- sub("^0+", "", y)
    y <- sub("^-0+", "", y)
  }
  trimws(y)
}
