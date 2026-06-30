# Tidy Wrappers for vegan Functions

These functions are tidyverse-compatible wrappers for the core functions
of the tidyvegan package. They are designed to be pipe-friendly by
taking a data frame, tibble, or matrix as their first argument.

## Usage

``` r
t_cca(data, formula, ...)

t_rda(data, formula, ...)

t_metaMDS(data, ...)

t_vegdist(data, method = "bray", ...)

t_decostand(data, method, MARGIN, ...)

t_adonis2(data, formula, ...)

t_anosim(data, grouping, ...)

t_mrpp(data, grouping, ...)

t_specaccum(data, ...)

t_rarecurve(data, ...)

t_rarefy(data, sample, ...)

t_rrarefy(data, sample)

t_drarefy(data, sample)
```

## Arguments

- data:

  A data frame, tibble, or matrix. For constrained ordination, this is
  either the community data (if formula is missing) or the environmental
  data (if formula is provided).

- formula:

  A formula specifying the model.

- ...:

  Additional arguments passed to the underlying function.

- method:

  Dissimilarity index or transformation method.

- MARGIN:

  Margin on which the operation is applied (1 for rows, 2 for columns).

- grouping:

  A grouping vector or factor.

- sample:

  Size of the sample to draw.
