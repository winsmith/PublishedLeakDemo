//
//  ContentView.swift
//  PublishedLeakDemoMac
//
//  Created by Daniel Jilg on 02.01.21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataContainer: DataContainer

    var body: some View {

        Button("Push this button to increase memory usage!") {
            dataContainer.toggleSomeBoolean()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
