#' Authenticate to Exist.io
#'
#' Authenticates the user to Exist.io using OAuth2.0.
#'
#' This function stores the users auth token localy. This requires the client id and client secret to be available as environment variables.
#'
#' @importFrom httr oauth_endpoint
#' @importFrom httr oauth_app
#' @importFrom httr oauth2.0_token
#' @export
#' @examples
#' \dontrun{
#' Sys.setenv(EXIST_CLIENT_ID = "PASTE_YOUR_ID_HERE")
#' Sys.setenv(EXIST_CLIENT_SECRET = "PASTE_YOUR_SECRET_HERE")
#'
#' exist_auth()
#' }
exist_auth <- function() {
  # Remove previously saved auth
  if (file.exists(".httr-oauth")) {
    file.remove(".httr-oauth")
  }

  # Construct the OAuth endpoint
  exist_oauth_endpoint <- oauth_endpoint(
    request = NULL,
    authorize = "https://exist.io/oauth2/authorize",
    access = "https://exist.io/oauth2/access_token"
  )

  # Specify the web app information
  exist_webapp <- oauth_app(
    "exist",
    key = Sys.getenv("EXIST_CLIENT_ID"),
    secret = Sys.getenv("EXIST_CLIENT_SECRET"),
    redirect_uri = "https://localhost:1410/"
  )

  # Get an cache the oauth token
  exist_token <- oauth2.0_token(
    endpoint = exist_oauth_endpoint,
    app = exist_webapp,
    scope = "read+write",
    query_authorize_extra = list(response_type = "code"),
    cache = TRUE
  )

  # Return token
  return(exist_token)
}
