#' Query Exist.io current users day
#'
#' Returns information on the current day of the logged in user.
#'
#' This function expects the user to have the oauth token cached.
#'
#' @return A list containing the information about the current day of the user.
#' @export
#' @examples
#' \dontrun{
#' exist_today()
#' }
exist_today <- function() {
  # Set path for query
  path <- "api/1/users/$self/today/"

  # Call wrapper function for query
  exist_package_query(path = path)
}

#' Print result of exist_today()
#'
#' Print a structured return of the exist_today() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_today() function.
#' @seealso \code{\link{exist_today}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_today()
#'
#' resp
#' }
print.exist_today <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
