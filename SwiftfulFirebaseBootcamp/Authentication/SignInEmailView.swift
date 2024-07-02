//
//  SignInEmailView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Beijia Chen on 7/2/24.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
}

struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                Task {
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Sign In With Email")
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInEmailView(showSignInView: .constant(false))
        }
    }
}
