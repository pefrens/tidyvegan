# Tsallis Diversity and Corresponding Accumulation Curves

Function `tsallis` find Tsallis diversities with any scale or the
corresponding evenness measures. Function `tsallisaccum` finds these
statistics with accumulating sites.

## Usage

``` r
tsallis(x, scales = seq(0, 2, 0.2), norm = FALSE, hill = FALSE)
tsallisaccum(x, scales = seq(0, 2, 0.2), permutations = 100, 
   raw = FALSE, subset, ...)
# S3 method for class 'tsallisaccum'
persp(x, theta = 220, phi = 15, col = heat.colors(100), zlim, ...)
```

## Arguments

- x:

  Community data matrix or plotting object.

- scales:

  Scales of Tsallis diversity.

- norm:

  Logical, if `TRUE` diversity values are normalized by their maximum
  (diversity value at equiprobability conditions).

- hill:

  Calculate Hill numbers.

- permutations:

  Usually an integer giving the number permutations, but can also be a
  list of control values for the permutations as returned by the
  function [`how`](https://rdrr.io/pkg/permute/man/how.html), or a
  permutation matrix where each row gives the permuted indices.

- raw:

  If `FALSE` then return summary statistics of permutations, and if TRUE
  then returns the individual permutations.

- subset:

  logical expression indicating sites (rows) to keep: missing values are
  taken as `FALSE`.

- theta, phi:

  angles defining the viewing direction. `theta` gives the azimuthal
  direction and `phi` the colatitude.

- col:

  Colours used for surface.

- zlim:

  Limits of vertical axis.

- ...:

  Other arguments which are passed to `tsallis` and to graphical
  functions.

## Details

The Tsallis diversity (also equivalent to Patil and Taillie diversity)
is a one-parametric generalised entropy function, defined as:

\$\$H_q = \frac{1}{q-1} (1-\sum\_{i=1}^S p_i^q)\$\$

where \\q\\ is a scale parameter, \\S\\ the number of species in the
sample (Tsallis 1988, Tothmeresz 1995). This diversity is concave for
all \\q\>0\\, but non-additive (Keylock 2005). For \\q=0\\ it gives the
number of species minus one, as \\q\\ tends to 1 this gives Shannon
diversity, for \\q=2\\ this gives the Simpson index (see function
[`diversity`](https://pefrens.github.io/tidyvegan/reference/diversity.md)).

If `norm = TRUE`, `tsallis` gives values normalized by the maximum:

\$\$H_q(max) = \frac{S^{1-q}-1}{1-q}\$\$

where \\S\\ is the number of species. As \\q\\ tends to 1, maximum is
defined as \\ln(S)\\.

If `hill = TRUE`, `tsallis` gives Hill numbers (numbers equivalents, see
Jost 2007):

\$\$D_q = (1-(q-1) H)^{1/(1-q)}\$\$

Details on plotting methods and accumulating values can be found on the
help pages of the functions
[`renyi`](https://pefrens.github.io/tidyvegan/reference/renyi.md) and
[`renyiaccum`](https://pefrens.github.io/tidyvegan/reference/renyi.md).

## Value

Function `tsallis` returns a data frame of selected indices. Function
`tsallisaccum` with argument `raw = FALSE` returns a three-dimensional
array, where the first dimension are the accumulated sites, second
dimension are the diversity scales, and third dimension are the summary
statistics `mean`, `stdev`, `min`, `max`, `Qnt 0.025` and `Qnt 0.975`.
With argument `raw = TRUE` the statistics on the third dimension are
replaced with individual permutation results.

## References

Tsallis, C. (1988) Possible generalization of Boltzmann-Gibbs
statistics. *J. Stat. Phis.* 52, 479–487.

Tothmeresz, B. (1995) Comparison of different methods for diversity
ordering. *Journal of Vegetation Science* **6**, 283–290.

Patil, G. P. and Taillie, C. (1982) Diversity as a concept and its
measurement. *J. Am. Stat. Ass.* **77**, 548–567.

Keylock, C. J. (2005) Simpson diversity and the Shannon-Wiener index as
special cases of a generalized entropy. *Oikos* **109**, 203–207.

Jost, L (2007) Partitioning diversity into independent alpha and beta
components. *Ecology* **88**, 2427–2439.

## Author

Péter Sólymos, <solymos@ualberta.ca>, based on the code of Roeland Kindt
and Jari Oksanen written for `renyi`

## See also

Accumulation routines are based on functions
[`renyi`](https://pefrens.github.io/tidyvegan/reference/renyi.md) and
[`renyiaccum`](https://pefrens.github.io/tidyvegan/reference/renyi.md),
and can be plotted with functions
[`plot.renyi`](https://pefrens.github.io/tidyvegan/reference/renyi.md)
and
[`plot.renyiaccum`](https://pefrens.github.io/tidyvegan/reference/renyi.md).
Alternative plots are provided by
[ggvegan](https://CRAN.R-project.org/package=ggvegan). An object of
class `tsallisaccum` can be displayed with dynamic 3D function
`rgl.renyiaccum` in the vegan3d package. See also settings for
[`persp`](https://rdrr.io/r/graphics/persp.html).

## Examples

``` r
data(BCI)
i <- sample(nrow(BCI), 12)
x1 <- tsallis(BCI[i,])
x1
#>     0      0.2      0.4       0.6      0.8        1      1.2      1.4      1.6
#> 2  83 38.06254 18.90957 10.230614 6.028061 3.848471 2.638667 1.922477 1.472692
#> 15 92 41.60244 20.33533 10.818968 6.277031 3.956635 2.686972 1.944677 1.483199
#> 28 84 38.19298 18.72155  9.985457 5.818617 3.693896 2.532394 1.852192 1.427230
#> 48 90 40.88736 20.03984 10.677655 6.201632 3.913725 2.661754 1.929642 1.474180
#> 46 85 38.71044 19.06049 10.224553 5.987209 3.810489 2.611431 1.904913 1.461976
#> 27 98 43.84660 21.16041 11.110930 6.371476 3.980281 2.687154 1.938584 1.476662
#> 40 79 34.49875 16.41508  8.624079 5.028357 3.234849 2.263379 1.692562 1.331193
#> 24 94 42.55654 20.75558 10.992840 6.343926 3.979427 2.692702 1.944478 1.481404
#> 6  84 38.12708 18.76185 10.079558 5.917679 3.776575 2.594218 1.895693 1.456750
#> 32 87 39.46244 19.31897 10.289732 5.982060 3.784873 2.584344 1.882462 1.445176
#> 3  89 39.79074 19.34183 10.294475 6.003596 3.814060 2.612130 1.905004 1.461939
#> 39 83 37.13183 17.98063  9.524369 5.542801 3.530494 2.435169 1.793695 1.391532
#>         1.8         2
#> 2  1.174887 0.9683393
#> 15 1.180006 0.9709057
#> 28 1.145854 0.9499296
#> 48 1.174583 0.9676412
#> 46 1.168556 0.9646728
#> 27 1.174682 0.9669962
#> 40 1.087270 0.9137131
#> 24 1.178152 0.9694268
#> 6  1.165447 0.9627557
#> 32 1.156659 0.9565267
#> 3  1.168492 0.9646078
#> 39 1.123737 0.9360204
plot(x1)

diversity(BCI[i,],"simpson") == x1[["2"]]
#>    2   15   28   48   46   27   40   24    6   32    3   39 
#> TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE 
x2 <- tsallis(BCI[i,], norm=TRUE)
x2
#>    0       0.2       0.4       0.6       0.8         1       1.2       1.4
#> 2  1 0.9055048 0.8546877 0.8377974 0.8455660 0.8685692 0.8978637 0.9264249
#> 15 1 0.9102071 0.8608373 0.8437404 0.8507238 0.8729284 0.9015588 0.9295308
#> 28 1 0.8997942 0.8397547 0.8130733 0.8129096 0.8314621 0.8602754 0.8916927
#> 48 1 0.9106932 0.8602635 0.8414256 0.8466675 0.8676229 0.8957424 0.9239173
#> 46 1 0.9032439 0.8485357 0.8278693 0.8331492 0.8554539 0.8856795 0.9162035
#> 27 1 0.9112896 0.8605499 0.8410587 0.8456725 0.8661975 0.8940909 0.9221774
#> 40 1 0.8544019 0.7656946 0.7230720 0.7171847 0.7382083 0.7754969 0.8189349
#> 24 1 0.9149445 0.8667059 0.8486326 0.8536824 0.8738548 0.9008891 0.9279024
#> 6  1 0.8982417 0.8415624 0.8207355 0.8267494 0.8500724 0.8812777 0.9126352
#> 32 1 0.9035303 0.8473994 0.8239937 0.8259777 0.8453403 0.8737041 0.9037309
#> 3  1 0.8943582 0.8362208 0.8155352 0.8226868 0.8476046 0.8803722 0.9129172
#> 39 1 0.8833633 0.8127010 0.7799621 0.7774979 0.7968043 0.8286189 0.8643658
#>          1.6       1.8         2
#> 2  0.9501791 0.9678597 0.9800060
#> 15 0.9527060 0.9698220 0.9814590
#> 28 0.9203563 0.9436787 0.9612382
#> 48 0.9477911 0.9658285 0.9783927
#> 46 0.9422698 0.9621112 0.9760219
#> 27 0.9460502 0.9641597 0.9768635
#> 40 0.8608104 0.8967433 0.9252791
#> 24 0.9507028 0.9678509 0.9797399
#> 6  0.9393927 0.9598144 0.9742171
#> 32 0.9304962 0.9518103 0.9675213
#> 3  0.9403687 0.9610574 0.9754460
#> 39 0.8978144 0.9257229 0.9472977
plot(x2)

mod1 <- tsallisaccum(BCI)
persp(mod1)

plot(mod1)

mod2 <- tsallisaccum(BCI, norm=TRUE)
persp(mod2, theta=100, phi=30)
```
