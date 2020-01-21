#' existR user agent
#'
#' This function returns the user agent used in api calls of the existR package.
#'
#' @return A character string containing the user agent used in api calls generate with the existR package.
#' @importFrom httr user_agent
#' @export
#' @examples
#' exist_package_useragent()
exist_package_useragent <- function() {
  ua <- user_agent("http://github.com/ebbertd/existR")
  ua
}