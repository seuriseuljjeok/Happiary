//
//  OnboardingView.swift
//  Onboarding
//
//  Created by 윤희슬 on 8/12/25.
//

import SwiftUI

import Core
import DesignSystem

public struct OnboardingView: View {
    
    let onComplete: () -> Void
    
    public init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }
    
    public var body: some View {
        ZStack {
            HappiaryBackgroundView()
                .ignoresSafeArea()
            
            SplashView()
            
        }
    }
    
}


struct SplashView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Happiary")
                .customTextStyle(
                    alignment: .center,
                    fontSize: 60,
                    padding: EdgeInsets(top: 124, leading: 0, bottom: 92, trailing: 0)
                )
         
            Text("splash_title".localized(bundle: Bundle.module))
                .customTextStyle(
                    alignment: .center,
                    fontSize: 26,
                    lineLimit: 2,
                    multiLineAlignment: .center
                )
                .lineSpacing(14)
            
            Spacer()
        }
    }
    
}
