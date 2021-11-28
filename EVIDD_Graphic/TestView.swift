import SwiftUI

struct TestView: View {
    var data: [Double]
    let gridColor: Color
    let dataColor: Color
    
    init(data: [Double], gridColor: Color = .gray, dataColor: Color = .blue) {
      self.data = data
      self.gridColor = gridColor
      self.dataColor = dataColor
    }
    
    var body: some View {
        
        
        ZStack{
            BasicChartHGrid(divisions: 15)
              .stroke(gridColor, lineWidth: 0.5)
            
        
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(data: [10, 2, 3, 4, 100, 13, 15, 16])
        // 임의의 배열 형태 [double] / [string: double]
    }
}
