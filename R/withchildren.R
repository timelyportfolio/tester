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
      package = "inputtester",
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
  if(!is.null(session)) {
    session <- shiny::getDefaultReactiveDomain()
  }
  message <- list(value = value)
# browser()
  # check for any html dependencies in the children
  if (!is.null(configuration)) {
    deps <- NULL
    if(!is.null(configuration$children)) {
      # collect all dependencies from the children list
      #   I checked to make sure this does not need to be wrapped with tagList
      deps <- htmltools::resolveDependencies(htmltools::findDependencies(configuration$children))
      if(!is.null(deps)) {
        # use shiny::createWebDependency to addResourcePath and transform
        #   the dependency into its proper form for use in JavaScript
        deps <- lapply(deps, shiny::createWebDependency)
      }
      configuration$deps <- deps
    }

    # probably should remove dependencies from the children
    #   but for now we know the new hydrate will throw them out
    #   for security reasons the old dependencies will not have been scrubbed
    #   and might contain information that could leak
    #   see ?shiny::createWebDependency

    message$configuration <- configuration
  }
  session$sendInputMessage(inputId, message);
}
