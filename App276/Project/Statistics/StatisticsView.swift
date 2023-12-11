//
//  StatisticsView.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

struct StatisticsView: View {
    
    @AppStorage("completed_flights") var completed_flights: [String] = []
    @AppStorage("salary_history") var salary_history: [Int] = []
    @AppStorage("salary") var salary: Int = 0
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ZStack {
                    
                    VStack(alignment: .leading, spacing: 55, content: {
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Completed Flights")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("\(completed_flights.count)")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .semibold))
                        })
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Your monthly salary")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("$\(salary)")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .semibold))
                        })
                    })
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    Image("graph")
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                }
                .padding([.top, .leading])
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                .frame(height: 250)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    StatisticsView()
}
