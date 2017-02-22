#' Pipe operator
#'
#' See \code{\link[magrittr]{\%>\%}} for more details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

#' @rdname html_tag_value
#' @export
html_viewstate <- function(html) {
  html_tag_value(html, '#__VIEWSTATE')
}

#' @rdname html_tag_value
#' @export
html_eventval <- function(html) {
  html_tag_value(html, '#__EVENTVALIDATION')
}

#' Gets tag value by tag id
#'
#' Gets tag value by tag id.
#'
#' @param html \code{xml_document} or \code{xml_node} object.
#' @param id CSS path or id name
#'
#' @return atomic character
#'
#' @export
html_tag_value <- function(html, id) {
  if (is.na(id) || is.null(id) || id == '') stop('id must be a non-empty atomic character')
  if (!grepl('^#', id)) id <- paste0('#', id)
  txt <- rvest::html_attr(rvest::html_node(html, id), 'value')
  ifelse(is.na(txt), '', txt)
}
