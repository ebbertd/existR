#' Acquire ownership for an attribute on Exist.io
#'
#' Acquire ownership for an attribute on Exist.io
#'
#' @return A status indicating if the request was successful.
#' @param token The token environment.
#' @param attribute The attribute for which to acquire ownership.
#' @param active true or false to set this attribute to active or inactive. Defaults to true.
#' @importFrom httr modify_url
#' @importFrom httr POST
#' @importFrom httr accept_json
#' @importFrom httr content_type_json
#' @importFrom jsonlite toJSON
#' @export
#' @examples
#' \dontrun{
#' etoken <- exist_auth()
#' exist_acquire_attribute(etoken)
#' }
exist_acquire_attribute <- function(token = NULL, attribute = NULL, active = "true") {
  # Construct url
  base_url <- "https://exist.io/"
  path <- "api/1/attributes/acquire/"
  url <- modify_url(base_url, path = path)

  # POST the request
  POST(url,
    # body = list(name = attribute, active = active),
    body = paste0("[", toJSON(list(name = attribute, active = active), auto_unbox = TRUE), "]"),
    encode = "json",
    config = (token <- token),
    content_type_json(),
    accept_json(),
    exist_package_useragent()
  )
}

#' Print result of exist_acquire_attribute()
#'
#' Print a structured return of the exist_acquire_attribute() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_acquire_attribute() function.
#' @seealso \code{\link{exist_acquire_attribute}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_acquire_attribute()
#'
#' resp
#' }
print.exist_acquire_attribute <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
