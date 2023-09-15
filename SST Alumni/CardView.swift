//
//  CardView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct CardView: View {
    var user: User
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qin Guan")
                .font(.title)
                .fontWeight(.bold)
                .fontWidth(.expanded)
            Spacer()
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Class of \(user.graduationYear)")
                        .fontWeight(.semibold)
                    Text("\(user.memberType.description)")
                        .fontWeight(.regular)
                }
                Spacer()
                Image(.logoWhite)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 48)
            }
        }
        .foregroundStyle(.white)
        .padding(21)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [.red, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(color: .orange.opacity(0.5), radius: 10)
        }
        .aspectRatio(1.8, contentMode: .fit)
    }
}

#Preview {
    CardView(user: User(name: "Qin Guan", graduationYear: "2020", memberType: .associateMember))
        .padding()
}
