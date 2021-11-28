import Foundation
import CoreGraphics
import SwiftUI

struct LineChartPath: Shape {
  let data: [Double]
    
  func path(in rect: CGRect) -> Path {
    guard
      2 <= data.count,
      let minimum = data.min(),
      0 <= minimum,
      let maximum = data.max()
    else { return Path() }
    
    var path = Path()
      let stepSize = rect.width / CGFloat(data.count)
      
      for (index, entry) in data.enumerated()  {
          path.move(to: CGPoint(x: rect.minX + stepSize * CGFloat(index),
                                y: rect.minY + CGFloat(entry / maximum)))
          
          path.addLine(to: CGPoint(x: rect.minX + stepSize * CGFloat(index),
                                   y: rect.minY + CGFloat(entry / maximum)))
      }
      return path
    }
  }

