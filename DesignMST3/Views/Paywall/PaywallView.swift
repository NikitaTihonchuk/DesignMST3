import SwiftUI

enum SubscriptionPlan {
    case weekly
    case monthly
    case yearly
}

struct PaywallView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedPlan: SubscriptionPlan = .weekly

    var body: some View {
        ZStack(alignment: .top) {
            Image("paywallBackground")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack(alignment: .top) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(.thinMaterial)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                )
                            
                            Image("closeIcon")
                        }
                    })
                    .frame(width: 40.0, height: 40.0)
                    .opacity(0.0)
                    
                    VStack(spacing: -5) {
                        Text("Unlock Full")
                            .foregroundStyle(Color(hex: "FFFFFF"))
                            .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 32.0))
                        
                        Text("AI Music Power")
                            .foregroundStyle(Color(hex: "FFFFFF"))
                            .font(.custom(FontEnum.poppinsSemiBold.rawValue, size: 32.0))
                            .shadow(color: .white, radius: 8)
                    }
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(.thinMaterial)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                )
                            
                            Image("closeIcon")
                        }
                    })
                    .frame(width: 40.0, height: 40.0)
                }
                
                Text("Unlimited generations, full-quality tracks,\nediting tools and more.")
                    .foregroundStyle(Color(hex: "FFFFFF"))
                    .opacity(0.64)
                    .font(.custom(FontEnum.poppinsRegular.rawValue, size: 16))
                    .multilineTextAlignment(.center)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        Image("mostPopularPaywallLabel")
                        Button(action: {
                            selectedPlan = .weekly
                        }, label: {
                            ZStack {
                                HStack {
                                    Text("Weekly Plan")
                                        .foregroundStyle(Color(hex: "FFFFFF"))
                                        .font(.custom(FontEnum.poppinsMedium.rawValue, size: 20.0))
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("3 Days Free Trial")
                                            .foregroundStyle(Color(hex: "FFFFFF"))
                                            .font(.custom(FontEnum.poppinsMedium.rawValue, size: 13.0))
                                            .opacity(0.5)
                                        
                                        Text("Then $4.99 / week")
                                            .foregroundStyle(Color(hex: "00F6FF"))
                                            .font(.custom(FontEnum.poppinsMedium.rawValue, size: 16.0))
                                    }
                                    
                                    Spacer()
                                    
                                    
                                    Image(selectedPlan == .weekly ? "checkmarkOn" : "checkmarkOff")
                                    
                                }
                                .padding(.horizontal, 16.0)
                            }
                            .padding(.vertical, 16.0)
                            .background(
                                Rectangle()
                                    .foregroundStyle(
                                        LinearGradient(
                                            colors: [
                                                Color(hex: "A200FF"),
                                                Color(hex: "00F6FF")
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing)
                                    )
                                    .opacity(0.1)
                            )
                        })
                        .roundedCorners(16, corners: [.bottomLeft, .bottomRight, .topRight])
                    }
                    .padding(.horizontal, 16.0)

                    
                    Button(action: {
                        selectedPlan = .monthly
                    }, label: {
                        ZStack {
                            HStack {
                                Text("Monthly Plan")
                                    .foregroundStyle(Color(hex: "FFFFFF"))
                                    .font(.custom(FontEnum.poppinsMedium.rawValue, size: 20.0))
                                
                                Spacer()
                                
                                VStack {
                                    Text("Cancel anytime")
                                        .foregroundStyle(Color(hex: "FFFFFF"))
                                        .font(.custom(FontEnum.poppinsMedium.rawValue, size: 13.0))
                                        .opacity(0.5)
                                    
                                    Text("$12.99 / month")
                                        .foregroundStyle(Color(hex: "00F6FF"))
                                        .font(.custom(FontEnum.poppinsMedium.rawValue, size: 16.0))
                                }
                                
                                Spacer()
                                
                                
                                Image(selectedPlan == .monthly ? "checkmarkOn" : "checkmarkOff")
                                
                                
                            }
                            .padding(.horizontal, 16.0)
                        }
                        .padding(.vertical, 16.0)
                        .background(
                            Rectangle()
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [
                                            Color(hex: "A200FF"),
                                            Color(hex: "00F6FF")
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing)
                                )
                                .opacity(0.1)
                        )
                        .roundedCorners(16, corners: .allCorners)
                        .padding(.horizontal, 16.0)
                    })
                    
                    Button(action: {
                        selectedPlan = .yearly
                    }, label: {
                        ZStack {
                            HStack {
                                Text("Yearly Plan")
                                    .foregroundStyle(Color(hex: "FFFFFF"))
                                    .font(.custom(FontEnum.poppinsMedium.rawValue, size: 20.0))
                                
                                Spacer()
                                
                                VStack {
                                    Text("Save up to 75%")
                                        .foregroundStyle(Color(hex: "FFFFFF"))
                                        .font(.custom(FontEnum.poppinsMedium.rawValue, size: 13.0))
                                        .opacity(0.5)
                                    
                                    Text("$49.99 / year")
                                        .foregroundStyle(Color(hex: "00F6FF"))
                                        .font(.custom(FontEnum.poppinsMedium.rawValue, size: 16.0))
                                }
                                
                                Spacer()
                                
                                Image(selectedPlan == .yearly ? "checkmarkOn" : "checkmarkOff")
                                
                            }
                            .padding(.horizontal, 16.0)
                        }
                        .padding(.vertical, 16.0)
                        .background(
                            RoundedRectangle(cornerRadius: 16.0)
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [
                                            Color(hex: "A200FF"),
                                            Color(hex: "00F6FF")
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing)
                                )
                                .opacity(0.1)
                                .background(
                                    RoundedRectangle(cornerRadius: 16.0)
                                        .stroke(lineWidth: 2.0)
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
                        .padding(.horizontal, 16.0)
                    })
                    
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("What’s included")
                            .foregroundStyle(Color(hex: "FFFFFF"))
                            .font(.custom(FontEnum.poppinsRegular.rawValue, size: 16.0))
                            .opacity(0.5)
                            .padding(.horizontal, 16)
                        IncludedView(text: "Unlimited Text-to-Music")
                        IncludedView(text: "Edit & Mix Your Music")
                        IncludedView(text: "Save & Export Without Limits")
                        IncludedView(text: "High-Quality Tracks")
                        IncludedView(text: "Faster Generation")
                        
                    }
                        
                }
                
                Button {
                    purchaseSubscription()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 28)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        Color(hex: "A200FF"),
                                        Color(hex: "00F6FF")
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing)
                            )
                            .opacity(0.26)
                        
                        RoundedRectangle(cornerRadius: 28)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        Color(hex: "A200FF"),
                                        Color(hex: "00F6FF")
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing)
                            )
                            .padding(4)
                        
                        Text("Get Full Access")
                            .foregroundStyle(Color(hex: "FFFFFF"))
                            .font(.custom(FontEnum
                                .poppinsSemiBold.rawValue, size: 18.0))
                    }
                }
                .padding(.horizontal, 12)
                .frame(height: 64.0)
                .padding(.bottom, 14)

                
                HStack {
                    Button {
                        
                    } label: {
                        Text("Terms of Use")
                            .foregroundStyle(Color(hex: "FFFFFF"))
                            .font(.custom(FontEnum
                                .poppinsRegular.rawValue, size: 12.0))
                            .opacity(0.64)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Restore")
                            .foregroundStyle(Color(hex: "FFFFFF"))
                            .font(.custom(FontEnum
                                .poppinsRegular.rawValue, size: 12.0))
                            .opacity(0.64)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Privacy Policy")
                            .foregroundStyle(Color(hex: "FFFFFF"))
                            .font(.custom(FontEnum
                                .poppinsRegular.rawValue, size: 12.0))
                            .opacity(0.64)
                    }
                }
                .padding(.horizontal, 24)

            }
        }
    }
    
    private func purchaseSubscription() {
        switch selectedPlan {
        case .weekly:
            print("Purchasing Weekly Plan: $4.99/week with 3-day trial")
        case .monthly:
            print("Purchasing Monthly Plan: $12.99/month")
        case .yearly:
            print("Purchasing Yearly Plan: $49.99/year")
        }
        // Add your purchase logic here
    }
}

#Preview {
    PaywallView()
}
