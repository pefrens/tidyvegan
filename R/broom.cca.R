## Broom S3 methods for class 'cca' (covers cca, rda, capscale, dbrda)

tidy.cca <- function(x, choices = c(1, 2), display = "all", scaling = "species", hill = FALSE, ...) {
    df <- scores(x, choices = choices, display = display, scaling = scaling, hill = hill, tidy = TRUE, ...)
    if (is.null(df)) {
        return(NULL)
    }
    if (requireNamespace("tibble", quietly = TRUE)) {
        tibble::as_tibble(df)
    } else {
        df
    }
}

glance.cca <- function(x, ...) {
    res <- list(
        inertia = x$inertia,
        tot.chi = x$tot.chi,
        pCCA.chi = if (!is.null(x$pCCA)) x$pCCA$tot.chi else NA_real_,
        CCA.chi = if (!is.null(x$CCA)) x$CCA$tot.chi else NA_real_,
        CA.chi = if (!is.null(x$CA)) x$CA$tot.chi else NA_real_,
        pCCA.rank = if (!is.null(x$pCCA)) x$pCCA$rank else NA_integer_,
        CCA.rank = if (!is.null(x$CCA)) x$CCA$rank else NA_integer_,
        CA.rank = if (!is.null(x$CA)) x$CA$rank else NA_integer_,
        n.obs = length(x$rowsum),
        n.vars = length(x$colsum)
    )
    df <- as.data.frame(res)
    if (requireNamespace("tibble", quietly = TRUE)) {
        tibble::as_tibble(df)
    } else {
        df
    }
}

augment.cca <- function(x, data = NULL, choices = c(1, 2), display = "wa", ...) {
    # Get site scores (matrix)
    sites_scores <- scores(x, choices = choices, display = display, tidy = FALSE, ...)
    if (is.list(sites_scores)) {
        # in case display returned a list, pick the first non-null
        sites_scores <- sites_scores[[1]]
    }
    
    # Try to resolve data if not provided
    if (is.null(data)) {
        # Check if we can find the data frame from the call
        if (!is.null(x$call$data)) {
            data <- tryCatch(eval(x$call$data, parent.frame()), error = function(e) NULL)
        }
    }
    
    if (is.null(data)) {
        # If no data found, return the scores as a data.frame/tibble
        df <- as.data.frame(sites_scores)
        df$.rownames <- rownames(sites_scores)
    } else {
        # If data is provided, bind columns.
        data_df <- as.data.frame(data)
        # Check if rownames match
        if (!is.null(rownames(sites_scores)) && !is.null(rownames(data_df)) &&
            all(rownames(sites_scores) %in% rownames(data_df))) {
            # Align rows
            data_df <- data_df[rownames(sites_scores), , drop = FALSE]
        }
        df <- cbind(data_df, as.data.frame(sites_scores))
    }
    
    if (requireNamespace("tibble", quietly = TRUE)) {
        tibble::as_tibble(df)
    } else {
        df
    }
}

## Broom S3 methods for class 'metaMDS'

tidy.metaMDS <- function(x, choices = c(1, 2), display = c("sites", "species"), ...) {
    if (identical(display, "all")) {
        display <- c("sites", "species")
    }
    df <- scores(x, choices = choices, display = display, tidy = TRUE, ...)
    if (is.null(df)) {
        return(NULL)
    }
    if (requireNamespace("tibble", quietly = TRUE)) {
        tibble::as_tibble(df)
    } else {
        df
    }
}

glance.metaMDS <- function(x, ...) {
    res <- list(
        stress = x$stress,
        n.obs = nrow(x$points),
        n.vars = if (!is.null(x$species)) nrow(x$species) else NA_integer_
    )
    df <- as.data.frame(res)
    if (requireNamespace("tibble", quietly = TRUE)) {
        tibble::as_tibble(df)
    } else {
        df
    }
}

augment.metaMDS <- function(x, data = NULL, choices = c(1, 2), ...) {
    sites_scores <- scores(x, choices = choices, display = "sites", ...)
    if (is.list(sites_scores)) {
        sites_scores <- sites_scores[[1]]
    }
    
    if (is.null(data) && !is.null(x$data)) {
        data <- tryCatch(eval(parse(text = x$data), parent.frame()), error = function(e) NULL)
    }
    
    if (is.null(data)) {
        df <- as.data.frame(sites_scores)
        df$.rownames <- rownames(sites_scores)
    } else {
        data_df <- as.data.frame(data)
        if (!is.null(rownames(sites_scores)) && !is.null(rownames(data_df)) &&
            all(rownames(sites_scores) %in% rownames(data_df))) {
            data_df <- data_df[rownames(sites_scores), , drop = FALSE]
        }
        df <- cbind(data_df, as.data.frame(sites_scores))
    }
    
    if (requireNamespace("tibble", quietly = TRUE)) {
        tibble::as_tibble(df)
    } else {
        df
    }
}

