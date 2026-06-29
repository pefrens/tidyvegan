#' Tidy Wrappers for vegan Functions
#'
#' These functions are tidyverse-compatible wrappers for the core functions of
#' the \pkg{tidyvegan} package. They are designed to be pipe-friendly by taking
#' a data frame, tibble, or matrix as their first argument.
#'
#' @param data A data frame, tibble, or matrix. For constrained ordination, this is
#'   either the community data (if formula is missing) or the environmental data (if
#'   formula is provided).
#' @param formula A formula specifying the model.
#' @param method Dissimilarity index or transformation method.
#' @param MARGIN Margin on which the operation is applied (1 for rows, 2 for columns).
#' @param grouping A grouping vector or factor.
#' @param sample Size of the sample to draw.
#' @param ... Additional arguments passed to the underlying function.
#'
#' @name t_wrappers
NULL

#' @rdname t_wrappers
#' @export
t_cca <- function(data, formula, ...) {
    if (missing(formula)) {
        cca(X = data, ...)
    } else {
        cca(formula = formula, data = data, ...)
    }
}

#' @rdname t_wrappers
#' @export
t_rda <- function(data, formula, ...) {
    if (missing(formula)) {
        rda(X = data, ...)
    } else {
        rda(formula = formula, data = data, ...)
    }
}

#' @rdname t_wrappers
#' @export
t_metaMDS <- function(data, ...) {
    metaMDS(comm = data, ...)
}

#' @rdname t_wrappers
#' @export
t_vegdist <- function(data, method = "bray", ...) {
    vegdist(x = data, method = method, ...)
}

#' @rdname t_wrappers
#' @export
t_decostand <- function(data, method, MARGIN, ...) {
    decostand(x = data, method = method, MARGIN = MARGIN, ...)
}

#' @rdname t_wrappers
#' @export
t_adonis2 <- function(data, formula, ...) {
    adonis2(formula = formula, data = data, ...)
}

#' @rdname t_wrappers
#' @export
t_anosim <- function(data, grouping, ...) {
    anosim(x = data, grouping = grouping, ...)
}

#' @rdname t_wrappers
#' @export
t_mrpp <- function(data, grouping, ...) {
    mrpp(dat = data, grouping = grouping, ...)
}

#' @rdname t_wrappers
#' @export
t_specaccum <- function(data, ...) {
    specaccum(comm = data, ...)
}

#' @rdname t_wrappers
#' @export
t_rarecurve <- function(data, ...) {
    rarecurve(x = data, ...)
}

#' @rdname t_wrappers
#' @export
t_rarefy <- function(data, sample, ...) {
    rarefy(x = data, sample = sample, ...)
}

#' @rdname t_wrappers
#' @export
t_rrarefy <- function(data, sample) {
    rrarefy(x = data, sample = sample)
}

#' @rdname t_wrappers
#' @export
t_drarefy <- function(data, sample) {
    drarefy(x = data, sample = sample)
}
