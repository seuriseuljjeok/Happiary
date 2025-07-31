//
//  Font+.swift
//  Manifests
//
//  Created by 윤희슬 on 6/24/25.
//

import SwiftUI


public extension Font {
    
    static func poor(_ size: CGFloat) -> Font {
        return DesignSystemFontFamily.PoorStory.regular.swiftUIFont(size: size)
    }
    
}
