//
//  CardExpandedView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct CardExpandedView: View {
    
    @StateObject var securityAccessManager = SecurityAccessManager()
    
    var user: User
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Qin Guan")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontWidth(.expanded)
                        .matchedGeometryEffect(id: "name", in: namespace)
                    Text("OR2022029")
                        .monospaced()
                        .matchedGeometryEffect(id: "membershipnumber", in: namespace)
                }
                Spacer()
                Image(.logoWhite)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 48)
                    .matchedGeometryEffect(id: "sstaalogo", in: namespace)
            }
            
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    switch securityAccessManager.securityAccessState {
                    case .admitted:
                        VStack {
                            Text(securityAccessManager.authorizationRequestDateString)
                                .font(.system(size: 40, weight: .heavy))
                            
                            Text(securityAccessManager.authorizationRequestTimeString)
                                .font(.system(size: 40, weight: .semibold))
                            
                            Text("Alumnus")
                                .font(.system(size: 32, weight: .regular))
                        }
                        .foregroundStyle(.black)
                        .padding()
                    case .denied(let reason):
                        VStack {
                            Image(systemName: "nosign")
                                .font(.system(size: 40, weight: .heavy))
                                .foregroundStyle(.red)
                            
                            Text("Entry Denied")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundStyle(.red)
                            
                            Text(reason.description)
                                .font(.system(size: 21, weight: .regular))
                                .multilineTextAlignment(.center)
                        }
                        .foregroundStyle(.black)
                        .padding()
                    case .processing:
                        ProgressView()
                            .tint(.black)
                    }
                }
        }
        .foregroundStyle(.white)
        .padding(21)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: user.memberType.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .matchedGeometryEffect(id: "gradientbackground", in: namespace)
        }
        .padding()
        .onAppear {
            securityAccessManager.performCheck()
        }
    }
}
