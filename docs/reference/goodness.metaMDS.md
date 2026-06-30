# Goodness of Fit and Shepard Plot for Nonmetric Multidimensional Scaling

Function `goodness.metaMDS` find goodness of fit measure for points in
nonmetric multidimensional scaling, and function `stressplot` makes a
[`Shepard`](https://rdrr.io/pkg/MASS/man/isoMDS.html) diagram.

## Usage

``` r
# S3 method for class 'metaMDS'
goodness(object, dis, ...)
# Default S3 method
stressplot(object, dis, pch, p.col = "blue", l.col = "red", 
    lwd = 2, ...)
```

## Arguments

- object:

  A result object from
  [`metaMDS`](https://pefrens.github.io/tidyvegan/reference/metaMDS.md),
  [`monoMDS`](https://pefrens.github.io/tidyvegan/reference/monoMDS.md)
  or [`isoMDS`](https://rdrr.io/pkg/MASS/man/isoMDS.html).

- dis:

  Dissimilarities. This should not be used with
  [`metaMDS`](https://pefrens.github.io/tidyvegan/reference/metaMDS.md)
  or
  [`monoMDS`](https://pefrens.github.io/tidyvegan/reference/monoMDS.md),
  but must be used with when the dissimilarities cannot be reconstructed
  from the result object.

- pch:

  Plotting character for points. Default is dependent on the number of
  points.

- p.col, l.col:

  Point and line colours.

- lwd:

  Line width. For
  [`monoMDS`](https://pefrens.github.io/tidyvegan/reference/monoMDS.md)
  the default is `lwd = 1` if more than two lines are drawn, and
  `lwd = 2` otherwise.

- ...:

  Other parameters to functions, e.g. graphical parameters.

## Details

Function `goodness.metaMDS` finds a goodness of fit statistic for
observations (points). This is defined so that sum of squared values is
equal to squared stress. Large values indicate poor fit.

Function `stressplot` draws a Shepard diagram which is a plot of
ordination distances and monotone or linear fit line against original
dissimilarities. In addition, it displays two correlation-like
statistics on the goodness of fit in the graph. The nonmetric fit is
based on stress \\S\\ and defined as \\R^2 = 1-S^2\\. The “linear fit”
is the squared correlation between fitted values and ordination
distances. For
[`monoMDS`](https://pefrens.github.io/tidyvegan/reference/monoMDS.md),
the “linear fit” and \\R^2\\ from “stress type 2” are equal.

Both functions can be used with
[`metaMDS`](https://pefrens.github.io/tidyvegan/reference/metaMDS.md),
[`monoMDS`](https://pefrens.github.io/tidyvegan/reference/monoMDS.md)
and [`isoMDS`](https://rdrr.io/pkg/MASS/man/isoMDS.html). The original
dissimilarities should not be given for
[`monoMDS`](https://pefrens.github.io/tidyvegan/reference/monoMDS.md) or
[`metaMDS`](https://pefrens.github.io/tidyvegan/reference/metaMDS.md)
results, but they must given if the result object has no information to
reconstruct dissmilarities. The functions checks that dissimilarities
are consistent with current ordination, and refuses to analyse
inconsistent dissimilarities. Function `goodness.metaMDS` is generic in
vegan, but you must spell its name completely if the result has no
`class`.

## Value

Function `goodness` returns a vector of values. Function `stressplot`
returns invisibly an object with items for original dissimilarities,
ordination distances and fitted values.

## Author

Jari Oksanen.

## See also

[`metaMDS`](https://pefrens.github.io/tidyvegan/reference/metaMDS.md),
[`monoMDS`](https://pefrens.github.io/tidyvegan/reference/monoMDS.md),
[`isoMDS`](https://rdrr.io/pkg/MASS/man/isoMDS.html),
[`Shepard`](https://rdrr.io/pkg/MASS/man/isoMDS.html). Similar diagrams
for eigenvector ordinations can be drawn with
[`stressplot.wcmdscale`](https://pefrens.github.io/tidyvegan/reference/stressplot.wcmdscale.md),
[`stressplot.cca`](https://pefrens.github.io/tidyvegan/reference/stressplot.wcmdscale.md).

## Examples

``` r
data(varespec)
mod <- metaMDS(varespec)
#> Square root transformation
#> Wisconsin double standardization
#> Run 0 stress 0.1843196 
#> Run 1 stress 0.1825658 
#> ... New best solution
#> ... Procrustes: rmse 0.04162738  max resid 0.1518113 
#> Run 2 stress 0.1825658 
#> ... Procrustes: rmse 4.653163e-06  max resid 1.239771e-05 
#> ... Similar to previous best
#> Run 3 stress 0.1869637 
#> Run 4 stress 0.2217598 
#> Run 5 stress 0.18458 
#> Run 6 stress 0.196245 
#> Run 7 stress 0.2088293 
#> Run 8 stress 0.2066172 
#> Run 9 stress 0.2109004 
#> Run 10 stress 0.195049 
#> Run 11 stress 0.2109612 
#> Run 12 stress 0.2592237 
#> Run 13 stress 0.1962451 
#> Run 14 stress 0.2061832 
#> Run 15 stress 0.1955836 
#> Run 16 stress 0.2109002 
#> Run 17 stress 0.1969805 
#> Run 18 stress 0.1967393 
#> Run 19 stress 0.2173477 
#> Run 20 stress 0.2096135 
#> *** Best solution repeated 1 times
stressplot(mod)

gof <- goodness(mod)
gof
#>  [1] 0.02984553 0.03513701 0.04189137 0.04598275 0.04003016 0.03441459
#>  [7] 0.03294896 0.03050104 0.03060719 0.02994131 0.03526344 0.02621449
#> [13] 0.03830956 0.02980965 0.03369538 0.02225812 0.03561624 0.03505249
#> [19] 0.06577468 0.03268458 0.03503094 0.02956682 0.05167997 0.04602049
plot(mod, display = "sites", type = "n")
points(mod, display = "sites", cex = 2*gof/mean(gof))
```
