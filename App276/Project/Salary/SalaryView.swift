//
//  SalaryView.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

struct SalaryView: View {
    
    @StateObject var viewModel = SalaryViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        
                        Text("Salary per hour of work")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("$\(viewModel.salary)")
                            .foregroundColor(.white)
                            .font(.system(size: 21, weight: .semibold))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEdit = true
                        }
                        
                    }, label: {
                        
                        Text("Edit")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(.white))
                    })
                }
                .padding()
                .background(Color.purple.ignoresSafeArea())
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(["Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan"], id: \.self) { index in
                        
                            VStack(alignment: .center, spacing: 5, content: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text("2023")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 12, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            .overlay(
                            
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("primary"))
                                    .opacity(index == "Nov" ? 1 : 0)
                            )
                        }
                    }
                    .padding(1)
                    .padding(.horizontal)
                }
                
                VStack {
                    
                    if viewModel.salary_history.isEmpty {
                        
                        VStack(alignment: .center, spacing: 7, content: {
                            
                            Text("Empty")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 20, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("There are no completed flights this month yet")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        .padding()
                        
                    } else {
                        
                        VStack(alignment: .center, spacing: 7, content: {
                            
                            Text("Monthly payment")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("$\(viewModel.salary_history.reduce(0, +))")
                                .foregroundColor(.white)
                                .font(.system(size: 21, weight: .semibold))
                        })
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.salary_history, id: \.self) { index in
                                
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            
                                            Text("November")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .medium))
                                            
                                            Text("Today")
                                                .foregroundColor(.white.opacity(0.5))
                                                .font(.system(size: 12, weight: .regular))
                                        })
                                        
                                        Spacer()
                                        
                                        Text("$\(index)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .semibold))
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            
            VStack {
                
                Spacer()
            
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .semibold))
                            .frame(width: 60, height: 60)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                    })
                }
            }
            .padding()
        }
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isEdit ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture() {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEdit = false
                        }
                    }
                
                VStack {
                    
                    Text("Editing Salary")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("$1000.00")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.count_edit.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.count_edit)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        UIApplication.shared.endEditing()
                        
                        viewModel.salary = Int(viewModel.count_edit) ?? 0
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEdit = false
                        }
                        
                        viewModel.count_edit = ""
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            .padding(.top)
                    })
                    .opacity(viewModel.count_edit.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.count_edit.isEmpty ? true : false)
                }
                .padding()
                .background(Color("bg"))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isEdit ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isAdd ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture() {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                    }
                
                VStack {
                    
                    Text("Adding an Amount")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("$1000.00")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.count_field.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.count_field)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        UIApplication.shared.endEditing()
                        
                        viewModel.salary_history.append(Int(viewModel.count_field) ?? 0)
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                        viewModel.count_field = ""
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            .padding(.top)
                    })
                    .opacity(viewModel.count_field.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.count_field.isEmpty ? true : false)
                }
                .padding()
                .background(Color("bg"))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAdd ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SalaryView()
}
