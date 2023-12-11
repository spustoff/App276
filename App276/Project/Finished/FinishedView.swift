//
//  FinishedView.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

struct FinishedView: View {
    
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Finished")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
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
                
                if viewModel.completed_flights.isEmpty {
                    
                    VStack(alignment: .center, spacing: 7, content: {
                        
                        Text("Empty")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 20, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("You don't have any rescheduled flights yet")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    .padding()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.flights.filter{viewModel.completed_flights.contains($0.flight_number ?? "")}, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedFlight = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 25) {
                                     
                                        HStack {
                                            
                                            Text(index.arrival_time ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                                .multilineTextAlignment(.leading)
                                            
                                            Spacer()
                                            
                                            Text("Completed")
                                                .foregroundColor(.green)
                                                .font(.system(size: 14, weight: .medium))
                                                .padding(9)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.green.opacity(0.2)))
                                                .opacity(viewModel.completed_flights.contains(index.flight_number ?? "") ? 1 : 0)
                                        }
                                        
                                        HStack {
                                            
                                            Text(index.from ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .medium))
                                                .multilineTextAlignment(.leading)
                                            
                                            Circle()
                                                .stroke(.white)
                                                .frame(width: 7, height: 7)
                                            
                                            Spacer()
                                            
                                            Circle()
                                                .stroke(.white)
                                                .frame(width: 7, height: 7)
                                            
                                            Text(index.to ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .medium))
                                                .multilineTextAlignment(.trailing)
                                        }
                                        
                                        HStack(alignment: .bottom) {
                                            
                                            Text(index.airport_from ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Text("\(index.flight_time ?? "") h.")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 11, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                            
                                            Text(index.airport_to ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                                })
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear() {
            
            viewModel.fetchFlights()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            MenuAdd(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let selected = viewModel.selectedFlight {
                
                MenuDetail(selectedFlight: selected, viewModel: viewModel)
            }
        })
    }
}

#Preview {
    FinishedView()
}
