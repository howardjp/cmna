% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cubicspline.R
\name{cubicspline}
\alias{cubicspline}
\title{Natural cubic spline interpolation}
\usage{
cubicspline(x, y)
}
\arguments{
\item{x}{a vector of x values}

\item{y}{a vector of y values}
}
\value{
a list of coefficient vectors
}
\description{
Finds a piecewise linear function that interpolates the data points
}
\details{
\code{cubicspline} finds a piecewise cubic spline function that
interpolates the data points.  For each x-y ordered pair. The function will
return a list of four vectors representing the coefficients.
}
\examples{
x <- c(1, 2, 3)
y <- c(2, 3, 5)
f <- cubicspline(x, y)

x <- c(-1, 1, 0, -2)
y <- c(-2, 2, -1, -1)
f <- cubicspline(x, y)

}
\seealso{
Other interp: \code{\link{bezier}}, \code{\link{bilinear}},
  \code{\link{linterp}}, \code{\link{nn}},
  \code{\link{polyinterp}}, \code{\link{pwiselinterp}}

Other algebra: \code{\link{bilinear}},
  \code{\link{division}}, \code{\link{fibonacci}},
  \code{\link{horner}}, \code{\link{isPrime}},
  \code{\link{linterp}}, \code{\link{nthroot}},
  \code{\link{polyinterp}}, \code{\link{pwiselinterp}},
  \code{\link{quadratic}}
}
\concept{algebra}
\concept{interp}
