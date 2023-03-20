//
//  HistoryView.swift
//  Body Mass Index
//
//  Created by Jason Rich Darmawan Onggo Putra on 20/03/23.
//

import SwiftUI

struct HistoryView: View {
    @Binding var savedHistories: [BMI]
    
    var body: some View {
        List(savedHistories) { BMIData in
            NavigationLink(destination: DetailView()) {
                VStack(alignment: .leading) {
                    Text("\(BMIData.date.formatted(date: .abbreviated, time: .shortened)))")
                    HStack {
                        Text("\(BMIData.result, specifier: "%.2f")")
                            .font(.title)
                            .bold()
                        Spacer()
                        Text(BMIHelper.bmiScale(result: BMIData.result).scale)
                            .font(.title2)
                            .foregroundColor(BMIHelper.bmiScale(result: BMIData.result).color)
                    }
                }
            }
        }
    }
}

struct HistoryViewPreview: PreviewProvider {
    static var previews: some View {
        HistoryView(savedHistories: .constant(
            [BMI(date: Date(), result: 12.52)])
        )
    }
}
