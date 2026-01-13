import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink {
                    PaywallView().navigationBarBackButtonHidden()
                } label: {
                    Text("Paywall View")
                        .foregroundStyle(Color.blue)
                }
                .padding()
                .frame(width: 200)
                .background(
                    RoundedRectangle(cornerRadius: 16.0)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color.blue)
                )
                
                NavigationLink {
                    CreateMusicView().navigationBarBackButtonHidden()
                } label: {
                    Text("Text to Music View")
                        .foregroundStyle(Color.blue)
                }
                .padding()
                .frame(width: 200)
                .background(
                    RoundedRectangle(cornerRadius: 16.0)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color.blue)
                )
                
                NavigationLink {
                    IdeaComposerView().navigationBarBackButtonHidden()
                } label: {
                    Text("Idea Composer View")
                        .foregroundStyle(Color.blue)
                }
                .padding()
                .frame(width: 200)
                .background(
                    RoundedRectangle(cornerRadius: 16.0)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color.blue)
                )
                
                NavigationLink {
                    SafetyAdvisorView().navigationBarBackButtonHidden()
                } label: {
                    Text("Chat View")
                        .foregroundStyle(Color.blue)
                }
                .padding()
                .frame(width: 200)
                .background(
                    RoundedRectangle(cornerRadius: 16.0)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color.blue)
                )
            }
            .padding()
            .navigationTitle("Demo Views")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}


