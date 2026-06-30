# Display Ordination Distances Against Observed Distances in Eigenvector Ordinations

Functions plot ordination distances in given number of dimensions
against observed distances or distances in full space in eigenvector
methods. The display is similar as the Shepard diagram
([`stressplot`](https://pefrens.github.io/tidyvegan/reference/goodness.metaMDS.md)
for non-metric multidimensional scaling with
[`metaMDS`](https://pefrens.github.io/tidyvegan/reference/metaMDS.md) or
[`monoMDS`](https://pefrens.github.io/tidyvegan/reference/monoMDS.md)),
but shows the linear relationship of the eigenvector ordinations. The
`stressplot` methods are available for
[`wcmdscale`](https://pefrens.github.io/tidyvegan/reference/wcmdscale.md),
[`rda`](https://pefrens.github.io/tidyvegan/reference/cca.md),
[`cca`](https://pefrens.github.io/tidyvegan/reference/cca.md),
[`capscale`](https://pefrens.github.io/tidyvegan/reference/dbrda.md),
[`dbrda`](https://pefrens.github.io/tidyvegan/reference/dbrda.md),
[`prcomp`](https://rdrr.io/r/stats/prcomp.html) and
[`princomp`](https://rdrr.io/r/stats/princomp.html).

## Usage

``` r
# S3 method for class 'wcmdscale'
stressplot(object, k = 2, pch, p.col = "blue", l.col = "red",
    lwd = 2, ...)
```

## Arguments

- object:

  Result object from eigenvector ordination
  ([`wcmdscale`](https://pefrens.github.io/tidyvegan/reference/wcmdscale.md),
  [`rda`](https://pefrens.github.io/tidyvegan/reference/cca.md),
  [`cca`](https://pefrens.github.io/tidyvegan/reference/cca.md),
  [`dbrda`](https://pefrens.github.io/tidyvegan/reference/dbrda.md),
  [`capscale`](https://pefrens.github.io/tidyvegan/reference/dbrda.md))

- k:

  Number of dimensions for which the ordination distances are displayed.

- pch, p.col, l.col, lwd:

  Plotting character, point colour and line colour like in default
  [`stressplot`](https://pefrens.github.io/tidyvegan/reference/goodness.metaMDS.md)

- ...:

  Other parameters to functions, e.g. graphical parameters.

## Details

The functions offer a similar display for eigenvector ordinations as the
standard Shepard diagram
([`stressplot`](https://pefrens.github.io/tidyvegan/reference/goodness.metaMDS.md))
in non-metric multidimensional scaling. The ordination distances in
given number of dimensions are plotted against observed distances. With
metric distances, the ordination distances in full space (with all
ordination axes) are equal to observed distances, and the fit line shows
this equality. In general, the fit line does not go through the points,
but the points for observed distances approach the fit line from below.
However, with non-Euclidean distances (in
[`wcmdscale`](https://pefrens.github.io/tidyvegan/reference/wcmdscale.md),
[`dbrda`](https://pefrens.github.io/tidyvegan/reference/dbrda.md) or
[`capscale`](https://pefrens.github.io/tidyvegan/reference/dbrda.md))
with negative eigenvalues the ordination distances can exceed the
observed distances in real dimensions; the imaginary dimensions with
negative eigenvalues will correct these excess distances. If you have
used [`dbrda`](https://pefrens.github.io/tidyvegan/reference/dbrda.md),
[`capscale`](https://pefrens.github.io/tidyvegan/reference/dbrda.md) or
[`wcmdscale`](https://pefrens.github.io/tidyvegan/reference/wcmdscale.md)
with argument `add` to avoid negative eigenvalues, the ordination
distances will exceed the observed dissimilarities.

In partial ordination
([`cca`](https://pefrens.github.io/tidyvegan/reference/cca.md),
[`rda`](https://pefrens.github.io/tidyvegan/reference/cca.md), and
[`capscale`](https://pefrens.github.io/tidyvegan/reference/dbrda.md)
with `Condition` in the formula), the distances in the partial component
are included both in the observed distances and in ordination distances.
With `k=0`, the ordination distances refer to the partial ordination.
The exception is
[`dbrda`](https://pefrens.github.io/tidyvegan/reference/dbrda.md) where
the distances in partial, constrained and residual components are not
additive, and only the first of these components can be shown, and
partial models cannot be shown at all.

## Value

Functions draw a graph and return invisibly the ordination distances or
the ordination distances.

## Author

Jari Oksanen.

## See also

[`stressplot`](https://pefrens.github.io/tidyvegan/reference/goodness.metaMDS.md)
and
[`stressplot.monoMDS`](https://pefrens.github.io/tidyvegan/reference/goodness.metaMDS.md)
for standard Shepard diagrams.

## Examples

``` r
data(dune, dune.env)
mod <- rda(dune)
stressplot(mod)

mod <- rda(dune ~ Management, dune.env)
stressplot(mod, k=3)
```
