//
//  AuthenticationRegisterPasswordView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import SwiftUI

struct AuthenticationRegisterPasswordView: View {
    
    @FocusState private var isPasswordFieldFocused
    @FocusState private var isConfirmPasswordFieldFocused
    
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
        ScrollView {
            VStack {
                Image(systemName: "ellipsis.rectangle")
                    .foregroundStyle(.blue)
                    .frame(height: 96)
                    .font(.system(size: 64))
                    .padding(.top)
                Text("Create a Password")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                VStack {
                    HStack {
                        SecureField("Password", text: $password)
                            .focused($isPasswordFieldFocused)
                            .textContentType(.newPassword)
                            .submitLabel(.next)
                            .onSubmit {
                                isConfirmPasswordFieldFocused = true
                            }
                        Image(systemName: isPasswordValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .symbolRenderingMode(.multicolor)
                    }
                    .padding(16)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal)
                    
                    HStack {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .focused($isConfirmPasswordFieldFocused)
                            .textContentType(.newPassword)
                        Image(systemName: password == confirmPassword && isPasswordValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .symbolRenderingMode(.multicolor)
                    }
                    .padding(16)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            if isPasswordValid {
                                HStack {
                                    Image(systemName: "hand.thumbsup.fill")
                                        .foregroundStyle(.blue)
                                    Text("Looks good to me!")
                                }
                                .padding(8)
                                .background(.regularMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                            if !isPasswordAtLeast8Characters {
                                HStack {
                                    Image(systemName: "xmark.circle.fill")
                                    Text("≥ 8 Characters")
                                }
                                .padding(8)
                                .background(.regularMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                            if !doesPasswordContainUppercased {
                                HStack {
                                    Image(systemName: "xmark.circle.fill")
                                    Text("Uppercased")
                                }
                                .padding(8)
                                .background(.regularMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                            if !doesPasswordContainLowercased {
                                HStack {
                                    Image(systemName: "xmark.circle.fill")
                                    Text("Lowercased")
                                }
                                .padding(8)
                                .background(.regularMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                            if !doesPasswordContainNumber {
                                HStack {
                                    Image(systemName: "xmark.circle.fill")
                                    Text("Numbers")
                                }
                                .padding(8)
                                .background(.regularMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                            if !doesPasswordContainSpecialCharacters {
                                HStack {
                                    Image(systemName: "xmark.circle.fill")
                                    Text("Special Characters")
                                }
                                .padding(8)
                                .background(.regularMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                        .padding(.horizontal)
                        .animation(.easeInOut, value: password)
                    }
                    .symbolRenderingMode(.multicolor)
                    
                    
                    Button {
                        
                    } label: {
                        Text("Next")
                            .padding(8)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .onAppear {
            isPasswordFieldFocused = true
        }
    }
}

#Preview {
    AuthenticationRegisterPasswordView()
}
