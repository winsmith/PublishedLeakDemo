//
//  DataContainer.swift
//  PublishedLeakDemoMac
//
//  Created by Daniel Jilg on 02.01.21.
//

import Foundation
import SwiftUI

class DataContainer: ObservableObject {
    @Published var someBoolean: Bool = false

    func toggleSomeBoolean() {

        for _ in 0...20 {
            someBoolean.toggle()
        }
    }
}
