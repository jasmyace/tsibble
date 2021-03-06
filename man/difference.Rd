% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/time-wise.R
\name{difference}
\alias{difference}
\title{Lagged differences}
\usage{
difference(x, lag = 1, differences = 1, default = NA, order_by = NULL)
}
\arguments{
\item{x}{Vector of values}

\item{lag}{A positive integer indicating which lag to use.}

\item{differences}{A positive integer indicating the order of the difference.}

\item{default}{Value used for non-existent rows. Defaults to \code{NA}.}

\item{order_by}{Override the default ordering to use another vector or column}
}
\value{
A numeric vector of the same length as \code{x}.
}
\description{
\lifecycle{stable}
}
\examples{
# examples from base
difference(1:10, 2)
difference(1:10, 2, 2)
x <- cumsum(cumsum(1:10))
difference(x, lag = 2)
difference(x, differences = 2)
# Use order_by if data not already ordered (example from dplyr)
library(dplyr, warn.conflicts = FALSE)
tsbl <- tsibble(year = 2000:2005, value = (0:5)^2, index = year)
scrambled <- tsbl \%>\% slice(sample(nrow(tsbl)))

wrong <- mutate(scrambled, diff = difference(value))
arrange(wrong, year)

right <- mutate(scrambled, diff = difference(value, order_by = year))
arrange(right, year)
}
\seealso{
\link[dplyr:lead]{dplyr::lead} and \link[dplyr:lag]{dplyr::lag}
}
