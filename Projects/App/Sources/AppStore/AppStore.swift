//
//  AppState.swift
//  App
//
//  Created by 윤희슬 on 8/4/25.
//

import SwiftUI

import ComposableArchitecture
import Core


// 메인 탭에서 사용할 AppReducer
// TabView 를 통해 각 Reducer 를 분리해서 사용할 수 있게끔 함
// State 구조체에는 각각의 TabReducer 의 State 를 인스턴스 프로퍼티로 갖고,
// Action 열거형도 마찬가지로 각각의 TabReducer 의 Action 을 케이스로 가짐
@Reducer
public struct AppStore: Reducer {

    public struct State: Equatable {
        
        public var homeTab = TabStore.State(selectedTab: .home)
        
        public var logTab = TabStore.State(selectedTab: .log)

        public var archiveTab = TabStore.State(selectedTab: .archive)

        public var settingTab = TabStore.State(selectedTab: .setting)
        
    }
    
    public enum Action: Equatable {
        
        case homeTab(TabStore.Action)
        
        case logTab(TabStore.Action)

        case archiveTab(TabStore.Action)

        case settingTab(TabStore.Action)
        
    }
    
    // Scope는 하나의 Store로 메인,서브 스토어 간 State, Action 을 연결지을 수 있게 해줌
    // 또한 Scope는 KeyPath 를 사용하여 각 State, Action 을 메인 인스턴스를 통해 내부의 프로퍼티에 접근할 수 있게끔 함
    // 그래서 각각의 만들어둔 프로퍼티를 통해 State와 Action을 연결하고, 각각의 TabReducer 를 초기화하여
    // 각각의 TabBarItem 에서 Reducer 가 중복되어 연결되지 않게끔 할 수 있음
    public var body: some ReducerOf<Self> {
        Scope(state: \.homeTab, action: \.homeTab) {
            TabStore()
        }
        
        Scope(state: \.logTab, action: \.logTab) {
            TabStore()
        }
        
        Scope(state: \.archiveTab, action: \.archiveTab) {
            TabStore()
        }
        
        Scope(state: \.settingTab, action: \.settingTab) {
            TabStore()
        }

        // 다른 reducer들 합치고 싶다면 여기에 추가
        Reduce { state, action in
            return .none
        }
    }
    
}
