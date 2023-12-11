//
//  MenuView.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Circle()
                        .fill(.gray.opacity(0.15))
                        .frame(width: 55, height: 55)
                        .overlay (
                        
                            Image(systemName: "camera")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        )
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("You are")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        HStack {
                            
                            Text("Chief stewardess")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            Spacer()
                            
                            Text("Your's Airline")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 13, weight: .medium))
                        }
                    })
                }
                .padding()
                .background(Color.gray.opacity(0.1).ignoresSafeArea())
                
                Text("My flights")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .semibold))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .top])
                
                if viewModel.flights.isEmpty {
                    
                    VStack(alignment: .center, spacing: 7, content: {
                        
                        Text("No added flights")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 20, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Add active flights for easy income control")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    .padding()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.flights, id: \.self) { index in
                            
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
            
            VStack {
                
                Spacer()
            
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
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
    MenuView()
}
