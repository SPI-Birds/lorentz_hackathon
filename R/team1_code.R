#' Convert SPI-Birds data format into format for survival analysis.
#'
#' @param input_data Data frame. Capture data table from the SPI-Birds standard format.
#' @param file Filename of .inp file to be output.
#'
#' @return Save a .inp file that includes species. Can be used for analysis in MARK.
#' @export
#'
#' @examplesa
#' \dontrun{
#' #Short example using a small number of year
#' #Return species information as well
#' input_data <- dplyr::filter(capture_data, BreedingSeason >= 2014)
#' example_output <- team1_survfunc(input_data)
#' }
team1_survfunc <- function(input_data, file){
  
  yr_range <- expand.grid(BreedingSeason = unique(input_data$BreedingSeason),
                          IndvID = unique(input_data$IndvID))
  
  annual_observations <- input_data %>% 
    dplyr::select(IndvID, BreedingSeason, Species) %>% 
    dplyr::group_by(IndvID, BreedingSeason, Species) %>% 
    dplyr::summarise(observed = 1)
  
  allyr_observations <- yr_range %>% 
    dplyr::left_join(annual_observations, by = c("IndvID", "BreedingSeason")) %>% 
    dplyr::mutate(observed = tidyr::replace_na(observed, replace = 0)) %>% 
    dplyr::arrange(IndvID, BreedingSeason) %>% 
    tidyr::fill(Species)
  
  wide_observations <- allyr_observations %>% 
    dplyr::mutate(IndvID = as.factor(IndvID)) %>% 
    tidyr::pivot_wider(names_from = BreedingSeason, values_from = observed) %>% 
    tidyr::unite(col = "obsv_string", !c(IndvID, Species), sep = "")
  
  #Unite all other columns and save as a tab space file
  inp_output_file <- wide_observations %>% 
    dplyr::select(-IndvID, obsv_string, Species) %>%
    #Create a 1 and ; column that should go at the end of the file
    dplyr::mutate(species1 = dplyr::case_when(Species == "CYACAE" ~ 1,
                                TRUE ~ 0),
           species2 = dplyr::case_when(Species == "PARMAJ" ~ 1,
                                TRUE ~ 0),
           semi = ";") %>%
    dplyr::select(-Species) %>% 
    tidyr::unite(col = col, everything(), sep = " ")
  
  write.table(inp_output_file, file = file, col.names = FALSE, row.names = FALSE, quote = FALSE)
  
  return(invisible())
  
}