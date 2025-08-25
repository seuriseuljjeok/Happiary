//
//  HomeView.swift
//  Manifests
//
//  Created by 윤희슬 on 8/25/25.
//

import SwiftUI

import ComposableArchitecture
import Core
import DesignSystem

public struct HomeView: View {
    
    public let store: StoreOf<HomeStore>
    
    public init(store: StoreOf<HomeStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                HappiaryBackgroundView()
                
                VStack(spacing: 44) {
                    navigationBar(viewStore)
                    
                    todayLog(viewStore)
                    
                    Spacer()
                }
            }
        }
    }
}


// MARK: - Sub Views

extension HomeView {
    
    // Navigation Bar
    
    func navigationBar(_ viewStore: ViewStore<HomeStore.State, HomeStore.Action>) -> some View {
        HappiaryNavigationBar(
            center: {
                Text("HOME_TITLE".localized(bundle: Bundle.module))
                    .customTextStyle(alignment: .center, fontSize: 36)
            },
            right: {
                Button(action: {
                    viewStore.send(.navigateToRecordLog)
                }) {
                    Image.icPlus
                        .resizable()
                        .customImageStyle(width: 20, height: 20)
                }
            }
        )
        .padding(.top, 30)
    }
    
    // Today's Log
    
    func todayLog(_ viewStore: ViewStore<HomeStore.State, HomeStore.Action>) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("TODAY_LOG".localized(bundle: Bundle.module))
                .customTextStyle(fontSize: 22)
            
            Image.paper
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(alignment: .center) {
                    VStack(alignment: .center, spacing: 30) {
                        Text("MAIN_EMPTY_TITLE".localized(bundle: Bundle.module))
                            .customTextStyle(fontSize: 22, fontColor: .charcolGray)
                        
                        Text("SUB_EMPTY_TITLE".localized(bundle: Bundle.module))
                            .customTextStyle(fontSize: 18, fontColor: .charcolGray)
                        
                        HappiaryRoundedButton(
                            isEnable: .constant(true),
                            horizontalPadding: 25,
                            height: 42,
                            title: "RECORD_TODAY_LOG".localized(bundle: Bundle.module),
                            fontSize: 18
                        ) {
                            store.send(.navigateToRecordLog)
                        }
                    }
                }
        }
        .padding(.horizontal, 20)
    }
    
}

