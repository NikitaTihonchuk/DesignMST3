import SwiftUI

struct PlayerCardView: View {
    let trackTitle: String
    let genre: String
    @Binding var isPlaying: Bool
    @Binding var currentTime: Double
    let totalTime: Double
    @Binding var playbackSpeed: Double
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(hex: "A200FF"),
                                    Color(hex: "00F6FF")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 64, height: 64)
                    
                    Image(systemName: "music.note")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 32))
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(trackTitle)
                        .foregroundStyle(Color.white)
                        .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 18))
                    
                    Text("AI-Generated Track")
                        .foregroundStyle(Color.white.opacity(0.6))
                        .font(.custom(FontEnum.poppinsRegular.rawValue, size: 12))
                }
                
                Spacer()
                
                // Genre Tag
                Text(genre)
                    .foregroundStyle(Color.white)
                    .font(.custom(FontEnum.poppinsMedium.rawValue, size: 12))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.1))
                    )
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            // Waveform Visualization
            WaveformView(currentTime: currentTime, totalTime: totalTime)
                .frame(height: 48.0)
                .padding(.horizontal, 16)
            
            
            VStack(spacing: 0) {
                // Time Labels
                HStack {
                    Text(formatTime(currentTime))
                        .foregroundStyle(Color.white.opacity(0.7))
                        .font(.custom(FontEnum.poppinsRegular.rawValue, size: 12))
                    
                    Spacer()
                    
                    Text(formatTime(totalTime))
                        .foregroundStyle(Color.white.opacity(0.7))
                        .font(.custom(FontEnum.poppinsRegular.rawValue, size: 12))
                }
                .padding(.horizontal, 16)
                
                // Playback Controls
                HStack(spacing: 16) {
                    // Speed Control
                    Button(action: {
                        cyclePlaybackSpeed()
                    }) {
                        Text("\(Int(playbackSpeed))x")
                            .foregroundStyle(Color.white)
                            .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 16))
                            .frame(width: 44, height: 44)
                    }
                    
                    Spacer()
                    
                    // Rewind 15s
                    Button(action: {
                        currentTime = max(0, currentTime - 15)
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.1))
                                .frame(width: 44, height: 44)
                            
                            Image(systemName: "gobackward.15")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 18))
                        }
                    }
                    
                    // Play/Pause
                    Button(action: {
                        isPlaying.toggle()
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 60, height: 60)
                            
                            Image("playIcon")
                                .foregroundStyle(Color(hex: "1A0B2E"))
                                .font(.system(size: 24))
                                .offset(x: isPlaying ? 0 : 2)
                        }
                    }
                    
                    // Forward 15s
                    Button(action: {
                        currentTime = min(totalTime, currentTime + 15)
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.1))
                                .frame(width: 44, height: 44)
                            
                            Image(systemName: "goforward.15")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 18))
                        }
                    }
                    
                    Spacer()
                    
                    // Equalizer
                    Button(action: {
                        // Equalizer action
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18))
                            .frame(width: 44, height: 44)
                    }
                }
                .padding(.horizontal, 16)
            }
            
            // Save and Download Buttons
            HStack(spacing: 10) {
                Button(action: {
                    // Save action
                }) {
                    HStack(spacing: 6) {
                        Text("Save")
                            .foregroundStyle(Color.white)
                            .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 14))
                        
                        Image(systemName: "bookmark")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 14))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                    )
                }
                
                Button(action: {

                }) {
                    HStack(spacing: 6) {
                        Text("Download")
                            .foregroundStyle(Color.white)
                            .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 14))
                        
                        Image(systemName: "arrow.down.circle")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 14))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                    )
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .background(
            RoundedRectangle(cornerRadius: 32)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(hex: "A200FF"),
                            Color(hex: "00F6FF")
                        ],
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing)
                    .opacity(0.16)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(
                            AngularGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "00F6FF").opacity(0.05),
                                    Color(hex: "A200FF").opacity(0.05),
                                    Color(hex: "A200FF").opacity(0.8),
                                    Color(hex: "A200FF").opacity(0.05),
                                    Color(hex: "00F6FF").opacity(0.05),
                                    Color(hex: "00F6FF").opacity(0.05),
                                    Color(hex: "00F6FF").opacity(0.8),
                                    Color(hex: "00F6FF").opacity(0.05)
                                ]),
                                center: .center,
                                angle: .degrees(45)
                            )
                        )
                )
        )
        .padding(.horizontal)
    }
    
    private func formatTime(_ seconds: Double) -> String {
        let minutes = Int(seconds) / 60
        let remainingSeconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
    
    private func cyclePlaybackSpeed() {
        if playbackSpeed == 1.0 {
            playbackSpeed = 1.5
        } else if playbackSpeed == 1.5 {
            playbackSpeed = 2.0
        } else {
            playbackSpeed = 1.0
        }
    }
}

#Preview {
    PlayerCardView(
        trackTitle: "Soft piano",
        genre: "Electronic",
        isPlaying: .constant(false),
        currentTime: .constant(35.0),
        totalTime: 60.0,
        playbackSpeed: .constant(1.0)
    )
}
