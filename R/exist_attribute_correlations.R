#' Query Exist.io for all correlations for a specific attribute
#'
#' Returns information on all correlations for a specific attribute.
#'
#' This function expects the user to have the oauth token cached.
#'
#' @return A list containing the information of all correlations for a specific attribute.
#' @param attribute The attribute for which to get all correlations. Defaults to mood.
#' @param limit Number of values to return per page, starting with today. Optional, max is 100.
#' @param page Page index. Optional, default is 1.
#' @param date_min Oldest date (inclusive) of results to be returned, in format YYYY-mm-dd. Optional.
#' @param date_max Most recent date (inclusive) of results to be returned, in format YYYY-mm-dd. Optional.
#' @param latest Set this to true to return only the most recently generated batch of correlations. Use this on its own without date_min and date_max.
#' @export
#' @examples
#' \dontrun{
#' exist_attribute_correlations()
#' }
exist_attribute_correlations <- function(attribute = "mood", limit = NULL, page = 1, date_min = NULL, date_max = NULL, latest = NULL) {
  # Set path for query
  path <- paste0("api/1/users/$self/correlations/attribute/", attribute, "/")
  query <- list(limit = limit, page = page, date_min = date_min, date_max = date_max, latest = latest)

  # Call wrapper function for query
  exist_package_query(path = path, query = query)
}

#' Print result of exist_attribute_correlations()
#'
#' Print a structured return of the exist_attribute_correlations() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_attribute_correlations() function.
#' @seealso \code{\link{exist_attribute_correlations}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_attribute_correlations()
#'
#' resp
#' }
print.exist_attribute_correlations <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
