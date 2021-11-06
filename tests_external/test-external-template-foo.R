## ---- test-external-template-foo
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    message(text)
    x <- rnorm(n = 1)
    y <- rnorm(n = 1)
    testthat::test_that(
      text,
      {
        testthat::expect_equal(
          foo(x, y),
          x + y
        )
      }
    )
  },
  text = "test-external-template-foo"
)
