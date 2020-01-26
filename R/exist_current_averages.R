#' Query Exist.io for the most recent averages.
#'
#' Returns the most recent average values for each attribute.
#'
#' This function expects the user to have the oauth token cached.
#'
#' @return A list containing the most recent averages.
#' @export
#' @examples
#' \dontrun{
#' exist_current_averages()
#' }
exist_current_averages <- function() {
  # Set path for query
  path <- "api/1/users/$self/averages/"

  # Call wrapper function for query
  exist_package_query(path = path)
}

#' Print result of exist_current_averages()
#'
#' Print a structured return of the exist_current_averages() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_current_averages() function.
#' @seealso \code{\link{exist_current_averages}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_current_averages()
#'
#' resp
#' }
print.exist_current_averages <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
