# Utility for handling user friendly scaling — None exported

Convert user-friendly descriptions of scalings to numeric codes used by
`scores` to date.

## Usage

``` r
scalingType(
  scaling = c("none", "sites", "species", "symmetric"),
  correlation = FALSE,
  hill = FALSE
)
```

## Arguments

- scaling:

  character or numeric; which type of scaling is required? Numeric
  values are returned unaltered

- correlation:

  logical; should correlation-like scores be returned?

- hill:

  logical; should Hill's scaling scores be returned?
