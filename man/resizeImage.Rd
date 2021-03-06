% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/resizeImage.R
\name{resizeImage}
\alias{resizeImage}
\alias{resizeImageNN}
\alias{resizeImageBL}
\title{Image resizing}
\usage{
resizeImageNN(imx, width, height)

resizeImageBL(imx, width, height)
}
\arguments{
\item{imx}{a 3-dimensional array containing image data}

\item{width}{the new width}

\item{height}{the new height}
}
\value{
a three-dimensional array containing the resized image.
}
\description{
Resize images using nearest neighbor and
}
\details{
The \var{resizeImageNN} function uses the nearest neighbor method to
resize the image.  Also, \var{resizeImageBL} uses bilinear
interpolation to resize the image.
}
\concept{interpolation}
