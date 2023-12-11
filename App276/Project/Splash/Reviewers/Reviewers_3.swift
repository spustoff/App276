//
//  Reviewers_3.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

struct Reviewers_3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("reviewers_3")
                .resizable()
            
            VStack {
                
                VStack(alignment: .center, spacing: 6, content: {
                    
                    Text("Control your salary")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Monitor your salary to be sure")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    Reviewers_3()
}
