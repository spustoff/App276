//
//  MenuDetail.swift
//  App276
//
//  Created by Вячеслав on 11/24/23.
//

import SwiftUI

struct MenuDetail: View {
    
    let selectedFlight: MenuModel
    
    @StateObject var viewModel: MenuViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 25) {
                 
                    Text(selectedFlight.flight_number ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.leading)
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        HStack {
                            
                            Text(selectedFlight.from ?? "")
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
                            
                            Text(selectedFlight.to ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack(alignment: .bottom) {
                            
                            Text(selectedFlight.airport_from ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            Text("\(selectedFlight.flight_time ?? "") h.")
                                .foregroundColor(.gray)
                                .font(.system(size: 11, weight: .regular))
                                .frame(maxWidth: .infinity)
                            
                            Text(selectedFlight.airport_to ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                    })
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        HStack {
                            
                            Text("Departure date")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            Text("Arrival date")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack(alignment: .bottom) {
                            
                            Text(selectedFlight.departure_time ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Text(selectedFlight.arrival_time ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        }
                    })
                }
                .padding()
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)).ignoresSafeArea())
                
                VStack(alignment: .center, spacing: 7, content: {
                    
                    Text("No notes yet")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("There are no notes written for this flight yet")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .frame(maxHeight: .infinity, alignment: .center)
                .padding()
                
                Button(action: {
                    
                    viewModel.completed_flights.append(selectedFlight.flight_number ?? "")
                    
                }, label: {
                    
                    Text(viewModel.completed_flights.contains(selectedFlight.flight_number ?? "") ? "Flight is Completed" : "Completed")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.completed_flights.contains(selectedFlight.flight_number ?? "") ? 0.5 : 1)
                .disabled(viewModel.completed_flights.contains(selectedFlight.flight_number ?? "") ? true : false)
            }
        }
    }
}

//#Preview {
//    MenuDetail(viewModel: MenuViewModel())
//}
