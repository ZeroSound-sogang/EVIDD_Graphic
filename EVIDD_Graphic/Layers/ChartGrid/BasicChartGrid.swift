import Foundation
import SwiftUI
import CoreGraphics


//vertical grid

struct BasicChartVGrid: Shape {
    let divisions: Int
    
    func path(in rect: CGRect) -> Path {
      var path = Path()
      let stepSize = rect.width / CGFloat(divisions)
      
      (1 ... divisions).forEach { step in
        path.move(to: CGPoint(x: rect.maxX - stepSize * CGFloat(step), y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - stepSize * CGFloat(step), y: rect.minY))
      }
      
      return path
    }
  }

//horizontal grid

struct BasicChartHGrid: Shape {
    let divisions: Int
    
    func path(in rect: CGRect) -> Path {
      var path = Path()
      let stepSize = rect.height / CGFloat(divisions)
      
      (1 ... divisions).forEach { step in
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY - stepSize * CGFloat(step)))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - stepSize * CGFloat(step)))
      }
      
      return path
    }
  }


