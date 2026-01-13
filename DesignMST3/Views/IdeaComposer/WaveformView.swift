import SwiftUI

struct WaveformView: View {
    let currentTime: Double
    let totalTime: Double
    
    var body: some View {
        GeometryReader { geometry in
            let barCount = 60
            let totalSpacing = CGFloat(barCount - 1) * 2 // spacing между барами
            let availableWidth = geometry.size.width - totalSpacing
            let barWidth = availableWidth / CGFloat(barCount)
            
            HStack(spacing: 2) {
                ForEach(0..<barCount, id: \.self) { index in
                    let progress = currentTime / totalTime
                    let barProgress = Double(index) / Double(barCount)
                    let isActive = barProgress <= progress
                    
                    RoundedRectangle(cornerRadius: 1.5)
                        .fill(
                            isActive ?
                            LinearGradient(
                                colors: [
                                    Color(hex: "A200FF"),
                                    Color(hex: "00F6FF")
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            ) :
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.2),
                                    Color.white.opacity(0.2)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: barWidth, height: randomHeight(for: index))
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
    }
    
    private func randomHeight(for index: Int) -> CGFloat {
        let heights: [CGFloat] = [20, 40, 48, 35, 4, 25, 45, 48, 30, 40]
        return heights[index % heights.count]
    }
}

#Preview {
    WaveformView(currentTime: 35, totalTime: 60)
        .frame(height: 48.0)
        .padding()
        .background(Color.black)
}
