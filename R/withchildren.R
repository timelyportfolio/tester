#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
withchildrenInput <- function(inputId, default = "", attribs = list(), children = list()) {
  reactR::createReactShinyInput(
    inputId,
    "withchildren",
    htmltools::htmlDependency(
      name = "withchildren-input",
      version = "1.0.0",
      src = "www/tester/withchildren",
      package = "tester",
      script = "withchildren.js"
    ),
    default,
    configuration = list(attribs = attribs, children = children),
    htmltools::tags$div
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateWithchildrenInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
