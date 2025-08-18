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
        
        var hasSeenOnboarding: Bool = false    // 온보딩 여부
        
        var tabState: TabStore.State? = nil  // 탭 상태
        
    }
    
    // root에서 받을 액션
    public enum Action {
        
        case onboardingCompleted
        
        case tab(TabStore.Action)
        
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
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
