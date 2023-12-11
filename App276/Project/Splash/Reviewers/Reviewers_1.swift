//
//  Reviewers_1.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

struct Reviewers_1: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("reviewers_1")
                .resizable()
            
            VStack {
                
                VStack(alignment: .center, spacing: 6, content: {
                    
                    Text("Your profile")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Manage your profile for convenience")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviewers_2()
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
    }
}

#Preview {
    Reviewers_1()
}
