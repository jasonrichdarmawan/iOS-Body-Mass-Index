//
//  ContentView.swift
//  Body Mass Index
//
//  Created by Jason Rich Darmawan Onggo Putra on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var index = 0
    @State private var weight = 70.0
    @State private var height = 172.0
    @State private var savedHistories = [
        BMI(date: Date(),
            result: 24.22)]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Menu", selection: $index) {
                    Text("Calculator").tag(0)
                    Text("History").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                if index == 0 {
                    CalculatorView(
                        weight: $weight,
                        height: $height,
                        savedHistories: $savedHistories)
                } else {
                    HistoryView(savedHistories: $savedHistories)
                }
            }
            .navigationTitle(Text("Body Mass Index"))
        }
    } }

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
