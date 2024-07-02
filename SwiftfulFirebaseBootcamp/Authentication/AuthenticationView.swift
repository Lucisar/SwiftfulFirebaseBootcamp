//
//  AuthenticationView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Beijia Chen on 7/2/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack {
            
            NavigationLink{
                SignInEmailView()
            } label: {
                Text("Sign In With Email")
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
        .navigationTitle("Sign In")
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView()
        }
    }
}

/*
 #Preview {
 AuthenticationView()
 }
 */
