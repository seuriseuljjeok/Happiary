//
//  HomeStore.swift
//  Home
//
//  Created by 윤희슬 on 8/25/25.
//

import Foundation

import ComposableArchitecture


public struct HomeStore: Reducer {
    
    public init() {}
    
    public enum State {
        
        case initial
        
    }
    
    public enum Action {
        
        case navigateToRecordLog
        
        case navigateToLogDetail
        
    }
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            case .navigateToLogDetail:
                print("navigateToLogDetail")
                return .none
                
            case .navigateToRecordLog:
                print("navigateToRecordLog")
                return .none
            }
        }
    }
    
}
