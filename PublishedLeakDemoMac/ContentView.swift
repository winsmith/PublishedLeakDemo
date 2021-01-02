//
//  ContentView.swift
//  PublishedLeakDemoMac
//
//  Created by Daniel Jilg on 02.01.21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataContainer: DataContainer = DataContainer()

    var body: some View {

        Button("Push this button to increase memory usage!") {
            for _ in 0...20 {
                dataContainer.someBoolean.toggle()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
