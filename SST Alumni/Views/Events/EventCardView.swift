//
//  EventCardView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 4/2/25.
//

import SwiftUI
import CacheAsyncImageKit

struct EventCardView: View {
    
    var event: Event
    
    @Namespace private var namespace
    
    @State private var isExpanded = false
    
    var body: some View {
        Button {
            isExpanded = true
        } label: {
            ZStack(alignment: .bottom) {
                CacheAsyncImage(url: event.badgeImage) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.thickMaterial)
                }
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay {
                    LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .center, endPoint: .bottom)
                }
                .matchedTransitionSource(id: "event.image", in: namespace)
                
                VStack(alignment: .leading) {
                    Text(event.startDateTime, style: .date)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(event.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                        .fontWeight(.bold)
                        .fontWidth(.expanded)
                }
                .padding()
            }
        }
        .sheet(isPresented: $isExpanded) {
            ZStack(alignment: .topLeading) {
                ScrollView {
                    VStack(alignment: .leading) {
                        CacheAsyncImage(url: event.badgeImage) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.thickMaterial)
                        }
                        .overlay {
                            LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .center, endPoint: .bottom)
                        }
                        .navigationTransition(.zoom(sourceID: "event.image", in: namespace))
                        .overlay(alignment: .bottom) {
                            Text(event.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .fontWidth(.expanded)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Grid(alignment: .leading) {
                            GridRow {
                                Image(systemName: "mappin.and.ellipse")
                                Text(event.location)
                            }
                            
                            GridRow {
                                Image(systemName: "calendar")
                                Text(event.startDateTime.formatted(date: .complete, time: .omitted))
                            }
                            
                            GridRow {
                                Image(systemName: "clock")
                                Text("\(event.startDateTime.formatted(date: .omitted, time: .shortened)) to \(event.endDateTime.formatted(date: .omitted, time: .shortened))")
                            }
                        }
                        .padding(.horizontal)
                        
                        Text(event.description)
                            .padding()
                    }
                }
                .ignoresSafeArea(edges: .top)
                
                Button {
                    isExpanded = false
                } label: {
                    Image(systemName: "xmark")
                        .padding()
                        .background(.thickMaterial)
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                        .padding()
                }
                
                Button {
                    
                } label: {
                    Text("Register")
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding()
            }
        }
    }
}
