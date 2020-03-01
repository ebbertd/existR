#' Query Exist.io for the strongest correlations across all attributes.
#'
#' Returns a list of the user’s strongest correlations across all attributes.
#'
#' @return A list containing the strongest correlations across all attributes.
#' @param token The token environment.
#' @export
#' @examples
#' \dontrun{
#' etoken <- exist_auth()
#' exist_strongest_correlations(etoken)
#' }
exist_strongest_correlations <- function(token = NULL) {
  # Set path for query
  path <- "api/1/users/$self/correlations/strongest/"

  # Call wrapper function for query
  exist_package_query(token = token, path = path)
}

#' Print result of exist_strongest_correlations()
#'
#' Print a structured return of the exist_strongest_correlations() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_strongest_correlations() function.
#' @seealso \code{\link{exist_strongest_correlations}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_strongest_correlations()
#'
#' resp
#' }
print.exist_strongest_correlations <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
