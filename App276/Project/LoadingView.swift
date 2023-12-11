//
//  LoadingView.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("logo_big")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 220, height: 220)
                .foregroundColor(Color("primary"))
                .shadow(color: Color("primary"), radius: 60, x: 0, y: 0)
            
            ProgressView()
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding()
        }
    }
}

#Preview {
    LoadingView()
}
