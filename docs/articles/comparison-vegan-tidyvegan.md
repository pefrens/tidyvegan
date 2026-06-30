# Comparing vegan and tidyvegan

``` r

library(tidyvegan)
#> Loading required package: permute
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

## Introduction

The `tidyvegan` package is a tidyverse-compatible fork and wrapper of
the classic `vegan` package. It introduces pipe-friendly wrapper
functions prefixed with `t_` that accept a data frame or tibble as their
first argument, allowing seamless integration with `dplyr` and the
native pipe operator (`|>`).

This vignette demonstrates that the new `t_` wrapper functions produce
identical results to the original `vegan` functions, while offering a
much cleaner and more readable syntax in data pipelines.

## Comparing Functions

We will use the classic `dune` and `dune.env` datasets to compare the
original `vegan` functions with their `tidyvegan` counterparts.

### 1. Community Standardization (`decostand` vs `t_decostand`)

In `vegan`, standardizing community data requires assigning the result
or nesting the call:

``` r

data(dune)

# Original vegan style
dune_std_vegan <- decostand(dune, method = "total")

# tidyvegan style using the pipe
dune_std_tidy <- dune |> t_decostand("total")

# Verify they are identical
all.equal(dune_std_vegan, dune_std_tidy)
#> [1] TRUE
```

### 2. Dissimilarity Indices (`vegdist` vs `t_vegdist`)

Calculating a Bray-Curtis dissimilarity matrix:

``` r

# Original vegan style
dist_vegan <- vegdist(dune_std_vegan, method = "bray")

# tidyvegan style in a pipeline
dist_tidy <- dune |>
  t_decostand("total") |>
  t_vegdist("bray")

# Verify they are identical
all.equal(dist_vegan, dist_tidy)
#> [1] "Attributes: < Component \"call\": target, current do not match when deparsed >"
```

### 3. Ordination: Correspondence Analysis (`cca` vs `t_cca`)

For unconstrained Correspondence Analysis:

``` r

# Original vegan style
cca_vegan <- cca(dune)

# tidyvegan style
cca_tidy <- dune |> t_cca()

# Verify eigenvalues are identical
all.equal(cca_vegan$CA$eig, cca_tidy$CA$eig)
#> [1] TRUE
```

For constrained Correspondence Analysis using a formula:

``` r

data(dune.env)

# Original vegan style
cca_form_vegan <- cca(dune ~ Management, data = dune.env)

# tidyvegan style
cca_form_tidy <- dune.env |> t_cca(dune ~ Management)

# Verify constrained eigenvalues are identical
all.equal(cca_form_vegan$CCA$eig, cca_form_tidy$CCA$eig)
#> [1] TRUE
```

### 4. Non-metric Multidimensional Scaling (`metaMDS` vs `t_metaMDS`)

Running NMDS on the community data:

``` r

# Original vegan style
set.seed(123)
nmds_vegan <- metaMDS(dune, trace = FALSE)

# tidyvegan style
set.seed(123)
nmds_tidy <- dune |> t_metaMDS(trace = FALSE)

# Verify stress values are identical
all.equal(nmds_vegan$stress, nmds_tidy$stress)
#> [1] TRUE
```

### 5. Permutational Manova (`adonis2` vs `t_adonis2`)

Testing the significance of environmental variables:

``` r

# Original vegan style
set.seed(123)
adonis_vegan <- adonis2(dune ~ Management, data = dune.env)

# tidyvegan style
set.seed(123)
adonis_tidy <- dune.env |> t_adonis2(dune ~ Management)

# Verify R2 values are identical
all.equal(adonis_vegan$R2, adonis_tidy$R2)
#> [1] TRUE
```

## Conclusion

The `t_` wrapper functions in `tidyvegan` provide an elegant,
pipe-friendly interface to the powerful community ecology tools of
`vegan`. As shown above, they produce mathematically identical results
while making your analysis code cleaner, more readable, and easier to
maintain.
