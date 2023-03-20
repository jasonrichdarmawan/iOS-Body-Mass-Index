//
//  ContentView.swift
//  Body Mass Index
//
//  Created by Jason Rich Darmawan Onggo Putra on 20/03/23.
//

import SwiftUI

struct CalculatorView: View {
    @Binding var weight: Double
    @Binding var height: Double
    @Binding var savedHistories: [BMI]
    
    var body: some View {
        VStack {
            HStack {
                Text("Weight (kg)")
                    .foregroundColor(.gray)
                    .font(.body)
                Spacer()
                Text("\(weight, specifier: "%.2f")")
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.bold)
            }.padding(.top, 20)
            Slider(value: $weight, in: 40...150)
            
            HStack {
                Text("Height (cm)")
                    .foregroundColor(.gray)
                    .font(.body)
                Spacer()
                Text("\(height, specifier: "%.2f")")
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.bold)
            }.padding(.top, 20)
            Slider(value: $height, in: 80...200)
            
            HStack {
                Text("Your Body Mass Index")
                    .foregroundColor(.gray)
                    .font(.body)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(BMIHelper.calculateBMI(weight: weight, height: height), specifier: "%.2f")")
                        .font(.title)
                        .bold()
                    Text("\(BMIHelper.bmiScale(weight: weight, height: height).scale)")
                        .font(.body)
                        .foregroundColor(BMIHelper.bmiScale(weight: weight, height: height).color)
                }
            }.padding(.top, 20)
            Spacer()
            
            Button(action: {
                let BMIData = BMI(date: Date(), result: BMIHelper.calculateBMI(weight: weight, height: height))
                savedHistories.insert(BMIData, at: 0)
            }) {
                Text("Save to history")
                    .frame(maxWidth: .infinity)
                    .padding(10)
            }
            .buttonStyle(.bordered)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle(Text("Body Mass Index"))
    }
}

struct CalculatorViewPreview: PreviewProvider {
    static var previews: some View {
        CalculatorView(
            weight: .constant(70),
            height: .constant(172),
            savedHistories: .constant([]))
    }
}
