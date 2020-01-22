#' Query Exist.io api
#'
#' Returns information on the logged in user.
#'
#' This function expects the user to have the oauth token cached.
#'
#' @return The response of the API call
#' @param path The API path to query.
#' @param query A list of query parameters.
#' @importFrom httr modify_url
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom httr content
#' @export
#' @examples
#' \dontrun{
#' exist_package_query(path = "api/1/users/$self/profile/")
#' }
exist_package_query <- function(path = "api/1/users/$self/profile/", query = NULL) {
  # Check if .httr-oauth file exists
  if (!file.exists(".httr-oauth")) {
    stop("You did not authenticate to Exist.io yet. Please use exist_auth() before using this function.", call. = FALSE)
  }

  # Construct URL for API call
  base_url <- "https://exist.io/"
  url <- modify_url(base_url, path = path)

  # Get the token
  exist_token <- readRDS(".httr-oauth")
  exist_token <- exist_token[[1]]

  # Query the url
  resp <- GET(url,
    query = query,
    config = (
      token <- exist_token
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
