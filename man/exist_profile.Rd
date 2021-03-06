% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exist_profile.R
\name{exist_profile}
\alias{exist_profile}
\title{Query Exist.io current user}
\usage{
exist_profile(token = NULL)
}
\arguments{
\item{token}{The token environment.}
}
\value{
A list containing the information about the current user.
}
\description{
Returns information on the logged in user.
}
\examples{
\dontrun{
etoken <- exist_auth()
exist_profile(etoken)
}
}
