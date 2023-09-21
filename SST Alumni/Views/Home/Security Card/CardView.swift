//
//  CardView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct CardView: View {
    
    var namespace: Namespace.ID
    
    var user: UserData
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.title)
                .fontWeight(.bold)
                .fontWidth(.expanded)
                .matchedGeometryEffect(id: "name", in: namespace)
            
            Text(user.memberId)
                .monospaced()
                .matchedGeometryEffect(id: "membershipnumber", in: namespace)
            
            Spacer()
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Class of \(user.graduationYear)")
                        .fontWeight(.semibold)
                        .matchedGeometryEffect(id: "batchyear", in: namespace)
                    Text("\(user.memberType.description)")
                        .fontWeight(.regular)
                }
                Spacer()
                Image(.logoWhite)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 48)
                    .matchedGeometryEffect(id: "sstaalogo", in: namespace)
            }
        }
        .foregroundStyle(.white)
        .padding(21)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(colors: user.memberType.gradientColors,
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .matchedGeometryEffect(id: "gradientbackground", in: namespace)
                .shadow(color: user.memberType.gradientColors.first!.opacity(0.5), radius: 10)
        }
        .aspectRatio(1.8, contentMode: .fit)
    }
}
