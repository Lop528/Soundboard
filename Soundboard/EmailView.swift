import SwiftUI

struct EmailView: View {
    
    @State private var email = "odienhart6113@stu.d214.org, lseymour7370@stu.d214.org"
    @State private var isCopied = false
    @State private var songTitle: String = ""
    @State private var recipientEmail: String = "lseymour7370@stu.d214.org"
    @State private var showMailComposer: Bool = false
    @State private var showError: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Suggest a Song")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text("""
                If you would like to suggest a song, please send the following details to:
                """)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            
            Text("Email: \(email)")
                .font(.body)
                .padding()
            
            Button(action: {
                copyToClipboard()
            }) {
                Label("Copy Emails", systemImage: isCopied ? "checkmark.circle.fill" : "doc.on.doc")
                    .foregroundColor(isCopied ? .green : .blue)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .shadow(radius: 3)
            .onChange(of: isCopied) { _ in
                // Reset the "copied" state after 2 seconds
                if isCopied {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isCopied = false
                    }
                }
            }
        }
        .padding()
    }
    
    private func copyToClipboard() {
        UIPasteboard.general.string = email
        isCopied = true
    }
}

#Preview {
    EmailView()
}

