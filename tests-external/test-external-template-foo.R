## ---- test-external-template-foo
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    message(text)
    x <- stats::rnorm(n = 1)
    y <- stats::rnorm(n = 1)
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
  text = "test-external-template-foo"
)
