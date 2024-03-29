% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ratid_to_user_name.R
\name{ratid_to_user_name}
\alias{ratid_to_user_name}
\title{Convert a RATSS study ID to user name format}
\usage{
ratid_to_user_name(ratids)
}
\arguments{
\item{ratids}{a string/character vector with one or more RATID codes}
}
\description{
Function for converting RATSS study ID's to user names.
}
\details{
Converts RATSS code/study ID's (in the format e.g.
"11 0104 01 01 14" or without any spaces "110104010114") to a
<family>_<twin_no> format (e.g. "104_1"). For parents, this leads to them
having user names in the format "<family no>_5" or "<family no>_6". Note that
this parent coding might not be what you want or what has been used previously.
If the first two digits are "19", the function assumes that it is an OCD study
participant and adds OCD at the beginning of the output user name.
}
\examples{
x <- "11 0104 01 01 14"
ratid_to_user_name(x)
y <- "110104010114"
ratid_to_user_name(y)
mult_ids <- c("110104010114", "110204050174", "190004030104")
ratid_to_user_name(mult_ids)

}
\seealso{
\code{\link[base]{gsub}} \code{\link[base]{substr}}
}
