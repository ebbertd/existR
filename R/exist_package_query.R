#' Query Exist.io API
#'
#' Returns information on the logged in user.
#'
#' @return The response of the API call
#' @param token The token environment.
#' @param path The API path to query.
#' @param query A list of query parameters.
#' @importFrom httr modify_url
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom httr content
#' @export
#' @examples
#' \dontrun{
#' etoken <- exist_auth()
#' exist_package_query(token = etoken, path = "api/1/users/$self/profile/")
#' }
exist_package_query <- function(token = NULL, path = "api/1/users/$self/profile/", query = NULL) {
  # Construct URL for API call
  base_url <- "https://exist.io/"
  url <- modify_url(base_url, path = path)

  # Query the url
  resp <- GET(url,
    query = query,
    config = (
      token <- token
    ),
    exist_package_useragent()
  )

  # Parse the content
  parsed <- fromJSON(content(resp, "text", encoding = "UTF-8"), simplifyVector = FALSE)

  # Return the parsed content
  structure(
    list(
      content = parsed,
      path = path,
      response = resp
    ),
    class = "exist_api"
  )
}
