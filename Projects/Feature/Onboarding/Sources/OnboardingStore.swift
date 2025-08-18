//
//  OnboardingStore.swift
//  Onboarding
//
//  Created by 윤희슬 on 8/4/25.
//

import Foundation

import ComposableArchitecture

public enum SwipeDirection {
    
    case next
    
    case previous
    
}

public struct OnboardingStore: Reducer {
    
    public init() {}
    
    public struct State: Equatable {
        
        public var currentStep: Int = 0
        
        public let totalSteps: Int = 3
        
        public var moveToNextStep: SwipeDirection = .next
        
        public var moveToPreviousStep: SwipeDirection = .previous
                
    }
    
    public enum Action: Equatable {
                
        case swipe(SwipeDirection)
        
        case goToMainTab
        
    }
    
    public var body: some ReducerOf<Self> {
                
        Reduce { state, action in
            switch action {                
            case .swipe(let direction):
                switch direction {
                case .next:
                    print("move to next")
                    if state.currentStep < state.totalSteps - 1 {
                        state.currentStep += 1
                    }
                case .previous:
                    print("move to previous")
                    if state.currentStep > 0 {
                        state.currentStep -= 1
                    }
                }
                return .none
                
            case .goToMainTab:
                print("move to home")
                return .none
            }
        }
        
    }
    
    
}
