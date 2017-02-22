#' Visualise response
#'
#' Visualise response in RStudio Viewer (if available) or users browser.
#'
#' @param response response object (from \code{httr}), file path or character
#'   string containing HTML.
#'
#' @return Returns \code{NULL}.
#' @export
html_view <- function(response) {
  UseMethod("html_view")
}

#' @rdname html_view
#' @export
html_view.response <- function(response) {
  ct <- response[['headers']][['content-type']]
  if(!grepl('html', ct)) {
    stop('Not a HTML file.')
  }
  h <- httr::content(response, 'text')
  vis(h)
}

#' @rdname html_view
#' @export
html_view.character <- function(response) {
  if (file.exists(response)) response <- readr::read_file(response)
  vis(response)
}

vis <- function(h) {
  dir <- tempfile()
  dir.create(dir)
  html_file <- file.path(dir, "index.html")
  cat(h, file = html_file)
  if(interactive()) {
    rstudioapi::viewer(html_file)
  } else {
    httr::BROWSE(html_file)
  }
  # file.remove(html_file)
  invisible(NULL)
}
