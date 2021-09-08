#' Return the product of two numbers
#' 
#' Takes to numbers (numeric or integer) and returns
#' the product
#'
#' @param a Integer or numeric. First value to multiply.
#' @param b Integer or numeric. Second value to multiply.
#'
#' @return An integer or numeric. The product of a and b
#' @export
#'
#' @examples
#' #Input integers
#' product_function(1L, 2L)
#' 
#' #Input numeric
#' product_function(1.0, 2.5)
product_function <- function(a, b){
  
  if ("character" %in% c(class(a), class(b))) {
    
    stop("Does not accept characters!!")
    
  }
  
  a * b
  
}

##Example of fuzzing!
#If we're interaction
if (interactive()) {
  
  library(fuzzr)
  
  #What happens when we give different inputs to a?
  fuzz_results <- fuzz_function(product_function, "a", b = 2)
  
  #Can be displayed as df with kable
  #Would recommend for nicer viewing
  library(knitr)
  library(kableExtra)
  as.data.frame(fuzz_results) %>% 
    kable() %>%
    kable_styling("condensed") 
  
}
