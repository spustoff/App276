//
//  Users_2.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI
import StoreKit

struct Users_2: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("users_2")
                .resizable()
            
            VStack {
                
                VStack(alignment: .center, spacing: 6, content: {
                    
                    Text("Rate us in AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("You will help us")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Users_3()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                })
            }
            .padding()
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Users_2()
}
