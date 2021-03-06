dis_pl_ll = function(x, pars, xmin) {
  n = length(x)
  joint_prob = colSums(sapply(pars, 
                              function(i) dpldis(x, xmin, i, log=TRUE)))
  #   ##Normalise due to xmax
  prob_over = 0
  #   if(!is.null(xmax))
  #       prob_over = sapply(pars, function(i) 
  #         log(ppldis(xmax, i, lower.tail=TRUE)))
  #   
  
  return(joint_prob - n*prob_over)
}






dis_lnorm_tail_ll = function(x, pars, xmin) {
  if(is.vector(pars)) pars = t(as.matrix(pars))
  n = length(x)
  p = function(par){
    m_log = par[1]; sd_log = par[2]
    plnorm(x-0.5, m_log, sd_log, lower.tail=FALSE) - 
      plnorm(x+0.5, m_log, sd_log, lower.tail=FALSE)
  }
  joint_prob = colSums(log(apply(pars, 1, p)))
  prob_over = apply(pars, 1, function(i) 
    plnorm(xmin-0.5, i[1], i[2], 
           lower.tail=FALSE, log.p=TRUE))
  
  return(joint_prob - n*prob_over)
}

pois_tail_ll = function(x, rate, xmin) {
  n = length(x)
  joint_prob = colSums(sapply(rate, function(i) dpois(x, i, log=TRUE)))
  prob_over = sapply(rate, function(i) ppois(xmin-1, i, 
                                             lower.tail=FALSE, log.p=TRUE))
  return(joint_prob - n*prob_over)
}

# x = c(1, 1)
# xmin = 1;pars = 1
dis_exp_tail_ll = function(x, pars, xmin) {
  n = length(x)
  joint_prob = colSums(sapply(pars, function(i) 
    log(pexp(x-0.5, i, lower.tail=FALSE) - 
          pexp(x+0.5, i, lower.tail=FALSE))))
  prob_over = sapply(pars, function(i) 
    pexp(xmin-0.5, i, lower.tail=FALSE, log.p=TRUE))
  
  return(joint_prob - n*prob_over)
}


