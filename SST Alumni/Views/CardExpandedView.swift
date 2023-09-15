//
//  CardExpandedView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct CardExpandedView: View {
    
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
                    Text("Class of \(user.graduationYear)")
                        .fontWeight(.semibold)
                        .matchedGeometryEffect(id: "batchyear", in: namespace)
                }
                Spacer()
                Image(.logoWhite)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 48)
                    .matchedGeometryEffect(id: "sstaalogo", in: namespace)
            }
            
            VStack {
                Text("15 Sep 2023")
                    .font(.system(size: 40, weight: .heavy))
                
                Text("9:41 AM")
                    .font(.system(size: 40, weight: .semibold))
                
                Text("Alumnus")
                    .font(.system(size: 32, weight: .regular))
            }
            .foregroundStyle(.black)
            .padding()
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .foregroundStyle(.white)
        .padding(21)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16).fill(LinearGradient(colors: [.red, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                .matchedGeometryEffect(id: "gradientbackground", in: namespace)
        }
        .padding()
    }
}
