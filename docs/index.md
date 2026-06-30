# tidyvegan: an R package for community ecologists

Ordination methods, diversity analysis and other functions for community
and vegetation ecologists, now with tidyverse-compatible wrappers.

Website for the development version of the **tidyvegan** package.

## Tidy Wrappers

**tidyvegan** includes pipe-friendly wrappers (prefixed with `t_`) for
the most common functions in the original **vegan** package. These
wrappers take a data frame or tibble as their first argument, making
them easy to use with the native pipe operator (`|>`) or `magrittr` pipe
(`%>%`).

Available wrappers: -
[`t_cca()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Canonical Correspondence Analysis) -
[`t_rda()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Redundancy Analysis) -
[`t_metaMDS()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Non-metric Multidimensional Scaling) -
[`t_vegdist()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Dissimilarity Indices) -
[`t_decostand()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Standardization Methods) -
[`t_adonis2()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Permutational Multivariate Analysis of Variance) -
[`t_anosim()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Analysis of Similarities) -
[`t_mrpp()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Multiple Response Permutation Procedure) -
[`t_specaccum()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Species Accumulation Curves) -
[`t_rarecurve()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Rarefaction Curves) -
[`t_rarefy()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md),
[`t_rrarefy()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md),
[`t_drarefy()`](https://pefrens.github.io/tidyvegan/reference/t_wrappers.md)
(Rarefaction)

Example usage:

``` r

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

``` r

# install.packages("remotes")
remotes::install_github("pefrens/tidyvegan")
```
