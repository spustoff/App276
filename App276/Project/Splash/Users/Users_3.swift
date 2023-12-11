//
//  Users_3.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI
import OneSignalFramework

struct Users_3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("users_3")
                .resizable()
            
            VStack {
                
                VStack(alignment: .center, spacing: 6, content: {
                    
                    Text("Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Don't miss anything important")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                      print("User accepted notifications: \(accepted)")
                    }, fallbackToSettings: true)
                    
                }, label: {
                    
                    Text("Enable Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                })
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Skip")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary").opacity(0.1)))
                })
            }
            .padding()
        }
    }
}

#Preview {
    Users_3()
}
