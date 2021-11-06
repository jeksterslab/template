## ---- test-benchmark-template-foo
lapply(
  X = 1,
  FUN = function(i) {
    x <- rnorm(n = 1)
    y <- rnorm(n = 1)
    output <- microbenchmark::microbenchmark(
      foo(x, y),
      x + y
    )
    print(output)
    ggplot2::autoplot(output)
  }
)
