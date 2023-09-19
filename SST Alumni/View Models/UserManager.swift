//
//  UserManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation
import FirebaseAuth

class UserManager: ObservableObject {
    @Published var user: UserData?
    var firebaseUser: User?
    
    @Published var signUpState = SignUpState.creatingAccount
    
    let auth: Auth
    
    init() {
        self.auth = Auth.auth()
        
        auth.addStateDidChangeListener { auth, user in
            if user == nil {
                
            }
        }
    }
    
    func beginSignUp(email: String, password: String) async {
        await MainActor.run {
            signUpState = .processing
        }
        
        do {
            if let discoveredUser = try await checkIfDatabaseContainsEmail(email) {
                try await createUserAndVerifyEmail(email: email, password: password)
            } else {
                switch extractInformation(fromSSTEmail: email) {
                case .staff(let staffName):
                    try await createUserAndVerifyEmail(email: email, password: password)
                    break
                case .student(let studentName):
                    try await createUserAndVerifyEmail(email: email, password: password)
                    break
                case .invalid:
                    await MainActor.run {
                        signUpState = .additionalVerificationRequired
                    }
                    break
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func createUserAndVerifyEmail(email: String, password: String) async throws {
        try await auth.createUser(withEmail: email, password: password)
        
    }
    
    func checkIfDatabaseContainsEmail(_ email: String) async throws -> UserData? {
        // Send a POST request
        var request = URLRequest(url: .cfServer.appendingPathComponent("verifyuser"))
        request.httpMethod = "POST"
        request.httpBody = email.data(using: .utf8)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else { return nil }
        
        if 400...499 ~= response.statusCode {
            return nil
        } else {
            let decoder = JSONDecoder()
            return try? decoder.decode(UserData.self, from: data)
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func signIn() {
        user = .sample
    }
}
