#' Query Exist.io for the owned attributes
#'
#' Returns information on the owned attributes.
#'
#' @return A list containing the owned attributes.
#' @param token The token environment.
#' @export
#' @examples
#' \dontrun{
#' etoken <- exist_auth()
#' exist_owned_attributes(etoken)
#' }
exist_owned_attributes <- function(token = NULL) {
  # Set path for query
  path <- "api/1/attributes/owned/"

  # Call wrapper function for query
  exist_package_query(token = token, path = path)
}

#' Print result of exist_owned_attributes()
#'
#' Print a structured return of the exist_owned_attributes() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the exist_owned_attributes() function.
#' @seealso \code{\link{exist_owned_attributes}}
#' @importFrom utils str
#' @export
#' @examples
#' \dontrun{
#' resp <- exist_owned_attributes()
#'
#' resp
#' }
print.exist_owned_attributes <- function(x, ...) {
  cat("<Exist ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
