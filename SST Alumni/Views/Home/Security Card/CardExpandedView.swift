//
//  CardExpandedView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct CardExpandedView: View {
    
    @StateObject var securityAccessManager = SecurityAccessManager()
    
    @Binding var isCardExpanded: Bool
    
    var user: User
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .fontWidth(.expanded)
                        .matchedGeometryEffect(id: "name", in: namespace)
                    Text(user.memberId)
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
            
            SecurityAccessStatusView(securityAccessManager: securityAccessManager)
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
        .onChange(of: securityAccessManager.isTimedOut) { newValue in
            if newValue {
                withAnimation(.easeInOut) {
                    isCardExpanded = false
                }
            }
        }
    }
}
