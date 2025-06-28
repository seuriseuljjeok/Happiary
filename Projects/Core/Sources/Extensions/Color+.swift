//
//  Color+.swift
//  Core
//
//  Created by 윤희슬 on 6/24/25.
//

import SwiftUI

import DesignSystem


public extension Color {
    
    static func color(_ name: String) -> Color {
        Color(name, bundle: .designSystemModule)
    }

    static var accentCoral: Color {
        color("AccentCoral")
    }

    static var charcolGray: Color {
        color("CharcolGray")
    }
    
    static var deepBrown: Color {
        color("DeepBrown")
    }

    static var graphGreen: Color {
        color("GraphGreen")
    }
    
    static var lightBlue: Color {
        color("LightBlue")
    }

    static var lightGray: Color {
        color("LightGray")
    }
    
    static var lightGreen: Color {
        color("LightGreen")
    }

    static var lightMargenta: Color {
        color("LightMargenta")
    }
    
    static var lightPink: Color {
        color("LightPink")
    }

    static var lightYellow: Color {
        color("LightYellow")
    }
    
    static var strokeGray: Color {
        color("StrokeGray")
    }

}
