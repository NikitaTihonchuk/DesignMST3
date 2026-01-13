import SwiftUI

struct IdeaComposerView: View {
    @Environment(\.dismiss) var dismiss

    @State private var isPlaying = false
    @State private var currentTime: Double = 35
    @State private var totalTime: Double = 60
    @State private var playbackSpeed: Double = 1.0
    
    var body: some View {
        ZStack {
            Image("paywallBackground")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Text("Idea Composer")
                        .foregroundStyle(Color(hex: "000000"))
                        .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 28))
                    
                    Spacer()
                    
                    Button(action: {
                        // Info action
                        dismiss()
                    }) {
                        Image("infoButton")
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 8)
                
                ScrollView {
                    // Main Title
                    VStack(spacing: -15) {
                        Text("Your")
                            .foregroundStyle(Color(hex: "FFFFFF"))
                            .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 48.0))
                        
                        Text("Generated")
                            .foregroundStyle(Color(hex: "FFFFFF"))
                            .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 48.0))
                        
                        HStack {
                            Text("Track")
                                .foregroundStyle(Color(hex: "FFFFFF"))
                             
                                .shadow(color: Color(hex: "A200FF"), radius: 10)
                            
                            
                            Text("is")
                                .foregroundStyle(Color(hex: "FFFFFF"))
                                .shadow(color: Color(hex: "FFFFFF"), radius: 10)
                            
                            Text("Ready")
                                .foregroundStyle(Color(hex: "FFFFFF"))
                                .shadow(color: Color(hex: "00F6FF"), radius: 10)
                        }
                        .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 48.0))
                        
                    }
                    .padding(.bottom, 16)
                    
                    Text("Enjoy your AI-generated music.")
                        .foregroundStyle(Color.white.opacity(0.7))
                        .font(.custom(FontEnum.poppinsRegular.rawValue, size: 18))
                    
                    // Player Card
                    PlayerCardView(
                        trackTitle: "Soft piano & rain",
                        genre: "Electronic",
                        isPlaying: $isPlaying,
                        currentTime: $currentTime,
                        totalTime: totalTime,
                        playbackSpeed: $playbackSpeed
                    )
                    
                    
                    // Bottom Buttons
                    HStack(spacing: 12) {
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Regenerate")
                                .foregroundStyle(Color(hex: "FFFFFF"))
                                .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 18))
                                .frame(maxWidth: .infinity)
                                .frame(height: 56.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(lineWidth: 1.0)
                                        .foregroundStyle(Color(hex: "FFFFFF"))
                                        .opacity(0.16)
                                )
                        }
                        
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Add to Library")
                                .foregroundStyle(Color.white)
                                .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 18))
                                .frame(maxWidth: .infinity)
                                .frame(height: 56.0)
                                .background(
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(
                                            LinearGradient(
                                                colors: [
                                                    Color(hex: "A200FF"),
                                                    Color(hex: "00F6FF")
                                                ],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 24)
                }
            }
        }
    }
}

#Preview {
    IdeaComposerView()
}
