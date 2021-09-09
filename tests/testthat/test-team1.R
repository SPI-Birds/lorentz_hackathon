test_that("team1 function works as expected...", {
  
  #Ask for a file with capture data
  message("Please link to capture data")
  capture_data <- read.csv(file.choose(), header = TRUE, sep = ",")
  
  #Filter it to just be 1 year for testing
  input_data <- capture_data %>% 
    dplyr::filter(BreedingSeason == 2014)
  
  #Function should return NULL (i.e. return(invisible()))
  expect_equal(team1_survfunc(input_data, file = "testfile.inp"), NULL)
  
})