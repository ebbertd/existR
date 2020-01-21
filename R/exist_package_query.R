#' Query Exist.io api
#'
#' Returns information on the logged in user.
#'
#' This function expects the user to have the oauth token cached.
#'
#' @return The response of the API call
#' @param query_path The API path to query.
#' @importFrom httr modify_url
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom httr content
#' @export
#' @examples
#' \donttest{
#' exist_package_query(query_path = "api/1/users/$self/profile/")
#' }
exist_package_query <- function(query_path = "api/1/users/$self/profile/") {
  # Check if .httr-oauth file exists
  if (!file.exists('.httr-oauth')) {
    stop("You did not authenticate to Exist.io yet. Please use exist_auth() before using this function.", call. = FALSE)
  }

  # Construct URL for API call
  base_url <- "https://exist.io/"
  url <- modify_url(base_url, path = query_path)

  # Get the token
  exist_token <- readRDS('.httr-oauth')
  exist_token <- exist_token[[1]]

  # Query the url
  resp <- GET(url,
              config = (
                token = exist_token
              ),
              exist_package_useragent())

  # Parse the content
  parsed <- fromJSON(content(resp, "text", encoding = "UTF-8"), simplifyVector = FALSE)

  # Return the parsed content
  structure(
    list(
      content = parsed,
      path = query_path,
      response = resp
    ),
    class = "exist_api"
  )
}
