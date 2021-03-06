\name{dplcon}
\alias{dplcon}
\alias{pplcon}
\alias{rplcon}
\title{The continuous powerlaw distribution

Density and distribution function of the continuous power-law distribution, with
parameters xmin and alpha.}
\usage{
  dplcon(x, xmin, alpha, log = FALSE)

  pplcon(q, xmin, alpha, lower.tail = TRUE)

  rplcon(n, xmin, alpha)
}
\arguments{
  \item{x,q}{vector of quantiles. The discrete power-law
  distribution is defined for x > xmin}

  \item{xmin}{The lower bound of the power-law
  distribution. For the continuous power-law, xmin >= 0 for
  the discrete distribution, xmin >0}

  \item{alpha}{The scaling parameter: alpha > 1}

  \item{log}{logical (default FALSE) if TRUE, log values
  are returned}

  \item{lower.tail}{logical; if TRUE (default),
  probabilities are \eqn{P[X \le x]}, otherwise, \eqn{P[X >
  x]}.}

  \item{n}{number of observations.}
}
\value{
  dplcon gives the denisty and pplcon gives the
  distribution function.
}
\description{
  The continuous powerlaw distribution

  Density and distribution function of the continuous
  power-law distribution, with parameters xmin and alpha.
}
\note{
  The discrete random number generator is very inefficient
}
\examples{
xmin = 1; alpha = 1.5
x = seq(xmin, 10, length.out=1000)
plot(x, dplcon(x, xmin, alpha), type="l")
plot(x, pplcon(x, xmin, alpha), type="l", main="Distribution function")
n = 1000
con_rns = rplcon(n, xmin, alpha)
con_rns = sort(con_rns)
p = rep(1/n, n)
#Zipfs plot
plot(con_rns, rev(cumsum(p)), log="xy", type="l")
}

