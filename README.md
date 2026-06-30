# tidyvegan: an R package for community ecologists

Ordination methods, diversity analysis and other functions for community and
vegetation ecologists, now with tidyverse-compatible wrappers.

<!-- badges: start -->
[![R-CMD-check](https://github.com/pefrens/tidyvegan/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/pefrens/tidyvegan/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Website for the development version of the **tidyvegan** package.

## Tidy Wrappers

**tidyvegan** includes pipe-friendly wrappers (prefixed with `t_`) for the most common functions in the original **vegan** package. These wrappers take a data frame or tibble as their first argument, making them easy to use with the native pipe operator (`|>`) or `magrittr` pipe (`%>%`).

Available wrappers:
- `t_cca()` (Canonical Correspondence Analysis)
- `t_rda()` (Redundancy Analysis)
- `t_metaMDS()` (Non-metric Multidimensional Scaling)
- `t_vegdist()` (Dissimilarity Indices)
- `t_decostand()` (Standardization Methods)
- `t_adonis2()` (Permutational Multivariate Analysis of Variance)
- `t_anosim()` (Analysis of Similarities)
- `t_mrpp()` (Multiple Response Permutation Procedure)
- `t_specaccum()` (Species Accumulation Curves)
- `t_rarecurve()` (Rarefaction Curves)
- `t_rarefy()`, `t_rrarefy()`, `t_drarefy()` (Rarefaction)

Example usage:
```R
library(tidyvegan)
library(dplyr)

# Standardize and compute Bray-Curtis distance in a pipeline
dune_dist <- dune |>
  t_decostand("total") |>
  t_vegdist("bray")

# Run NMDS directly on the pipeline output
nmds_result <- dune |>
  t_metaMDS()
```

## Installation

You can install the development version of **tidyvegan** from GitHub:

```r
# install.packages("remotes")
remotes::install_github("pefrens/tidyvegan")
```
