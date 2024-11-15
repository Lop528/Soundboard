import SwiftUI
import MessageUI

struct EmailView: View {
    @State private var songTitle: String = ""
    @State private var recipientEmail: String = ""
    @State private var showEmailView: Bool = false
    @State private var showError: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
               
                Text("Suggest a Song")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top, 20)

                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Song Title", text: $songTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Recipient's Email", text: $recipientEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                }

                // Submit Button
                Button(action: {
                    if MFMailComposeViewController.canSendMail() {
                        showEmailView = true
                    } else {
                        showError = true
                    }
                }) {
                    Text("Send Suggestion")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Song Suggestion")
            .sheet(isPresented: $showEmailView) {
                EmailView()
                    subject: "Song Suggestion",
                    body: "Hi,\n\nI would like to suggest the song: \(songTitle).\n\nEnjoy!",
                    recipient: recipientEmail
                )
            }
            .alert(isPresented: $showError) {
                Alert(
                    title: Text("Error"),
                    message: Text("Mail services are not available on this device."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

