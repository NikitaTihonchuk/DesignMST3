import SwiftUI

struct IncludedView: View {
    var text: String
    var body: some View {
        HStack {
            Image("verify")
            
            Text(text)
                .font(.custom(FontEnum.poppinsRegular.rawValue, size: 14.0))
                .foregroundStyle(Color(hex: "FFFFFF"))
            
            Spacer()
        }
        .padding(.horizontal, 16.0)
    }
}

#Preview {
    IncludedView(text: "Unlimited Text-to-Music")
}
