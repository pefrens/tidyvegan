## Internal tidyverse compatibility utilities for vegan

.tidy_to_matrix <- function(x, rownames.force = TRUE) {
    if (is.matrix(x)) {
        return(x)
    }
    
    if (is.data.frame(x)) {
        # Check for non-numeric columns
        non_numeric_cols <- !sapply(x, is.numeric)
        
        if (any(non_numeric_cols)) {
            # Identify character or factor columns that could act as row identifiers
            char_factor_cols <- which(sapply(x, function(col) is.character(col) || is.factor(col)))
            
            if (length(char_factor_cols) == 1) {
                col_idx <- char_factor_cols[1]
                col_vals <- as.character(x[[col_idx]])
                
                # Use as rownames only if values are unique
                if (anyDuplicated(col_vals) == 0) {
                    id_col_name <- names(x)[col_idx]
                    x_numeric <- x[, -col_idx, drop = FALSE]
                    
                    mat <- as.matrix(x_numeric, rownames.force = rownames.force)
                    rownames(mat) <- col_vals
                    
                    attr(mat, "tidy_id_col") <- id_col_name
                    attr(mat, "was_tidy") <- TRUE
                    return(mat)
                }
            }
        } else {
            # If all columns are numeric, convert to matrix as usual
            mat <- as.matrix(x, rownames.force = rownames.force)
            attr(mat, "was_tidy") <- inherits(x, "tbl_df")
            return(mat)
        }
    }
    
    # Fallback to standard base matrix conversion
    as.matrix(x, rownames.force = rownames.force)
}

# Dynamic S3 registration helper to avoid hard dependencies on broom/generics
.s3_register <- function(package, generic, class, method = NULL) {
    if (is.null(method)) {
        method <- get(paste0(generic, ".", class), envir = parent.frame())
    }
    
    # Register immediately if package is loaded
    if (isNamespaceLoaded(package)) {
        registerS3method(generic, class, method, envir = asNamespace(package))
    }
    
    # Register when package loads in future
    setHook(
        packageEvent(package, "onLoad"),
        function(...) {
            registerS3method(generic, class, method, envir = asNamespace(package))
        }
    )
}

