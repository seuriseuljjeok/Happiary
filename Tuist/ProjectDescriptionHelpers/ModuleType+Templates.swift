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
    
    
    public var dependencies: [TargetDependency] {
        switch self {
        case .App:
            return [
                .external(name: "ComposableArchitecture"),
                .project(target: "Core", path: .relativeToRoot("Projects/Core"))
            ]
            
        case .DesignSystem:
            return []
            
        case .Core:
            return [
                .project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem"))
            ]
        }
        
    }
    
}
