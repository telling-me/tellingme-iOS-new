import ProjectDescription

let nameAttribute = Template.Attribute.required("name")

let template = Template(
    description: "Feature Template",
    attributes: [nameAttribute],
    items: [
        .file(
            path: "Project.swift",
            templatePath: "project.stencil"
        ),
        .directory(
            path: "Targets",
            sourcePath: "Scene"
        )
    ]
)
