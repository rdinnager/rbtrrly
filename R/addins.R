insert_function_source <- function() {
  doc <- rstudioapi::getActiveDocumentContext()
  sel <- doc$selection[[length(doc$selection)]]
  if(all.equal(sel$range$start, sel$range$end)) {
    func <- doc$contents[sel$range$start[1]]
  } else {
    func <- sel$text
  }

  bod <- capture.output(print(get(func)))

  rstudioapi::insertText(paste0(" <- ", bod))
}


