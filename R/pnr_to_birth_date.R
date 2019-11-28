#' @title Convert a personal number to birth date
#'
#' @description Function for converting Swedish personal numbers to birth dates.
#'
#' @param pnrs a character vector of personal numbers
#'
#' @details Converts Swedish personal numbers (in the format "YYYYMMDD-XXXX",
#' or "YYMMDD-XXXX") to birth dates. If the personal number is in the format
#' "YYMMDD-XXXX", the function assumes that all YY values above 25 indicate
#' someone born in the 1900's, and all YY values below 25 indicate someone
#' born in the 2000's.
#'
#' @seealso \code{\link[base]{sub}}
#'
#' @examples
#' x <- "19400830-1111"
#' pnr_to_birth_date(x)
#' y <- "090830-1111"
#' pnr_to_birth_date(y)
#' mult_bds <- c("19400830-1111", "19801212-0000", "20020202-2222", "000303-3333")
#' pnr_to_birth_date(mult_bds)
#'
#' @export

pnr_to_birth_date <- function(pnrs){
  bdates <- sapply(pnrs, pnr2bdate, USE.NAMES = FALSE)
  return(bdates)
}
