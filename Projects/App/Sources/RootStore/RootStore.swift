//
//  AppState.swift
//  App
//
//  Created by 윤희슬 on 8/4/25.
//

import SwiftUI

import ComposableArchitecture
import Core
import Feature
import Onboarding


public struct RootStore: Reducer {

    // root 상태
    public struct State: Equatable {
        
        var hasSeenSplash: Bool = false         // 스플래시 여부
        
        var hasSeenOnboarding: Bool = false     // 온보딩 여부
        
        var tabState: TabStore.State? = nil     // 탭 상태
        
        public init(hasSeenSplash: Bool, hasSeenOnboarding: Bool, tabState: TabStore.State? = nil) {
            self.hasSeenSplash = hasSeenSplash
            self.hasSeenOnboarding = hasSeenOnboarding
            self.tabState = tabState
        }
        
    }
    
    // root에서 받을 액션
    public enum Action {
        
        case splashCompleted
        
        case onboardingCompleted
        
        case tab(TabStore.Action)
        
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            case .splashCompleted:
                UserDefaults.standard.set(true, forKey: "hasSeenSplash")
                state.hasSeenSplash = true
                return .none
                
            case .onboardingCompleted:
                UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                state.hasSeenOnboarding = true
                state.tabState = TabStore.State(selectedTab: .home)
                return .none
                
            case .tab:
                return .none
            }
        }
        .ifLet(\.tabState, action: /RootStore.Action.tab) {
            TabStore()
        }
        
    }
    
}
