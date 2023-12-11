//
//  SettingsView.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
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
                
                Button(action: {
                    
                    guard let url = URL(string: decodeBase64("https://www.termsfeed.com/live/ecae7ccd-9961-48f0-999f-3341b090d5c0")) else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Rate Us")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    completed_flights.removeAll()
                    salary = 0
                    salary_history.removeAll()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "trash.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Reset Progress")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.horizontal)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
