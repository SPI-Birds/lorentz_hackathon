# Lorentz Workshop: Hackathon

As part of the Lorentz Workshop: FAIR Data for the ‘Long Tail of Science’, we will be running two short coding sessions to work with the SPI-Birds standard data. See the documentation for the standard format [here](https://github.com/SPI-Birds/documentation/blob/master/standard_protocol/SPI_Birds_Protocol_v1.1.0.pdf).

## Goals

We want to create a **function** that can convert the SPI-Birds standard format into a data structure that is suitable for use in a survival analysis. This data should at least retain information on population, species, and date of first capture. The data in the standard format is available on Microsoft Teams as 'Hackathon_data.RDS' or as separate '.csv' files.

## Coding standards

### Coding language

We would prefer code to be written in R. If there are enough people interested in working in Python we can also form a Python team.

### Coding syntax in R

The SPI-Birds team mostly works using the `tidyverse` packages. If you're comfortable with the `tidyverse` please try and use these packages to improve compatablity with existing code. Of course, if you're more comfortable using base R (or any other set of packages) then please feel free to work this way!

### Functions and documentation

The finished product should be a *function* that takes data in the SPI-Birds standard format and outputs a data frame that can be used for survival analysis (e.g. Cox proportional hazard model).

Functions should have documentation that describes all input arguments and provides a basic example. In RStudio this can be achieved using `roxygen2` (try the shortcut Ctrl/Cmd + Alt + Shift + R).

### Test code

Each function should also include test code that ensures the function works as expected. Tests should consider things like: how does the function respond to different inputs (e.g. one population or multiple populations)? Can the function deal with missing arguments? Consider using the [R package `testthat`](https://cran.r-project.org/web/packages/testthat/testthat.pdf) for writing tests. For those that want to go even further in testing their function, consider the [R package `fuzzr`](https://cran.r-project.org/web/packages/fuzzr/vignettes/fuzzr.html) to carry out fuzz testing.

## (Rough) Schedule

### Wednesday 08/09/21

- 14:00: Introduce ourselves and our skills. Split into teams.

- 14:15: Start coding!

- 14:50: How far have we got? What difficulties did people encounter?

- 15:00: Session ends.

### Thursday 09/09/21

- 14:00: Start coding again! Try and use this time to make clean documentation and tests.

- 14:30: Each team will present their finished function.