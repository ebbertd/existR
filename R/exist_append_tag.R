#' Append a tag on Exist.io
#'
#' Append a tag on Exist.io
#'
#' @return A status indicating if the request was successful.
#' @param token The token environment.
#' @param value The tag to append.
#' @param date Optional string of format YYYY-mm-dd. If omitted, current day is assumed.
#' @importFrom httr modify_url
#' @importFrom httr POST
#' @importFrom httr accept_json
#' @importFrom httr content_type_json
#' @importFrom jsonlite toJSON
#' @export
#' @examples
#' \dontrun{
#' etoken <- exist_auth()
#' exist_append_tag(etoken)
#' }
exist_append_tag <- function(token = NULL, value = NULL, date = NULL) {
  # Construct url
  base_url <- "https://exist.io/"
  path <- "api/1/attributes/custom/append/"
  url <- modify_url(base_url, path = path)

  # POST the request
  POST(url,
    # body = list(name = attribute, active = active),
    body = paste0("[", toJSON(list(value = value, date = date), auto_unbox = TRUE), "]"),
    encode = "json",
    config = (token <- token),
    content_type_json(),
    accept_json(),
    exist_package_useragent()
  )
}

#' Print result of exist_append_tag()
#'
#' Print a structured return of the exist_append_tag() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_append_tag() function.
#' @seealso \code{\link{exist_append_tag}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_append_tag()
#'
#' resp
#' }
print.exist_append_tag <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
