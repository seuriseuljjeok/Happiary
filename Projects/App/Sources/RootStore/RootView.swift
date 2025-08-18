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
    
    public init(store: StoreOf<RootStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            if viewStore.hasSeenOnboarding, let tabState = viewStore.tabState {
                TabView(
                    store: store.scope(
                        state: \.tabState!,
                        action: RootStore.Action.tab
                    )
                )
            } else {
                OnboardingView {
                    viewStore.send(.onboardingCompleted)
                }
            }
        }
    }
    
}
