# Corrige falsos positivos del linter en la línea de Bootstrap embebido (HTML tejido).
# Uso tras Knit: source("fix_bootstrap_css.R")
#   o: fix_bootstrap_css_in_html("Cancer_Dataset_Anova.html")

fix_bootstrap_css_in_html <- function(html_path = "Cancer_Dataset_Anova.html") {
  if (!file.exists(html_path)) {
    message("No se encontró: ", html_path)
    return(invisible(FALSE))
  }
  lines <- readLines(html_path, warn = FALSE, encoding = "UTF-8")
  if (length(lines) < 34L) {
    message("El HTML no tiene la estructura esperada.")
    return(invisible(FALSE))
  }
  line <- lines[[34L]]
  if (!grepl("^<style type=\"text/css\">", line)) {
    message("La línea 34 no es el bloque CSS de Bootstrap.")
    return(invisible(FALSE))
  }

  line <- gsub(
    "background-color:#000;background-color:rgba\\(0,0,0,0\\)",
    "background-color:rgba(0,0,0,0)",
    line,
    fixed = TRUE
  )
  line <- gsub("th\\{\\}", "", line, fixed = TRUE)
  line <- gsub("td,th\\{\\}", "", line, fixed = TRUE)
  line <- gsub("#000\\\\9", "#000", line, fixed = TRUE)

  line <- gsub(
    "-webkit-appearance:button;appearance:button;",
    "appearance:button;-webkit-appearance:button;",
    line,
    fixed = TRUE
  )
  line <- gsub(
    "-webkit-appearance:textfield;appearance:textfield}",
    "appearance:textfield;-webkit-appearance:textfield}",
    line,
    fixed = TRUE
  )
  line <- gsub(
    "input[type=search]{-webkit-appearance:none;appearance:none}",
    "input[type=search]{appearance:none;-webkit-appearance:none}",
    line,
    fixed = TRUE
  )
  line <- gsub(
    "button.close{-webkit-appearance:none;appearance:none;",
    "button.close{appearance:none;-webkit-appearance:none;",
    line,
    fixed = TRUE
  )

  lines[[34L]] <- line
  writeLines(lines, html_path, useBytes = TRUE)
  message("CSS de Bootstrap corregido en: ", html_path)
  invisible(TRUE)
}

if (sys.nframe() == 0L) {
  fix_bootstrap_css_in_html()
}
