//
//  RootView.swift
//  App
//
//  Created by 윤희슬 on 8/4/25.
//

import SwiftUI

import ComposableArchitecture
import Core
import Feature
import Onboarding

public struct RootView: View {
    
    public let store: StoreOf<RootStore>
    
    let onboardingStore: StoreOf<OnboardingStore> = StoreOf<OnboardingStore>(
        initialState: OnboardingStore.State(
            currentStep: 0,
            dragOffset: 0,
            isLastStep: false
        ),
        reducer: { OnboardingStore()}
    )
    
    public init(store: StoreOf<RootStore>) {
        self.store = store
    }
    
    public var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            if viewStore.hasSeenOnboarding, let tabState = viewStore.tabState {
                MainTabView(
                    store: store.scope(
                        state: \.tabState!,
                        action: RootStore.Action.tab
                    )
                )
            } else {
                if !viewStore.hasSeenSplash {
                    SplashView() {
                        viewStore.send(.splashCompleted)
                    }
                } else {
                    OnboardingView(store: onboardingStore)
                }
            }
        }
    }
    
}
