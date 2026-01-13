import SwiftUI

struct SafetyAdvisorView: View {
    @Environment(\.dismiss) var dismiss
    @State private var messageText: String = ""
    @State private var messages: [ChatMessage] = []
    @State private var isTyping: Bool = false
    @State private var ticketsCount: Int = 33
    
    var body: some View {
        ZStack {
            // Background
            Color(hex: "F5F5F7")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 16) {
                    HStack {
                        Text("Safety Advisor")
                            .foregroundStyle(Color(hex: "000000"))
                            .font(.custom(FontEnum.outfitRegular.rawValue, size: 24.0))
                        
                        Spacer()
                        
                        Button(action: {
                            // History action
                            dismiss()
                            
                        }) {
                            Image(systemName: "clock")
                                .foregroundStyle(Color(hex: "007AFF"))
                                .font(.system(size: 24))
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    HStack(spacing: 12) {
                        // Tickets Badge
                        HStack(spacing: 8) {
                            Text("Tickets:")
                                .foregroundStyle(Color.white)
                                .font(.custom(FontEnum.outfitBold.rawValue, size: 16))
                            
                            Text("\(ticketsCount)")
                                .foregroundStyle(Color.white)
                                .font(.custom(FontEnum.outfitRegular.rawValue, size: 16))
                            
                            Image(systemName: "ticket.fill")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 16))
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 9)
                        .background(
                            Capsule()
                                .fill(Color(hex: "007AFF"))
                        )
                        
                        // Cost Info
                        HStack(spacing: 8) {
                            Text("Each request cost")
                                .foregroundStyle(Color(hex: "8E8E93"))
                                .font(.custom(FontEnum.outfitRegular.rawValue, size: 14))
                            
                            Image(systemName: "ticket.fill")
                                .foregroundStyle(Color(hex: "8E8E93"))
                                .font(.system(size: 14))
                            
                            Text("1 Ticket")
                                .foregroundStyle(Color(hex: "8E8E93"))
                                .font(.custom(FontEnum.outfitRegular.rawValue, size: 14))
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.top, 8)
                .padding(.bottom, 16)
                
                // Chat Messages
                ScrollView {
                    VStack(spacing: 16) {
                        if messages.isEmpty {
                            Spacer()
                        } else {
                            ForEach(messages) { message in
                                MessageBubble(message: message)
                            }
                        }
                        
                        // Typing Indicator
                        if isTyping {
                            HStack {
                                TypingIndicator()
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding(.vertical, 20)
                }
                
                Spacer()
                
                // Input Area
                VStack(spacing: 0) {
                    HStack(spacing: 12) {
                        // Text Field
                        TextField("", text: $messageText, prompt: Text("Ask Safety advisor some questions!")
                            .foregroundColor(Color(hex: "8E8E93"))
                            .font(.custom(FontEnum.outfitRegular.rawValue, size: 18)))
                            .foregroundStyle(Color(hex: "000000"))
                            .font(.custom(FontEnum.outfitRegular.rawValue, size: 18))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 16)
                            .background(
                                Capsule()
                                    .fill(Color.white)
                            )
                        
                        // Send Button
                        Button(action: sendMessage) {
                            Image(systemName: "paperplane.fill")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 22))
                                .frame(width: 56, height: 56)
                                .background(
                                    Circle()
                                        .fill(Color(hex: "007AFF"))
                                )
                        }
                        .disabled(messageText.isEmpty)
                        .opacity(messageText.isEmpty ? 0.5 : 1.0)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(Color(hex: "F5F5F7"))
                    
                    // Bottom Tab Bar
                    HStack(spacing: 0) {
                        TabBarButton(icon: "house", title: "Home", isSelected: false)
                        TabBarButton(icon: "photo", title: "Gallery Cleaner", isSelected: false)
                        TabBarButton(icon: "shield.checkered", title: "Safety Advisor", isSelected: true)
                        TabBarButton(icon: "gearshape", title: "Settings", isSelected: false)
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 8)
                    .background(Color.white)
                }
            }
        }
        .onAppear {
            // Add initial user message
            messages.append(ChatMessage(
                text: "What are the best practices for securing my personal data?",
                isUser: true
            ))
            
            // Simulate AI response
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isTyping = true
            }
        }
    }
    
    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        
        // Add user message
        messages.append(ChatMessage(text: messageText, isUser: true))
        messageText = ""
        
        // Simulate AI typing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            isTyping = true
            
            // Simulate AI response
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isTyping = false
                messages.append(ChatMessage(
                    text: "Here are some best practices for securing your personal data:\n\n1. Use strong, unique passwords\n2. Enable two-factor authentication\n3. Keep software updated\n4. Be cautious with public Wi-Fi\n5. Regularly backup your data",
                    isUser: false
                ))
                ticketsCount -= 1
            }
        }
    }
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct MessageBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
            }
            
            Text(message.text)
                .foregroundStyle(message.isUser ? Color(hex: "000000") : Color(hex: "000000"))
                .font(.custom(FontEnum.outfitRegular.rawValue, size: 17))
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(message.isUser ? Color.white : Color.white)
                )
                .frame(maxWidth: .infinity * 0.75, alignment: message.isUser ? .trailing : .leading)
            
            if !message.isUser {
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
}

struct TypingIndicator: View {
    @State private var animationPhase = 0
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(Color(hex: "007AFF"))
                    .frame(width: 10, height: 10)
                    .scaleEffect(animationPhase == index ? 1.2 : 0.8)
                    .animation(
                        Animation.easeInOut(duration: 0.6)
                            .repeatForever()
                            .delay(Double(index) * 0.2),
                        value: animationPhase
                    )
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            Capsule()
                .fill(Color.white)
        )
        .onAppear {
            withAnimation {
                animationPhase = 0
            }
            
            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { _ in
                animationPhase = (animationPhase + 1) % 3
            }
        }
    }
}

struct TabBarButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Button(action: {
            // Tab action
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundStyle(isSelected ? Color(hex: "007AFF") : Color(hex: "8E8E93"))
                
                Text(title)
                    .font(.custom(FontEnum.outfitRegular.rawValue, size: 11))
                    .foregroundStyle(isSelected ? Color(hex: "007AFF") : Color(hex: "8E8E93"))
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    SafetyAdvisorView()
}
