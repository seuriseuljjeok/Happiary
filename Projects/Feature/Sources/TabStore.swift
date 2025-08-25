//
//  TabStore.swift
//  Feature
//
//  Created by 윤희슬 on 8/18/25.
//

import Foundation

import ComposableArchitecture
import Home

// reducer protocol 채택
// reducer protocol을 채택하는 Feature라는 하나의 단위로 State, Action, body를 묶어서 사용하고 있음
public struct TabStore: Reducer {
        
    // Step 1. State 세팅
    public struct State: Equatable {
        
        public var selectedTab: Tab
        
        public var home: HomeStore.State

        public var showTabBar: Bool
        
        public init(
            selectedTab: Tab = .home,
            home: HomeStore.State = .initial,
            showTabBar: Bool = true
        ) {
            self.selectedTab = selectedTab
            self.home = home
            self.showTabBar = showTabBar
        }
        
    }
    
    // Step 2. Action 세팅
    public enum Action: Equatable {
        
        case selectTab(Tab)
        
        case home(HomeStore.Action)
        
    }
    
    public init() {}

    public var body: some ReducerOf<Self> {

        Reduce { state, action in
            switch action {
            case .selectTab(let tab):
                state.selectedTab = tab
                print("현재 탭: \(tab.title)")
                return .none
                
            case .home:
                state.showTabBar = true
                return .none
                
            }
            
        }
    }
    
}
