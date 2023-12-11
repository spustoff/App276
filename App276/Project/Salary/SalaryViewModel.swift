//
//  SalaryViewModel.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

final class SalaryViewModel: ObservableObject {
    
    @AppStorage("salary_history") var salary_history: [Int] = []
    @AppStorage("salary") var salary: Int = 0
    
    @Published var isAdd: Bool = false
    @Published var isEdit: Bool = false
    
    @Published var count_edit: String = ""
    @Published var count_field: String = ""
}
