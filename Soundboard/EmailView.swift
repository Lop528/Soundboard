//
//  EmailView.swift
//  Soundboard
//
//  Created by Liam K. Seymour on 11/7/24.
//

import SwiftUI
import MessageUI

struct EmailView: View {
    @State private var songTitle: String = ""
    @State private var recipientEmail: String = ""
    @State private var showMailComposer: Bool = false
    @State private var showError: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter song title", text: $songTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter recipient's email", text: $recipientEmail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
            
            Button(action: {
                if MFMailComposeViewController.canSendMail() {
                    showMailComposer = true
                } else {
                    showError = true
                }
            }) {
                Text("Suggest Song")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                
                
            }
        }
    }
}
