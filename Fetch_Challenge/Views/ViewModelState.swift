//
//  ViewModelState.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/7/24.
//

import Foundation

enum ViewModelState<T> {
    case idle
    case loading
    case refreshing
    case success(data: T)
    case failed(error: Error)
}
