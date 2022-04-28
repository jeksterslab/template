## ---- test-template-foo
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
          Foo(x, y),
          x + y
        )
      }
    )
  },
  text = "test-template-foo"
)
