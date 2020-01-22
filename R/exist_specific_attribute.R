#' Query Exist.io for a specific attribute
#'
#' Returns information on a specific attribute.
#'
#' This function expects the user to have the oauth token cached.
#'
#' @return A list containing the information about the current day of the user.
#' @param attribute The name of the attribute to get.
#' @param limit Number of values to return per page. Optional, max is 100.
#' @param page Page index. Optional, default is 1.
#' @param date_max Most recent date (inclusive) of results to be returned, in format YYYY-mm-dd. Optional.
#' @export
#' @examples
#' \dontrun{
#' exist_specific_attribute()
#' }
exist_specific_attribute <- function(attribute = "", limit = NULL, page = 1, date_max = NULL) {
  if (attribute == "") {
    stop("Please specify an attribute.", call. = FALSE)
  }

  # Set path for query
  path <- paste0("api/1/users/$self/attributes/", attribute, "/")
  query <- list(limit = limit, page = page, date_max = date_max)

  # Call wrapper function for query
  exist_package_query(path = path, query = query)
}

#' Print result of exist_specific_attribute()
#'
#' Print a structured return of the exist_specific_attribute() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_specific_attribute() function.
#' @seealso \code{\link{exist_specific_attribute}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_specific_attribute()
#'
#' resp
#' }
print.exist_specific_attribute <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
