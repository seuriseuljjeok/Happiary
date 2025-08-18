//
//  TabStore.swift
//  Feature
//
//  Created by 윤희슬 on 8/18/25.
//

import Foundation

import ComposableArchitecture

// reducer protocol 채택
// reducer protocol을 채택하는 Feature라는 하나의 단위로 State, Action, body를 묶어서 사용하고 있음
public struct TabStore: Reducer {
        
    // Step 1. State 세팅
    public struct State: Equatable {
        
        public var selectedTab: Tab = .home
        
//        public var home: HomeStore.State? = .init()
//
//        public var log: LogStore.State? = .init()
//
//        public var archive: ArchiveStore.State? = .init()
//
//        public var setting: SettingStore.State? = .init()

        public var showTabBar: Bool = true

        public init(selectedTab: Tab) {
            self.selectedTab = selectedTab
        }
        
    }
    
    // Step 2. Action 세팅
    public enum Action: BindableAction, Equatable {
        
        case binding(BindingAction<State>)
        
        case selectTab(Tab)
        
//        case home(HomeStore.Action)
//
//        case log(LogStore.Action)
//
//        case archive(ArchiveStore.Action)
//
//        case setting(SettingStore.Action)
        
    }
    
    public init() {}

    // Step 3. Action과 State를 관리하는 Reducer 세팅
    // ReducerOf<R: Reducer> = Reducer<R.State, R.Action>
    // Reduce(reduce: (inout State, Action) -> Effect<Action>)
    public var body: some ReducerOf<Self> {
        // BindingReducer가 body 내부에서 작동하고 바인딩 액션이 수신되면 상태를 변경
        // BindingReducer는 State와 Action 사이를 바인딩하는 역할을 가짐
        // 즉, 바인딩 State 요소가 업데이트되면 BindingReducer가 해당 상태값과 액션을 수신하여 Reducer 클로저 내에서 도메인 로직을 처리해 결과를 State에 반영
        // 추가로, 바인딩 시 더 다른 로직을 추가하고 싶다면 아래와 같이 binding 액션 케이스에서 구현해줄 수 있음
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .selectTab(let tab):
                state.selectedTab = tab
                print("현재 탭: \(tab.title)")
                return .none
                
//            case .home:
//                if state.currentScene == .home {
//                    state.showTabBar = state.home?.path.isEmpty ?? false
//                }
//                return .none
//
//            case .log:
//                if state.currentScene == .log {
//                    state.showTabBar = state.log?.path.isEmpty ?? false
//                }
//                return .none
//
//            case .archive:
//                if state.currentScene == .archive {
//                    state.showTabBar = state.archive?.path.isEmpty ?? false
//                }
//                return .none
//
//            case .setting:
//                if state.currentScene == .setting {
//                    state.showTabBar = state.setting?.path.isEmpty ?? false
//                }
//                return .none
                
            }
            
        }
//        .ifLet(\.home, action: /Action.home) {
//            HomeStore()._printChanges()
//        }
//        .ifLet(\.log, action: /Action.log) {
//            LogStore()._printChanges()
//        }
//        .ifLet(\.archive, action: /Action.archive) {
//            ArchiveStore()._printChanges()
//        }
//        .ifLet(\.setting, action: /Action.setting) {
//            SettingStore()._printChanges()
//        }
    }
    
}
