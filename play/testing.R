delete_this <- function() {
  this <- deparse(sys.call())

  doc <- rstudioapi::getActiveDocumentContext()

  new_contents <- stringr::str_remove_all(doc$contents, stringr::fixed(this))

  rstudioapi::setDocumentContents(paste(new_contents, collapse = "\n"), doc$id)
}

