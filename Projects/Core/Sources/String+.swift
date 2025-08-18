//
//  empty.swift
//  Core
//
//  Created by 윤희슬 on 8/18/25.
//

import Foundation

extension String {
    public func localized(bundle: Bundle = .main) -> String {
        NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
