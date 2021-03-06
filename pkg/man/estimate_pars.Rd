\name{estimate_pars}
\alias{estimate_pars}
\title{Estimates the distributions using mle.}
\usage{
  estimate_pars(m, pars = NULL)
}
\arguments{
  \item{m}{A reference class object that contains the
  data.}

  \item{pars}{default NULL. A vector of parameters used to
  optimise over. Otherwise, for each value of xmin, the mle
  will be used, i.e. \code{estimate_pars(m)}. For small
  samples, the mle may be biased.}
}
\value{
  returns list.
}
\description{
  \code{estimate_pars} estimates the distribution's
  parameters using their maximum likelihood estimator. This
  estimate is conditional on the current xmin value.
}
\examples{
data(moby_sample)
m = displ$new(moby_sample)
estimate_xmin(m)
m$setXmin(7)
estimate_pars(m)
}

