.onAttach <- function(lib, pkg)  {
    if(interactive())
        packageStartupMessage(
            "This is tidyvegan devel version ",
            utils::packageDescription("tidyvegan", fields="Version"),
            appendLF = TRUE)
}

.onLoad <- function(libname, pkgname) {
    # Register broom/generics S3 methods dynamically
    .s3_register("generics", "tidy", "cca")
    .s3_register("generics", "glance", "cca")
    .s3_register("generics", "augment", "cca")
    
    .s3_register("generics", "tidy", "metaMDS")
    .s3_register("generics", "glance", "metaMDS")
    .s3_register("generics", "augment", "metaMDS")
}

