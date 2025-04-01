//
//  CardExpandedView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI
import LogoKit

struct CardExpandedView: View {
    
    @StateObject var securityAccessManager = SecurityAccessManager()
    
    @Binding var isConfettiAnimating: Bool
    @Binding var isCardExpanded: Bool
    
    var user: UserData
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
                
                Logo(style: .animatedWhite, redactWhenScreenCaptured: true)
                    .matchedGeometryEffect(id: "sstaalogo", in: namespace)
            }
            
            SecurityAccessStatusView(securityAccessManager: securityAccessManager)
        }
        .foregroundStyle(.white)
        .padding(21)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(colors: user.memberType.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .matchedGeometryEffect(id: "gradientbackground", in: namespace)
        }
        .padding()
        .onAppear {
            isConfettiAnimating = false
            securityAccessManager.performCheck()
        }
        .onChange(of: securityAccessManager.securityAccessState) { newValue in
            if newValue == .admitted {
                isConfettiAnimating = true
            } else {
                isConfettiAnimating = false
            }
        }
        .onChange(of: securityAccessManager.isTimedOut) { newValue in
            if newValue {
                withAnimation(.easeInOut) {
                    isCardExpanded = false
                    isConfettiAnimating = false
                }
            }
        }
        .accessibilityHidden(true)
    }
}
