//
//  Alert+Extensions.swift
//  Fetch_Challenge
//
//  Created by Wesley Luntsford on 9/8/24.
//

import SwiftUI

extension Alert {
    static let genericAlert = Alert(
        title: Text("An Error has Occurred"),
        message: Text("Please try again later."),
        dismissButton: .default(Text("OK"))
    )
}
