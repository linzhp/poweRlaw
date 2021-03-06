\docType{methods}
\name{dist_ll}
\alias{dist_ll}
\alias{dist_ll,conexp-method}
\alias{dist_ll,conlnorm-method}
\alias{dist_ll,conpl-method}
\alias{dist_ll,disexp-method}
\alias{dist_ll,dislnorm-method}
\alias{dist_ll,displ-method}
\alias{dist_ll,dispois-method}
\title{The log-likelihood function}
\arguments{
  \item{m}{The distribution reference object.}
}
\value{
  The log-likelihood
}
\description{
  This is generic function for distribution objects. This
  function calculates the log-likelihood for the current
  parameters and xmin value.
}
\note{
  This method does *not* alter the internal state of the
  distribution objects.
}
\examples{
##########################################
#Load data and create distribution object#
##########################################
data(moby_sample)
m = displ$new(moby_sample)
m$setXmin(7); m$setPars(2)

##########################################
#Calculate the log-likelihood            #
##########################################
dist_ll(m)
}
\seealso{
  \code{\link{dist_cdf}}, \code{\link{dist_pdf}} and
  \code{\link{dist_rand}}
}

