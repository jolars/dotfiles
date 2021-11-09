# blogdown settings
options(blogdown.ext = ".Rmd", blogdown.author = "Johan Larsson")

# warn on partial matches
options(
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE
  # warnPartialMatchArgs = TRUE
)

# set parallel options
options(mc.cores = max(1, floor(parallel::detectCores() / 2)))

# usethis options
options(
  usethis.full_name = "Johan Larsson",
  usethis.description = list(
    `Authors@R` = 'person("Johan", "Larsson",
                          email = "johanlarsson@outlook.com",
                          role = c("aut", "cre"),
                          comment = c(ORCID = "0000-0002-4029-5945"))',
    License = "MIT + file LICENSE",
    Version = "0.0.0.9000"
  ),
  usethis.protocol = "ssh"
)

# enable autocompletions for package names in `require()`, `library()`
utils::rc.settings(ipck = TRUE)

if (interactive()) {
  suppressMessages(require(devtools))
  suppressMessages(require(testthat))
  suppressMessages(require(usethis))
}

# set CRAN mirror
options(repos = c(CRAN = "https://cloud.r-project.org/"))

# Use httpgd as graphics device for vscode
if (interactive() && Sys.getenv("TERM_PROGRAM") == "vscode") {
  options(vsc.rstudioapi = TRUE)
  options(editor = "code")
  options(vsc.use_httpgd = TRUE) 
} else {
  grDevices::X11.options(
    width = 4.5,
    height = 4,
    ypos = 0,
    xpos = 1000,
    pointsize = 10
  )
}

# Set shiny options
options(shiny.autoreload = TRUE)

# set virtualenv for reticulate (and friends)
reticulate::use_virtualenv("~/.pyenv/versions/reticulate")

