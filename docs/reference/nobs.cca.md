# Extract the Number of Observations from a vegan Fit.

Extract the number of ‘observations’ from a vegan model fit.

## Usage

``` r
# S3 method for class 'cca'
nobs(object, ...)
```

## Arguments

- object:

  A fitted model object.

- ...:

  Further arguments to be passed to methods.

## Details

Function `nobs` is generic in R, and vegan provides methods for objects
from
[`betadisper`](https://pefrens.github.io/tidyvegan/reference/betadisper.md),
[`cca`](https://pefrens.github.io/tidyvegan/reference/cca.md) and other
related methods,
[`CCorA`](https://pefrens.github.io/tidyvegan/reference/CCorA.md),
[`decorana`](https://pefrens.github.io/tidyvegan/reference/decorana.md),
[`isomap`](https://pefrens.github.io/tidyvegan/reference/isomap.md),
[`metaMDS`](https://pefrens.github.io/tidyvegan/reference/metaMDS.md),
[`pcnm`](https://pefrens.github.io/tidyvegan/reference/pcnm.md),
[`procrustes`](https://pefrens.github.io/tidyvegan/reference/procrustes.md),
[`radfit`](https://pefrens.github.io/tidyvegan/reference/radfit.md),
[`varpart`](https://pefrens.github.io/tidyvegan/reference/varpart.md)
and
[`wcmdscale`](https://pefrens.github.io/tidyvegan/reference/wcmdscale.md).

## Value

A single number, normally an integer, giving the number of observations.

## Author

Jari Oksanen
