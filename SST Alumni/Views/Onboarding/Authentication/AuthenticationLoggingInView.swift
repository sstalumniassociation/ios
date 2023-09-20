//
//  AuthenticationLoggingInView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 21/9/23.
//

import SwiftUI

struct AuthenticationLoggingInView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .foregroundStyle(.blue)
                .frame(height: 96)
                .font(.system(size: 64))
                .padding(.top)
            
            Text("Logging In…")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            ProgressView()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AuthenticationLoggingInView()
}
