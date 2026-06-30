# Multiplicative Diversity Partitioning

In multiplicative diversity partitioning, mean values of alpha diversity
at lower levels of a sampling hierarchy are compared to the total
diversity in the entire data set or the pooled samples (gamma
diversity).

## Usage

``` r
multipart(...)
# Default S3 method
multipart(y, x, index=c("renyi", "tsallis"), scales = 1,
    global = FALSE, relative = FALSE, nsimul=99, method = "r2dtable", ...)
# S3 method for class 'formula'
multipart(formula, data, index=c("renyi", "tsallis"), scales = 1,
    global = FALSE, relative = FALSE, nsimul=99, method = "r2dtable", ...)
```

## Arguments

- y:

  A community matrix.

- x:

  A matrix with same number of rows as in `y`, columns coding the levels
  of sampling hierarchy. The number of groups within the hierarchy must
  decrease from left to right. If `x` is missing, two levels are
  assumed: each row is a group in the first level, and all rows are in
  the same group in the second level.

- formula:

  A two sided model formula in the form `y ~ x`, where `y` is the
  community data matrix with samples as rows and species as column.
  Right hand side (`x`) must be grouping variable(s) referring to levels
  of sampling hierarchy, terms from right to left will be treated as
  nested (first column is the lowest, last is the highest level). The
  formula will add a unique identifier to rows and constant for the rows
  to always produce estimates of row-level alpha and overall gamma
  diversities. You must use non-formula interface to avoid this
  behaviour. Interaction terms are not allowed.

- data:

  A data frame where to look for variables defined in the right hand
  side of `formula`. If missing, variables are looked in the global
  environment.

- index:

  Character, the entropy index to be calculated (see Details).

- relative:

  Logical, if `TRUE` then beta diversity is standardized by its maximum
  (see Details).

- scales:

  Numeric, of length 1, the order of the generalized diversity index to
  be used.

- global:

  Logical, indicates the calculation of beta diversity values, see
  Details.

- nsimul:

  Number of permutations to use. If `nsimul = 0`, only the `FUN`
  argument is evaluated. It is thus possible to reuse the statistic
  values without a null model.

