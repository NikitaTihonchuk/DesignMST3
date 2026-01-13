import SwiftUI

struct CreateMusicView: View {
    @Environment(\.dismiss) var dismiss
    @State private var musicDescription: String = ""
    @State private var selectedMood: String = "Happy"
    @State private var selectedGenre: String = "Electronic"
    @State private var selectedDuration: String = "1 min"
    
    let moods = ["Happy", "Sad", "Dark", "Epic", "Calm", "Energetic"]
    let genres = ["Hip-Hop", "Electronic", "Pop", "Ambient", "Rock", "Jazz"]
    let durations = ["15 s", "30 s", "1 min", "2 min"]
    
    var body: some View {
        ZStack {
            // Background
            Image("paywallBackground")
                .resizable()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    HStack {
                        Text("Create Music")
                            .foregroundStyle(Color(hex: "000000"))
                            .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 24.0))
                        
                        Spacer()
                        
                        Button(action: {
                            // Get Pro action
                            dismiss()
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: 18))
                                
                                Text("Get a Pro")
                                    .foregroundStyle(Color.white)
                                    .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 16))
                            }
                            .padding(.horizontal, 16.0)
                            .padding(.vertical, 10.0)
                            .background(
                                Capsule()
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
                    .padding(.top, 8)
                    
                    // Description Text Field
                    VStack(alignment: .leading, spacing: 0) {
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.white.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                )
                                .frame(height: 320)
                            
                            if musicDescription.isEmpty {
                                Text("Describe the music you want to create\n(style, instruments, mood, story...)")
                                    .foregroundStyle(Color.white.opacity(0.5))
                                    .font(.custom(FontEnum.poppinsRegular.rawValue, size: 16))
                                    .padding(.horizontal, 20)
                                    .padding(.top, 20)
                            }
                            
                            TextEditor(text: $musicDescription)
                                .foregroundStyle(Color.white)
                                .font(.custom(FontEnum.poppinsRegular.rawValue, size: 16))
                                .scrollContentBackground(.hidden)
                                .background(Color.clear)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 16)
                                .frame(height: 320)
                        }
                        
                        // Random Button
                        Button(action: {
                            generateRandomDescription()
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "arrow.clockwise")
                                    .foregroundStyle(Color(hex: "000000"))
                                    .font(.system(size: 18))
                                
                                Text("Random")
                                    .foregroundStyle(Color(hex: "000000"))
                                    .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 16))
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(
                                Capsule()
                                    .fill(Color.white)
                            )
                        }
                        .padding(.leading, 20)
                        .offset(x: -10, y: -60)
                    }
                    .padding(.horizontal, 20)
                    
                    // Mood Section
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Mood")
                                .foregroundStyle(Color.white)
                                .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 20))
                            
                            VStack(alignment: .leading, spacing: 16) {
                                
                                Text("Type or select the mood.")
                                    .foregroundStyle(Color.white.opacity(0.6))
                                    .font(.custom(FontEnum.poppinsRegular.rawValue, size: 16))
                                    .padding(.bottom, 10)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        ForEach(moods, id: \.self) { mood in
                                            MoodChip(
                                                title: mood,
                                                isSelected: selectedMood == mood,
                                                action: { selectedMood = mood }
                                            )
                                        }
                                    }
                                }
                                
                                Button(action: {
                                    // More Styles action
                                }) {
                                    HStack {
                                        Spacer()
                                        
                                        Image(systemName: "plus")
                                            .foregroundStyle(Color.white)
                                            .font(.system(size: 16))
                                        
                                        Text("More Styles")
                                            .foregroundStyle(Color.white)
                                            .font(.custom(FontEnum.poppinsMedium.rawValue, size: 16))
                                        
                                        Spacer()
                                    }
                                    .padding(.vertical, 16)
                                    .background(
                                        RoundedRectangle(cornerRadius: 24)
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Color(hex: "A200FF"),
                                        Color(hex: "00F6FF")
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing)
                                .cornerRadius(16.0)
                                .opacity(0.08)
                            )
                            
                        }
                        .padding(.horizontal)
                        
                        // Genre Section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Genre")
                                .foregroundStyle(Color.white)
                                .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 20))
                            
                            VStack(alignment: .leading, spacing: 16) {
                                
                                Text("Type or select the genre.")
                                    .foregroundStyle(Color.white.opacity(0.6))
                                    .font(.custom(FontEnum.poppinsRegular.rawValue, size: 16))
                                    .padding(.bottom, 10)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        ForEach(genres, id: \.self) { genre in
                                            MoodChip(
                                                title: genre,
                                                isSelected: selectedGenre == genre,
                                                action: { selectedGenre = genre }
                                            )
                                        }
                                    }
                                }
                                
                                Button(action: {
                                }) {
                                    HStack {
                                        Spacer()
                                        
                                        Image(systemName: "plus")
                                            .foregroundStyle(Color.white)
                                            .font(.system(size: 16))
                                        
                                        Text("More Styles")
                                            .foregroundStyle(Color.white)
                                            .font(.custom(FontEnum.poppinsMedium.rawValue, size: 16))
                                        
                                        Spacer()
                                    }
                                    .padding(.vertical, 16)
                                    .background(
                                        RoundedRectangle(cornerRadius: 24)
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Color(hex: "A200FF"),
                                        Color(hex: "00F6FF")
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing)
                                .cornerRadius(16.0)
                                .opacity(0.08)
                            )
                            
                        }
                        .padding(.horizontal)
                        
                        // Duration Section
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Duration")
                                .foregroundStyle(Color.white)
                                .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 20))
                            
                            HStack(spacing: 12) {
                                ForEach(durations, id: \.self) { duration in
                                    DurationChip(
                                        title: duration,
                                        isSelected: selectedDuration == duration,
                                        action: { selectedDuration = duration }
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // Generate Button
                        Button(action: {
                            generateMusic()
                        }) {
                            Text("Generate Music")
                                .foregroundStyle(Color.white)
                                .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 18))
                                .frame(maxWidth: .infinity)
                                .frame(height: 64)
                                .background(
                                    RoundedRectangle(cornerRadius: 32)
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
                        .padding(.horizontal, 20)
                        .padding(.bottom, 32)
                    }
                    .offset(y: -40)
                }
            }
        }
    }
    
    private func generateRandomDescription() {
        let randomDescriptions = [
            "Upbeat electronic dance music with synthesizers",
            "Calm piano melody with soft rain sounds",
            "Epic orchestral soundtrack with dramatic strings",
            "Chill lo-fi beats with jazzy elements",
            "Energetic rock music with electric guitars"
        ]
        musicDescription = randomDescriptions.randomElement() ?? ""
    }
    
    private func generateMusic() {
        // Generate music action
        print("Generating music with:")
        print("Description: \(musicDescription)")
        print("Mood: \(selectedMood)")
        print("Genre: \(selectedGenre)")
        print("Duration: \(selectedDuration)")
        dismiss()
    }
}

struct MoodChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(isSelected ? Color(hex: "000000") : Color.white)
                .font(.custom(FontEnum.poppinsMedium.rawValue, size: 16))
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.white : Color.white.opacity(0.1))
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(isSelected ? 0 : 0.3), lineWidth: 1)
                        )
                )
        }
    }
}

struct DurationChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(isSelected ? Color(hex: "000000") : Color.white)
                .font(.custom(FontEnum.poppinsMedium.rawValue, size: 16))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.white : Color.white.opacity(0.1))
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(isSelected ? 0 : 0.3), lineWidth: 1)
                        )
                )
        }
    }
}

#Preview {
    CreateMusicView()
}
