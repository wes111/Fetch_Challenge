//
//  ViewModelState.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/7/24.
//

import Foundation

enum ViewModelState<T: Equatable> {
    case idle
    case loading
    case refreshing
    case success(data: T)
    case failed(error: Error)
}

extension ViewModelState: Equatable {
    static func == (lhs: ViewModelState<T>, rhs: ViewModelState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading), (.refreshing, .refreshing):
            return true
        case (.success(let lhsData), .success(let rhsData)):
            return lhsData == rhsData
        case (.failed(let lhsError), .failed(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
