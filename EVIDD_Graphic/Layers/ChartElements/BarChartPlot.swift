import Foundation
import SwiftUI
import CoreGraphics


//Horizontal plot
struct BarHStack: View {
    
  @Binding var data: [Double]
  @Binding var labels: [String]
    
  let accentColor: Color
  let gridColor: Color
  let showGrid: Bool
  let min: Double
  let max: Double
  let spacing: CGFloat
  
  var body: some View {
    
      HStack(alignment: .bottom, spacing: spacing) {
      
          ForEach(0 ..< data.count) { index in
        
              LinearGradient(
          
                gradient: .init(
            
                    stops: [
              .init(color: Color.secondary.opacity(0.6), location: 0),
              .init(color: accentColor.opacity(0.6), location: 0.4),
              .init(color: accentColor, location: 1)
            ]),
          startPoint: .bottom,
          endPoint: .top
        )
        .clipShape(BarChartHPlot(data: data[index], max: max, min: min))
      }
    }
    .shadow(color: .black, radius: 5, x: 1, y: 1)
    .padding(.horizontal, spacing)
  }
}

struct BarChartHPlot: Shape {
    
    let data: Double
    let max: Double
    let min: Double
      
    func path(in rect: CGRect) -> Path {
    
        guard min != max else {
        return Path()
        }
        
    let height = CGFloat((data - min) / (max - min)) * rect.height
    let bar = CGRect(x: rect.minX, y: rect.maxY - (rect.minY + height), width: rect.width, height: height)
        
        return Rectangle.path(in: bar)
      }
  }

