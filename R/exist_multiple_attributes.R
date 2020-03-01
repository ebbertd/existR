#' Query Exist.io for multiple attributes
#'
#' Returns information on multiple attributes.
#'
#' @return A list containing the information about the current day of the user.
#' @param token The token environment.
#' @param limit Number of values to return, starting with the newest date. Optional, max is 31.
#' @param attributes Optional comma-separated list of attributes, e.g. mood,mood_note.
#' @param groups Optional comma-separated list of groups to filter attributes by, e.g. mood,health
#' @param date_max Optional date specifying the newest value that can be returned, in format YYYY-mm-dd.
#' @export
#' @examples
#' \dontrun{
#' etoken <- exist_auth()
#' exist_multiple_attributes()
#' }
exist_multiple_attributes <- function(token = NULL, limit = NULL, attributes = NULL, groups = NULL, date_max = NULL) {
  # Set path for query
  path <- "api/1/users/$self/attributes/"
  query <- list(limit = limit, attributes = attributes, groups = groups, date_max = date_max)

  # Call wrapper function for query
  exist_package_query(token = token, path = path, query = query)
}

#' Print result of exist_multiple_attributes()
#'
#' Print a structured return of the exist_multiple_attributes() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_multiple_attributes() function.
#' @seealso \code{\link{exist_multiple_attributes}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_multiple_attributes()
#'
#' resp
#' }
print.exist_multiple_attributes <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
