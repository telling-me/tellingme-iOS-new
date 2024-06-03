import ProjectDescription

let workspace = Workspace(
    name: "TellingMe",
    projects: [
        "Projects/App",
        "Projects/AppCore",
        "Projects/AppFeature/Root",
        // Projects/AppFeature/...
        "Projects/Shared"
    ]
)
