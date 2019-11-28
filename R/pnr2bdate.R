#' @title Convert a personal number to birth date
#'
#' @description Helper function for \code{\link[ratss]{pnr_to_birth_date}}.
#'
#' @param pnr a character vector with a single personal number
#'
#' @details See the documentation for \code{\link[ratss]{pnr_to_birth_date}}.
#'
#' @seealso \code{\link[ratss]{pnr_to_birth_date}}

pnr2bdate <- function(pnr){
  if (is.na(pnr)) {return(NA)}
  bdate <- sub("-.*$", "", pnr)
  if (nchar(bdate) != 6 & nchar(bdate) != 8) {
    warning(paste("Invalid pnr format:", pnr))
    return(NA)}
  if (nchar(bdate) == 6) {
    yy <- as.integer(substr(bdate, 1, 2))
    if (yy > 25) {
      bdate <- paste("19", bdate, sep = "")
    }
    else {bdate <- paste("20", bdate, sep = "")}
  }
  return(bdate)
}
