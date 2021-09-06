## ---- test-template-foo
x_i <- rnorm(n = 1)
y_i <- rnorm(n = 1)
testthat::test_that("foo", {
  testthat::expect_equal(
    foo(x_i, y_i),
    x_i + y_i
  )
})
rm(
  x_i,
  y_i
)
