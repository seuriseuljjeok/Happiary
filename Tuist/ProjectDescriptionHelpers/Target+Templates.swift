//
//  Target+Templates.swift
//  Manifests
//
//  Created by 윤희슬 on 6/23/25.
//

import ProjectDescription

public struct ModularFactory {
    var name: ModuleLayer.RawValue
    var destinations: Destinations
    var products: Product
    var platform: Platform
    var dependencies: [TargetDependency]
    var bundleId: String
    var deploymentTargets: DeploymentTargets?
    var infoPlist: InfoPlist?
    var sources: SourceFilesList?
    var resources: ResourceFileElements?
    var settings: Settings?
    var entitlements: Entitlements?
    
    
    public init(
        name: ModuleLayer.RawValue = "",
        destinations: Destinations = .iOS,
        products: Product = .framework,
        platform: Platform = .iOS,
        dependencies: [TargetDependency] = [],
        bundleId: String = "",
        deploymentTargets: DeploymentTargets? = .iOS("16.0"),
        infoPlist: InfoPlist? = .default,
        sources: SourceFilesList? = ["Sources/**"],
        resources: ResourceFileElements? = ["Resources/**"],
        settings: Settings? = nil,
        entitlements: Entitlements? = nil
    ) {
        self.name = name
        self.destinations = destinations
        self.products = products
        self.platform = platform
        self.dependencies = dependencies
        self.bundleId = bundleId
        self.deploymentTargets = deploymentTargets
        self.infoPlist = infoPlist
        self.sources = sources
        self.resources = resources
        self.settings = settings
        self.entitlements = entitlements
    }
}

public func makeModular(_ moduleLayer: ModuleLayer, _ factory: ModularFactory) -> Target {
    .target(
        name: moduleLayer.rawValue,
        destinations: factory.destinations,
        product: factory.products,
        bundleId: "io.tuist.\(moduleLayer.rawValue)",
        deploymentTargets: factory.deploymentTargets,
        infoPlist: factory.infoPlist,
        sources: factory.sources,
        resources: factory.resources,
        entitlements: factory.entitlements,
        dependencies: factory.dependencies,
        settings: factory.settings
    )
}


public func makeTest(_ name: String) -> Target {
    .target(
        name: "\(name)Tests",
        destinations: .iOS,
        product: .unitTests,
        bundleId: "io.tuist.\(name)Tests",
        infoPlist: .default,
        sources: ["Tests/**"],
        dependencies: [.target(name: name)]
    )
}
