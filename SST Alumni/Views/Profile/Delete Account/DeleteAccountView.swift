//
//  DeleteAccountView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 22/9/23.
//

import SwiftUI

struct DeleteAccountView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    @State private var deleteAccountState = DeleteAccountState.warning
    
    var body: some View {
        switch deleteAccountState {
        case .warning:
            DeleteAccountWarningView(deleteAccountState: $deleteAccountState)
        case .password:
            DeleteAccountPasswordView(deleteAccountState: $deleteAccountState)
        case .deleting:
            DeletingAccountView()
        case .error:
            EmptyView()
        }
    }
}

#Preview {
    DeleteAccountView()
}
