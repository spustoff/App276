//
//  MenuAdd.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

struct MenuAdd: View {
    
    @StateObject var viewModel: MenuViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New Flight")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .medium))
                    .padding([.horizontal, .top])
                    .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Flight Number")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.flight_number.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.flight_number)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        .padding(.bottom)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("To")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.to.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.to)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Airport")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.airport_to.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.airport_to)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Departure Time")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.departure_time.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.departure_time)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        }
                        .padding(.bottom)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("From")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.from.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.from)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Airport")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.airport_from.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.airport_from)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Arrival Time")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.arrival_time.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.arrival_time)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        }
                        .padding(.bottom)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Flight Time")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.flight_time.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.flight_time)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addFlight {
                        
                        UIApplication.shared.endEditing()
                        
                        viewModel.fetchFlights()
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.flight_number.isEmpty || viewModel.to.isEmpty || viewModel.airport_to.isEmpty || viewModel.departure_time.isEmpty || viewModel.from.isEmpty || viewModel.airport_from.isEmpty || viewModel.arrival_time.isEmpty || viewModel.flight_time.isEmpty ? 0.5 : 1)
                .disabled(viewModel.flight_number.isEmpty || viewModel.to.isEmpty || viewModel.airport_to.isEmpty || viewModel.departure_time.isEmpty || viewModel.from.isEmpty || viewModel.airport_from.isEmpty || viewModel.arrival_time.isEmpty || viewModel.flight_time.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    MenuAdd(viewModel: MenuViewModel())
}
