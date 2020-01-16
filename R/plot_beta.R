
plot_beta <- function(alpha, beta){
  ggplot(data = data.frame(x = c(0, 1)),
         aes(x)) +
    stat_function(fun = dbeta,
                  n = 101,
                  args = list(shape1 = alpha,
                              shape2=beta)) +
    labs(x = expression(pi), y =
           expression(paste("f(",pi,")")))
}

plot_beta(3, 17)
