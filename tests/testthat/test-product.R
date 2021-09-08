test_that("Product outputs are as expected...", {
  
  #Should return an integer when input is integer
  expect_true(class(product_function(1L, 2L)) == "integer")
  
  #Should return numeric when input is numeric
  expect_true(class(product_function(1.0, 2.5)) == "numeric")
  
  #Should fail if given character
  expect_error(product_function("1.0", "2.5"))
  
})