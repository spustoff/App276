//
//  EndEdit.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
