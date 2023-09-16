//
//  SecurityAccessDeniedView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI

struct SecurityAccessDeniedView: View {
    
    var reason: SecurityAccessState.DeniedReason
    
    var body: some View {
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
    }
}
