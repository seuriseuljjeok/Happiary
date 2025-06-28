//
//  Image+.swift
//  Core
//
//  Created by 윤희슬 on 6/28/25.
//

import SwiftUI

import DesignSystem


public extension Image {
    
    static func setImage(_ name: String) -> Image {
        Image(name, bundle: .designSystemModule)
    }
    
}
