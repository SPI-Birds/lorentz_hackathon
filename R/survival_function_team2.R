#CAP <- read.csv(r"(C:\Users\stefanvr\Downloads\OneDrive_1_9-8-2021\Hackathon_data_Capture_data.csv)")

convert_survival_format <- function(capture_data) {

  capture_data %>%
    # Select variables
    dplyr::select(IndvID, Species, BreedingSeason, CapturePopID) %>%
    # Retain 1 record per individual per year
    dplyr::distinct() %>%
    # Order by year
    dplyr::arrange(BreedingSeason, CapturePopID) %>%
    dplyr::mutate(Observed = 1) %>%
    # Transform to wide format (individuals in rows, years and additional attributes in columns)
    tidyr::pivot_wider(names_from = BreedingSeason,
                       values_from = Observed,
                       values_fill = 0) %>%
    # Concatenate yearly observations into capture history
    tidyr::unite("ch",
                 # Select numeric columns (years)
                 tidyselect::num_range(prefix = "", range = tidyr::full_seq(range(data$BreedingSeason), 1)),
                 sep = "")

  #TODO: Make select more generic
  #TODO: Add filter so that user can subset years, populations, species, etc.
  #TODO: Add possibility to add other structures (age structure, stage structure, etc.) to capture history matrix
  #TODO: Add variable output formats (inp, matrix, etc.)

}
