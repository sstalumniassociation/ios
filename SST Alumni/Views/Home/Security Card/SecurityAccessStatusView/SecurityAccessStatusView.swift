//
//  SecurityAccessStatusView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI

struct SecurityAccessStatusView: View {
    
    @ObservedObject var securityAccessManager: SecurityAccessManager
    
    var body: some View {
        ZStack {
            HexagonView()
                .drawingGroup()
                .opacity(0.5)
                .mask {
                    RoundedRectangle(cornerRadius: 8)
                }
                .overlay {
                    switch securityAccessManager.securityAccessState {
                    case .admitted:
                        SecurityAccessAdmittedView(securityAccessManager: securityAccessManager)
                    case .denied(let reason):
                        SecurityAccessDeniedView(reason: reason)
                    case .processing:
                        ProgressView()
                            .tint(.black)
                    }
                }
        }
        .background(.white)
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
}
