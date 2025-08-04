//
//  empty.swift
//  Core
//
//  Created by 윤희슬 on 7/31/25.
//

import SwiftUI

import DesignSystem


public enum Tab: CaseIterable {
    
    case home
    
    case log
    
    case archive
    
    case setting
    
    public var title: String {
        switch self {
        case .home:
            return "홈"
            
        case .log:
            return "로그"

        case .archive:
            return "아카이브"

        case .setting:
            return "설정"

        }
    }
    
    public var unselectedIcon: Image {
        switch self {
        case .home:
            return .unselectedHome
            
        case .log:
            return .unselectedLog
        
        case .archive:
            return .unselectedArchive
            
        case .setting:
            return .unselectedSetting
        }
    }
    
    public var selectedIcon: Image {
        switch self {
        case .home:
            return .selectedHome
            
        case .log:
            return .selectedLog
        
        case .archive:
            return .selectedArchive
            
        case .setting:
            return .selectedSetting
        }
    }
    
}
