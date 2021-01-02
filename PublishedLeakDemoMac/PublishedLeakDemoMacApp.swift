//
//  PublishedLeakDemoMacApp.swift
//  PublishedLeakDemoMac
//
//  Created by Daniel Jilg on 02.01.21.
//

import SwiftUI

@main
struct PublishedLeakDemoMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataContainer())
        }
    }
}
