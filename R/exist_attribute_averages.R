#' Query Exist.io for all averages for a specific attribute
#'
#' Returns information on all averages for a specific attribute.
#'
#' @return A list containing the information of all attributes for a specific attribute.
#' @param token The token environment.
#' @param attribute The attribute for which to get all insights. Defaults to mood.
#' @param limit Number of values to return per page, starting with today. Optional, max is 100.
#' @param page Page index. Optional, default is 1.
#' @param date_min Oldest date (inclusive) of results to be returned, in format YYYY-mm-dd. Optional.
#' @param date_max Most recent date (inclusive) of results to be returned, in format YYYY-mm-dd. Optional.
#' @export
#' @examples
#' \dontrun{
#' etoken <- exist_auth()
#' exist_attribute_averages(etoken)
#' }
exist_attribute_averages <- function(token = NULL, attribute = "mood", limit = NULL, page = 1, date_min = NULL, date_max = NULL) {
  # Set path for query
  path <- paste0("api/1/users/$self/averages/attribute/", attribute, "/")
  query <- list(limit = limit, page = page, date_min = date_min, date_max = date_max)

  # Call wrapper function for query
  exist_package_query(token = token, path = path, query = query)
}

#' Print result of exist_attribute_averages()
#'
#' Print a structured return of the exist_attribute_averages() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_attribute_averages() function.
#' @seealso \code{\link{exist_attribute_averages}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_attribute_averages()
#'
#' resp
#' }
print.exist_attribute_averages <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
