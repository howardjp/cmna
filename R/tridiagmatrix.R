## Copyright (c) 2016, James P. Howard, II <jh@jameshoward.us>
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions are
## met:
##
##     Redistributions of source code must retain the above copyright
##     notice, this list of conditions and the following disclaimer.
##
##     Redistributions in binary form must reproduce the above copyright
##     notice, this list of conditions and the following disclaimer in
##     the documentation and/or other materials provided with the
##     distribution.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
## "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
## LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
## A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
## HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
## SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
## LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
## DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
## THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
## (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
## OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#' @title Solve a tridiagonal matrix
#'
#' @description
#' use the tridiagonal matrix algorithm to solve a tridiagonal matrix
#'
#' @param D vector of entries on the main diagonal
#' @param L vector of entries below the main diagonal
#' @param U vector of entries above the main diagonal
#' @param b vector of the right-hand side of the linear system
#'
#' @details
#' \code{tridiagmatrix} uses the tridiagonal matrix algorithm to solve a
#' tridiagonal matrix.
#'
#' @return the solution vector
#'
#' @family linear
#'
#' @export
tridiagmatrix <- function(L, D, U, b) {
    n <- length(D)
    L <- c(NA, L)

    ##  The forward sweep
    U[1] <- U[1] / D[1]
    b[1] <- b[1] / D[1]
    for(i in 2:(n - 1)) {
        U[i] <- U[i] / (D[i] - L[i] * U[i - 1])
        b[i] <- (b[i] - L[i] * b[i - 1]) /
            (D[i] - L[i] * U[i - 1])
    }
    b[n] <- (b[n] - L[n] * b[n - 1]) /
        (D[n] - L[n] * U[n - 1])

    ##  The backward sweep
    x <- rep.int(0, n)
    x[n] <- b[n]
    for(i in (n - 1):1)
        x[i] <- b[i] - U[i] * x[i + 1]

    return(x)
}
