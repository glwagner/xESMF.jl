using Documenter
using XESMF

# Set up the documentation
makedocs(
    sitename = "XESMF.jl",
    authors = "Gregory Wagner <wagner.greg@gmail.com>",
    modules = [XESMF],
    pages = [
        "Home" => "index.md",
        "API Reference" => "api.md",
        "Examples" => "examples.md",
        "Development" => "development.md",
    ],
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://glwagner.github.io/xESMF.jl",
        assets = String[],
    ),
    checkdocs = :exports,
    doctest = true,
)

# Deploy documentation to GitHub Pages
deploydocs(
    repo = "github.com/glwagner/xESMF.jl.git",
    devbranch = "main",
    push_preview = true,
)
