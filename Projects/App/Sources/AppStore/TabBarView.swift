//
//  TabReducer.swift
//  App
//
//  Created by 윤희슬 on 8/4/25.
//

import SwiftUI

import ComposableArchitecture
import Core
import DesignSystem


public struct TabBarView: View {
    
    // Step 4. Feature를 갖는 Store 생성
    // Action을 처리하여 State를 업데이트하고, 이러한 효과들로부터의 데이터를 시스템으로 다시 피드백할 수 있는 객체
    // Store는 let으로 저장할 수 있음. Store 안의 데이터에 관한 관찰은 ObservableState() 매크로를 사용하여 자동으로 이뤄짐
    public let store: StoreOf<TabStore>
    
    public init(store: StoreOf<TabStore>) {
        self.store = store
    }
    
    // Step 4에서는 동적 멤버 조회를 통해 Store로부터 State의 속성을 직접 읽을 수 있으며, 'send(_:)' 메소드를 통해 Store에 Action을 보낼 수 있음
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                // background
                HappiaryBackgroundView()
                
                // content
                selectedTabView(viewStore)
                
                // tabbar
                tabBarView(viewStore)
            }
        }
    }
    
    @ViewBuilder
    private func selectedTabView(_ viewStore: ViewStoreOf<TabStore>) -> some View {
        // branching the screen to be displayed depending on tab status
        Group {
            // TODO: - change to the view corresponding to each tab
//            switch viewStore.state.selectedTab {
//            case .home:
//                IfLetStore(self.store.scope(state: \.home, action: { .home($0) })) {
//                    HomeView(store: $0)
//                }
//            case .log:
//                IfLetStore(self.store.scope(state: \.log, action: { .log($0) })) {
//                    LogView(store: $0)
//                }
//                
//            case .archive:
//                IfLetStore(self.store.scope(state: \.archive, action: { .archive($0) })) {
//                    ArchiveView(store: $0)
//                }
//                
//            case .setting:
//                IfLetStore(self.store.scope(state: \.setting, action: { .setting($0) })) {
//                    SettingView(store: $0)
//                }
//            }
        }
    }
    
    @ViewBuilder
    private func tabBarView(_ viewStore: ViewStoreOf<TabStore>) -> some View {
        HStack(alignment: .center, spacing: 12) {
            ForEach(Tab.allCases, id: \.self) { tab in
                let isSelected = viewStore.selectedTab == tab
                let icon = isSelected ? tab.selectedIcon : tab.unselectedIcon
                
                HappiaryTabBarItem(
                    title: tab.title,
                    icon: icon,
                    isSelected: isSelected
                ) {
                    viewStore.send(.selectTab(tab))
                }
            }
        }
        .background(Color.tabBarBg)
        .padding(.horizontal, 20)
    }
    
}
