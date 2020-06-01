erase_this <- function() {

  this <- deparse(sys.call())

  doc <- rstudioapi::getActiveDocumentContext()

  new_contents <- stringr::str_remove_all(doc$contents, stringr::fixed(this))

  rstudioapi::setDocumentContents(paste(new_contents, collapse = "\n"), doc$id)

  cursor_pos <- doc$selection[[length(doc$selection)]]$range

  rstudioapi::setCursorPosition(rstudioapi::document_position(cursor_pos$end[1],
                                                              cursor_pos$end[2]))

}




