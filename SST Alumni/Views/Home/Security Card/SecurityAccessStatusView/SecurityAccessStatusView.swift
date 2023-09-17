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
        RoundedRectangle(cornerRadius: 8)
            .fill(.white)
            .aspectRatio(1, contentMode: .fit)
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
}
