//
//  ModuleType+Templates.swift
//  Manifests
//
//  Created by 윤희슬 on 6/24/25.
//

import ProjectDescription

public protocol ModuleType {
    
    var dependencies: [TargetDependency] { get }
    
}

public enum ModuleLayer: String, ModuleType {
    
    case App

    case DesignSystem

    case Core

    case Feature
    
    case Onboarding
    
    public var dependencies: [TargetDependency] {
        switch self {
        case .App:
            return [
                .external(name: "ComposableArchitecture"),
                .project(target: "Core", path: .relativeToRoot("Projects/Core")),
                .project(target: "Feature", path: .relativeToRoot("Projects/Feature")),
                .project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem"))
            ]
            
        case .DesignSystem:
            return []
            
        case .Core:
            return [
                .external(name: "ComposableArchitecture"),
                .project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem"))
            ]
            
        case .Feature:
            return [
                .external(name: "ComposableArchitecture"),
                .project(target: "Core", path: .relativeToRoot("Projects/Core")),
                .project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem")),
                .project(target: "Onboarding", path: .relativeToRoot("Projects/Feature/Onboarding")),
            ]
            
        case .Onboarding:
            return [
                .external(name: "ComposableArchitecture"),
                .project(target: "Core", path: .relativeToRoot("Projects/Core")),
                .project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem"))
            ]
        }
        
    }
    
}
