//
//  SignUpView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 19/9/23.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var isPasswordAtLeast8Characters: Bool {
        password.count >= 8
    }
    
    var doesPasswordContainUppercased: Bool {
        password.contains(where: { $0.isUppercase })
    }
    
    var doesPasswordContainLowercased: Bool {
        password.contains(where: { $0.isLowercase })
    }
    
    var doesPasswordContainNumber: Bool {
        password.contains(where: { $0.isNumber })
    }
    var doesPasswordContainSpecialCharacters: Bool {
        password.contains(where: { $0.isSymbol || $0.isPunctuation || $0.isWhitespace })
    }
    
    var isPasswordValid: Bool {
        isPasswordAtLeast8Characters && doesPasswordContainUppercased && doesPasswordContainLowercased && doesPasswordContainNumber && doesPasswordContainSpecialCharacters
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Full Name", text: $name)
                        .textContentType(.name)
                    TextField("Email", text: $email)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                } header: {
                    Text("Personal Details")
                } footer: {
                    Text("If possible, use the email address you used to register to the SST Alumni Association. Otherwise, use an email address you will be contactable at.")
                }
                
                Section {
                    HStack {
                        SecureField("Password", text: $password)
                            .textContentType(.newPassword)
                        Image(systemName: isPasswordValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .symbolRenderingMode(.multicolor)
                    }
                    HStack {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textContentType(.newPassword)
                        Image(systemName: password == confirmPassword && isPasswordValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .symbolRenderingMode(.multicolor)
                    }
                } header: {
                    Text("Password")
                } footer: {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: isPasswordAtLeast8Characters ? "checkmark.circle.fill" : "xmark.circle.fill")
                            Text("At least 8 characters")
                        }
                        HStack {
                            Image(systemName: doesPasswordContainUppercased ? "checkmark.circle.fill" : "xmark.circle.fill")
                            Text("Uppercased letters")
                        }
                        HStack {
                            Image(systemName: doesPasswordContainLowercased ? "checkmark.circle.fill" : "xmark.circle.fill")
                            Text("Lowercased letters")
                        }
                        HStack {
                            Image(systemName: doesPasswordContainNumber ? "checkmark.circle.fill" : "xmark.circle.fill")
                            Text("Numbers")
                        }
                        HStack {
                            Image(systemName: doesPasswordContainSpecialCharacters ? "checkmark.circle.fill" : "xmark.circle.fill")
                            Text("Special characters")
                        }
                    }
                    .symbolRenderingMode(.multicolor)
                }
                
                Section {
                    Button {
                        
                    } label: {
                        Text("Sign Up")
                    }
                }
            }
            .navigationTitle("Sign Up")
        }
    }
}