- method:

  Null model method: either a name (character string) of a method
  defined in
  [`make.commsim`](https://pefrens.github.io/tidyvegan/reference/commsim.md)
  or a
  [`commsim`](https://pefrens.github.io/tidyvegan/reference/commsim.md)
  function. The default `"r2dtable"` keeps row sums and column sums
  fixed. See
  [`oecosimu`](https://pefrens.github.io/tidyvegan/reference/oecosimu.md)
  for Details and Examples.

- ...:

  Other arguments passed to
  [`oecosimu`](https://pefrens.github.io/tidyvegan/reference/oecosimu.md),
  i.e. `method`, `thin` or `burnin`.

## Details

Multiplicative diversity partitioning is based on Whittaker's (1972)
ideas, that has recently been generalised to one parametric diversity
families (i.e. Rényi and Tsallis) by Jost (2006, 2007). Jost recommends
to use the numbers equivalents (Hill numbers), instead of pure
diversities, and proofs, that this satisfies the multiplicative
partitioning requirements.

The current implementation of `multipart` calculates Hill numbers based
on the functions
[`renyi`](https://pefrens.github.io/tidyvegan/reference/renyi.md) and
[`tsallis`](https://pefrens.github.io/tidyvegan/reference/tsallis.md)
(provided as `index` argument). If values for more than one `scales` are
desired, it should be done in separate runs, because it adds extra
dimensionality to the implementation, which has not been resolved
efficiently.

Alpha diversities are then the averages of these Hill numbers for each
hierarchy levels, the global gamma diversity is the alpha value
calculated for the highest hierarchy level. When `global = TRUE`, beta
is calculated relative to the global gamma value: \$\$\beta_i = \gamma /
\alpha\_{i}\$\$ when `global = FALSE`, beta is calculated relative to
local gamma values (local gamma means the diversity calculated for a
particular cluster based on the pooled abundance vector): \$\$\beta_ij =
\alpha\_{(i+1)j} / mean(\alpha\_{ij})\$\$ where \\j\\ is a particular
cluster at hierarchy level \\i\\. Then beta diversity value for level
\\i\\ is the mean of the beta values of the clusters at that level,
\\\beta\_{i} = mean(\beta\_{ij})\\.

If `relative = TRUE`, the respective beta diversity values are
standardized by their maximum possible values (\\mean(\beta\_{ij}) /
\beta\_{max,ij}\\) given as \\\beta\_{max,ij} = n\_{j}\\ (the number of
lower level units in a given cluster \\j\\).

The expected diversity components are calculated `nsimul` times by
individual based randomization of the community data matrix. This is
done by the `"r2dtable"` method in
[`oecosimu`](https://pefrens.github.io/tidyvegan/reference/oecosimu.md)
by default.

## Value

An object of class `"multipart"` with same structure as `"oecosimu"`
objects.

## References

Jost, L. (2006). Entropy and diversity. *Oikos*, **113**, 363–375.

Jost, L. (2007). Partitioning diversity into independent alpha and beta
components. *Ecology*, **88**, 2427–2439.

Whittaker, R. (1972). Evolution and measurement of species diversity.
*Taxon*, **21**, 213–251.

## Author

Péter Sólymos, <solymos@ualberta.ca>

## See also

See
[`adipart`](https://pefrens.github.io/tidyvegan/reference/adipart.md)
for additive diversity partitioning,
[`hiersimu`](https://pefrens.github.io/tidyvegan/reference/adipart.md)
for hierarchical null model testing and
[`oecosimu`](https://pefrens.github.io/tidyvegan/reference/oecosimu.md)
for permutation settings and calculating \\p\\-values.

## Examples

``` r
## NOTE: 'nsimul' argument usually needs to be >= 99
## here much lower value is used for demonstration

data(mite)
data(mite.xy)
data(mite.env)
## Function to get equal area partitions of the mite data
cutter <- function (x, cut = seq(0, 10, by = 2.5)) {
    out <- rep(1, length(x))
    for (i in 2:(length(cut) - 1))
        out[which(x > cut[i] & x <= cut[(i + 1)])] <- i
    return(out)}
## The hierarchy of sample aggregation
levsm <- with(mite.xy, data.frame(
    l2=cutter(y, cut = seq(0, 10, by = 2.5)),
    l3=cutter(y, cut = seq(0, 10, by = 5))))
## Multiplicative diversity partitioning
multipart(mite, levsm, index="renyi", scales=1, nsimul=19)
#> multipart object
#> 
#> Call: multipart(y = mite, x = levsm, index = "renyi", scales = 1,
#> nsimul = 19)
#> 
#> nullmodel method ‘r2dtable’ with 19 simulations
#> options:  index renyi, scales 1, global FALSE
#> alternative hypothesis: statistic is less or greater than simulated values
#> 
#>         statistic      SES    mean    2.5%     50%   97.5% Pr(sim.)  
#> alpha.1    11.235 -104.301 14.0676 14.0149 14.0670 14.1035     0.05 *
#> gamma      12.006 -350.778 14.1356 14.1249 14.1357 14.1463     0.05 *
#> beta.1      1.071   36.772  1.0048  1.0020  1.0049  1.0082     0.05 *
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
multipart(mite ~ l2 + l3, levsm, index="renyi", scales=1, nsimul=19)
#> multipart object
#> 
#> Call: multipart(formula = mite ~ l2 + l3, data = levsm, index =
#> "renyi", scales = 1, nsimul = 19)
#> 
#> nullmodel method ‘r2dtable’ with 19 simulations
#> options:  index renyi, scales 1, global FALSE
#> alternative hypothesis: statistic is less or greater than simulated values
#> 
#>         statistic      SES     mean     2.5%      50%   97.5% Pr(sim.)  
#> alpha.1    8.0555  -64.605 12.18390 12.05151 12.19664 12.2975     0.05 *
#> alpha.2   11.2353  -92.479 14.08424 14.03705 14.08690 14.1377     0.05 *
#> alpha.3   12.0064 -395.402 14.13667 14.12732 14.13677 14.1464     0.05 *
#> gamma     14.1603    0.000 14.16027 14.16027 14.16027 14.1603     1.00  
#> beta.1     1.3568   30.420  1.15959  1.14804  1.15922  1.1712     0.05 *
#> beta.2     1.0710   29.468  1.00373  0.99959  1.00356  1.0073     0.05 *
#> beta.3     1.1794  465.560  1.00167  1.00098  1.00166  1.0023     0.05 *
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
multipart(mite ~ ., levsm, index="renyi", scales=1, nsimul=19, relative=TRUE)
#> multipart object
#> 
#> Call: multipart(formula = mite ~ ., data = levsm, index = "renyi",
#> scales = 1, relative = TRUE, nsimul = 19)
#> 
#> nullmodel method ‘r2dtable’ with 19 simulations
#> options:  index renyi, scales 1, global FALSE
#> alternative hypothesis: statistic is less or greater than simulated values
#> 
#>         statistic      SES      mean      2.5%       50%   97.5% Pr(sim.)  
#> alpha.1  8.055481  -52.656 12.173153 12.040511 12.198086 12.2849     0.05 *
#> alpha.2 11.235261  -92.850 14.072878 14.018191 14.076371 14.1273     0.05 *
#> alpha.3 12.006443 -341.839 14.137173 14.124721 14.137318 14.1459     0.05 *
#> gamma   14.160271    0.000 14.160271 14.160271 14.160271 14.1603     1.00  
#> beta.1   0.078594   21.774  0.068354  0.067737  0.068169  0.0692     0.05 *
#> beta.2   0.535514   32.515  0.502284  0.500519  0.502147  0.5041     0.05 *
#> beta.3   0.589695  402.407  0.500817  0.500508  0.500812  0.5013     0.05 *
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
multipart(mite ~ ., levsm, index="renyi", scales=1, nsimul=19, global=TRUE)
#> multipart object
#> 
#> Call: multipart(formula = mite ~ ., data = levsm, index = "renyi",
#> scales = 1, global = TRUE, nsimul = 19)
#> 
#> nullmodel method ‘r2dtable’ with 19 simulations
#> options:  index renyi, scales 1, global TRUE
#> alternative hypothesis: statistic is less or greater than simulated values
#> 
#>         statistic      SES    mean    2.5%     50%   97.5% Pr(sim.)  
#> alpha.1    8.0555  -60.088 12.1858 12.0759 12.1798 12.2939     0.05 *
#> alpha.2   11.2353  -87.542 14.0938 14.0344 14.0929 14.1507     0.05 *
#> alpha.3   12.0064 -306.073 14.1380 14.1255 14.1372 14.1472     0.05 *
#> gamma     14.1603    0.000 14.1603 14.1603 14.1603 14.1603     1.00  
#> beta.1     1.7578   90.871  1.1621  1.1518  1.1626  1.1726     0.05 *
#> beta.2     1.2603  109.775  1.0047  1.0007  1.0048  1.0090     0.05 *
#> beta.3     1.1794  360.338  1.0016  1.0009  1.0016  1.0025     0.05 *
#> ---
#> Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
