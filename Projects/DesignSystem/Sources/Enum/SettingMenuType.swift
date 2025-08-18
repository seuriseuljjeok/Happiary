//
//  SettingMenuType.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/8/25.
//

import SwiftUI

public enum SettingMenuType {
    
    case button(image: Image, action: () -> Void)
    
    case toggle(isOn: Binding<Bool>)
    
    case none
    
}
