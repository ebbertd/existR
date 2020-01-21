#' Query Exist.io current user
#'
#' Returns information on the logged in user.
#'
#' This function expects the user to have the oauth token cached.
#'
#' @return A list containing the information about the current user.
#' @export
#' @examples
#' \donttest{
#' exist_profile()
#' }
exist_profile <- function() {
  # Set path for query
  path <- "api/1/users/$self/profile/"

  # Call wrapper function for query
  exist_package_query(query_path = path)
}

#' Print result of exist_profile()
#'
#' Print a structured return of the exist_profile() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_profile() function.
#' @seealso \code{\link{exist_profile}}
#' @importFrom utils str
#' @export
#' @examples
#' \donttest{
#' resp <- exist_profile()
#'
#' resp
#' }
print.exist_profile <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
