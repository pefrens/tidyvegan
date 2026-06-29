#' Add New Points to NMDS ordination
#'
#' Add new points to an existing \code{\link{metaMDS}} or
#' \code{\link{monoMDS}} ordination.
#'
#' @param nmds Result object from \code{\link{metaMDS}} or
#'   \code{\link{monoMDS}}. The configuration of points is fixed,
#'   but new points are added.
#' @param dis Rectangular non-symmetric dissimilarity matrix among new
#'   points (rows) and old fixed points (columns). Such matrix can be
#'   extracted from complete dissimilarities of both old and new points
#'   with \code{dist2xy}, or calculated with \code{\link{designdist2}}.
#' @param neighbours Number of nearest points used to get the starting
#'   locations for new points.
#' @param maxit Maximum number of iterations.
#'
#' @details
#' Function provides an interface to \code{monoMDS} Fortran code to add new
#' points to an existing ordination that will be regarded as fixed. The
#' function has a similar role as \code{predict} functions with
#' \code{newdata} in Euclidean ordination (e.g. \code{\link{predict.cca}}).
#' Input data must be a rectangular matrix of distances among new added
#' points (rows) and all fixed old points (columns). Such matrices can be
#' extracted from complete dissimilarities with helper function
#' \code{dist2xy}. Function \code{\link{designdist2}} can directly
#' calculate such rectangular dissimilarity matrices between sampling units
#' (rows) in two matries. In addition, \pkg{analogue} has distance
#' function that can calculate dissimilarities among two matrices,
#' including functions that cannot be specified in
#' \code{\link{designdist2}}.
#'
#' Great care is needed in preparing the dissimilarities for the
#' input. The dissimilarity index must be exactly the same as in the
#' fixed ordination, and columns must match old fixed points, and rows
#' added new points.
#'
#' @return
#' Function return a list of class \code{"nmds"} (there are no other
#' objects of that type in \pkg{vegan}) with following elements:
#' \itemize{
#'   \item \code{points}: Coordinates of added new points.
#'   \item \code{seeds}: Starting coordinates for new points.
#'   \item \code{deltastress}: Change of stress with added points.
#'   \item \code{iters}: Number of iterations.
#'   \item \code{cause}: Cause of termination of iterations. Integer for
#'     convergence criteria in \code{\link{monoMDS}}.
#' }
#'
#' @examples
#' ## Cross-validation: remove a point when performing NMDS and add as
#' ## a new points
#' data(dune)
#' d <- vegdist(dune)
#' ## remove point 3 from ordination
#' mod3 <- metaMDS(dist2xy(d, 3, "xx", invert = TRUE), trace=0)
#' ## add point 3 to the result
#' MDSaddpoints(mod3, dist2xy(d, 3))
#' ## Use designdist2
#' d15 <- designdist(dune[1:15,])
#' m15 <- metaMDS(d15, trace=0)
#' MDSaddpoints(m15, designdist2(dune[1:15,], dune[16:20,]))
#' @export
`MDSaddpoints` <-
    function (nmds, dis, neighbours=5, maxit=200)
{
## bring list component to local matrix

    points <- nmds$points
    oldn <- nrow(points)
    ndim <- ncol(points)

    ## use dist2xy to handle input 'dis'
    if (inherits(dis, "dist")) {
        totn <- attr(dis, "Size")
        if (totn <= oldn)
            stop("input dissimilarities should have more observations than 'nmds'")
        dis <- dist2xy(dis, pick = seq(oldn + 1, totn))
    }
    newn <- nrow(dis)
    totn <- oldn + newn

    ## set up initial coordinates as weighted average of nearest
    ## neighbours to old points using 1-diss as weights

    tmp <- matrix(0, newn, ndim)
    for (i in 1:newn) {
        pnt <- order(dis[i,seq_len(oldn)])[seq_len(neighbours)]
        maxdist <- attr(dis, "maxdist")
        if (is.null(maxdist))
            maxdist <- max(1, dis)
        weight <- maxdist - dis[i,pnt]
        for (j in 1:ncol(points)) {
            tmp[i,j] <- weighted.mean(points[pnt,j], w=weight)
        }
    }

    xinit <- rbind(points,tmp)

    ## set up indices

    iidx <- as.vector(row(dis)) + oldn
    jidx <- as.vector(col(dis))

    ## combine with old data

    diss <- c(nmds$diss, dis)
    ndis <- length(diss)
    iidx <- c(nmds$iidx, iidx)
    jidx <- c(nmds$jidx, jidx)

    ## set up ordination parameters.
    nfix <- oldn
    ngrp <-
    istart <- 1
    dist <- rep(0,ndis)
    dhat <- rep(0,ndis)
    x <- matrix(0,nrow=totn,ncol=ndim)
    stress <- 1.0
    strs <- ngrp
    iters <- 1
    icause <- 1
    maxits <- maxit
    iwork <- rep(0,ndis)
    grad <- matrix(0,nrow=totn,ncol=ndim)
    grlast <- matrix(0,nrow=totn,ncol=ndim)

    out <- .Fortran('monoMDS',
           nobj=as.integer(totn),
           nfix=as.integer(oldn),
           ndim=as.integer(ndim),
           ndis=as.integer(ndis),
           ngrp=as.integer(1),
           diss=as.double(diss),
           iidx=as.integer(iidx),
           jidx=as.integer(jidx),
           xinit=as.double(xinit),
           istart=as.integer(1),
           isform=as.integer(nmds$isform),
           ities=as.integer(nmds$ities),
           iregn=as.integer(nmds$iregn),
           iscal=as.integer(0), # should be 0 with nfix
           maxits=as.integer(maxits),
           sratmx=as.double(nmds$sratmx),
           strmin=as.double(nmds$strmin),
           sfgrmn=as.double(nmds$sfgrmn),
           dist=as.double(dist),
           dhat=as.double(dhat),
           points=as.double(x),
           stress=as.double(stress),
           strs=as.double(1),
           iters=as.integer(iters),
           cause=as.integer(icause),
           PACKAGE = "tidyvegan")
    dim(out$points) <- c(totn, ndim)
    newpoints <- out$points[(oldn+1):totn,, drop=FALSE]
    dimnames(newpoints) <- list(rownames(dis), colnames(nmds$points))
    adds <- list(points = newpoints, seed = tmp,
                 deltastress = out$stress - nmds$stress,
                 iters = out$iters, cause = out$cause)
    class(adds) <- 'nmds'
    adds
}
