//
//  Onboarding.swift
//  Onboarding
//
//  Created by 윤희슬 on 8/19/25.
//

import SwiftUI

import DesignSystem


struct Onboarding {
    
    let mainTitle: String
    
    let subTitle: String
    
    let image: Image?
    
    init(mainTitle: String, subTitle: String, image: Image?) {
        self.mainTitle = mainTitle
        self.subTitle = subTitle
        self.image = image
    }
    
    public static var contents: [Onboarding] = [
        Onboarding(
            mainTitle: "first_main_title".localized(bundle: Bundle.module),
            subTitle: "first_sub_title".localized(bundle: Bundle.module),
            image: .firstOnboarding
        ),
        Onboarding(
            mainTitle: "second_main_title".localized(bundle: Bundle.module),
            subTitle: "second_sub_title".localized(bundle: Bundle.module),
            image: .secondOnboarding
        ),
        Onboarding(
            mainTitle: "third_main_title".localized(bundle: Bundle.module),
            subTitle: "third_sub_title".localized(bundle: Bundle.module),
            image: nil
        )
    ]
    
}
