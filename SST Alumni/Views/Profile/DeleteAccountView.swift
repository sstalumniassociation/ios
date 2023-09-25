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
            DeleteAccountWarning(deleteAccountState: $deleteAccountState)
        case .password:
            DeleteAccountPassword(deleteAccountState: $deleteAccountState)
        case .deleting:
            DeletingAccountView()
        }
    }
}

#Preview {
    DeleteAccountView()
}
