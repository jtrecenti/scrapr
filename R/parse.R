#' Creates a list-column tibble for each function and each file.
#'
#' @param files file paths
#' @param funs list of functions to pass. See \code{\link[dplyr]{funs}} for details.
#' @param fail should it fail if encounter one single error?
#' @param progress should it show progress bar or informative messages?
#' @param parallel should it run in parallel?
#' @param save_rds should it save a .rds file for each parsed document?
#' @param overwrite should it overwrite the rds file?
#' @param rds_dir directory where the .rds files will be saved.
#'
#' @importFrom dplyr funs
#'
#' @export
html_parse <- function(files,
                       funs = dplyr::funs(tab = rvest::html_table(., fill = TRUE)),
                       fail = FALSE,
                       progress = TRUE,
                       parallel = FALSE,
                       save_rds = TRUE,
                       overwrite = TRUE,
                       rds_dir = paste0(dirname(files), '_rds')) {
  stop("Not implemented yet.")
  if (save_rds) dir.create(rds_dir, showWarnings = FALSE)
  return(NULL)
}

