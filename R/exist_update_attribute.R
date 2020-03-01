#' Update an attribute on Exist.io
#'
#' Update an attribute on Exist.io
#'
#' @return A status indicating if the request was successful.
#' @param token The token environment.
#' @param attribute The attribute to update.
#' @param date String of format YYYY-mm-dd.
#' @param value A valid value for this attribute type: string, integer, or float.
#' @importFrom httr modify_url
#' @importFrom httr POST
#' @importFrom httr accept_json
#' @importFrom httr content_type_json
#' @importFrom jsonlite toJSON
#' @export
#' @examples
#' \dontrun{
#' etoken <- exist_auth()
#' exist_update_attribute(token = etoken)
#' }
exist_update_attribute <- function(token = NULL, attribute = NULL, date = NULL, value = NULL) {
  # Construct url
  base_url <- "https://exist.io/"
  path <- "api/1/attributes/update/"
  url <- modify_url(base_url, path = path)

  # POST the request
  POST(url,
    # body = list(name = attribute, active = active),
    body = paste0("[", toJSON(list(name = attribute, date = date, value = value), auto_unbox = TRUE), "]"),
    encode = "json",
    config = (token <- token),
    content_type_json(),
    accept_json(),
    exist_package_useragent()
  )
}

#' Print result of exist_update_attribute()
#'
#' Print a structured return of the exist_update_attribute() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_update_attribute() function.
#' @seealso \code{\link{exist_update_attribute}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_update_attribute()
#'
#' resp
#' }
print.exist_update_attribute <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
