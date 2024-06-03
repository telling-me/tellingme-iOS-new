import ProjectDescription

extension Project {
    public static func make(
        name: String,
        targets: [Target],
        packages: [Package] = [],
        resourceSynthesizers: [ResourceSynthesizer] = []
    ) -> Self {
        return Project(
            name: name,
            organizationName: "tellingUs",
            options: .options(),
            packages: packages,
            targets: targets,
            resourceSynthesizers: resourceSynthesizers
        )
    }
}

//extension SourceFilesList {
//    public static func make(prefix: Self) -> Self {
//        return "prefix/Sources/**"
//    }
//}
//ProjectDescription.? = nil, resources: ProjectDescription.ResourceFileElements?
