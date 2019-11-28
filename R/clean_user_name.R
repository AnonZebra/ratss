#' @title Clean up RATSS user names
#'
#' @description Takes a character vector of  entries that
#' have a user name in them in the format "<digit/digits>_<single digit>"
#' somewhere in them, extracts only the user names and returns a vector
#' with those.
#'
#' @usage clean_user_name(entries)
#'
#' @param entries character vector
#'
#' @details Note that the function can be used with a single entry with a user name
#' (i. e. a single element vector) as well as multiple entries. You need to make sure
#' that there aren't any digits immediately preceding or following the user name in
#' the entry string (e. g. "99102_2", with 102_2 being the username, doesn't work).
#'
#' @seealso \code{\link[stringr]{str_extract}}
#'
#' @examples
#' foo <- c("Twin202_2", "313_5", "1_2", "1_1", "randomchars12_2fillout")
#' clean_user_name(foo)

clean_user_name <- function(entries) {
  if (any(!grepl("[1-9]+[0-9]*_[0-9]", entries))) {
    warning("Not all vector elements have a <non-zero number>_<non-zero digit> pattern in them. Returning NULL.")
    return(NULL)
  }
  ocd_user_names <- grepl("ocd", entries, ignore.case = TRUE)
  res <- sapply(entries, function(x) stringr::str_extract(x, "[1-9]+[0-9]*_[1-9]"))
  res[ocd_user_names] <- paste0("OCD", res[ocd_user_names])
  return(as.vector(res))
}
