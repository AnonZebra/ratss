#' @title Convert a RATSS study ID to user name format
#'
#' @description Helper function for \code{\link[ratss]{ratid_to_user_name}}.
#' Converts a RATSS code/study ID to a user name.
#'
#' @param rawn a string/character vector with a single RATSS code
#'
#' @details See \code{\link[ratss]{ratid_to_user_name}}.
#'
#' @seealso \code{\link[ratss]{ratid_to_user_name}}
#'
#' @examples
#' x <- "11 0104 01 01 14"
#' rat2usern(x)
#' y <- "110104010114"
#' rat2usern(y)

rat2usern <- function(rawn) {
  if (is.na(rawn)) {
    warning(paste("I was passed a NA value"))
    return(NA)
  }
  if (nchar(rawn) != 12) {
    warning(paste("Wrong format, I was passed this ID:", rawn))
    return(NA)}
  fam_no <- substr(rawn, 3, 6)
  fam_no <- sub("^0*", "", fam_no)
  twin_no <- substr(rawn, 8, 8)
  user_name <- paste(fam_no, "_", twin_no, sep = "")
  if (grepl("^19", rawn)) {
    user_name <- paste("OCD", user_name, sep = "")
  }
  return(user_name)
}
