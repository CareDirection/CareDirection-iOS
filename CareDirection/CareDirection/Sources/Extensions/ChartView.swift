//
//  ChartView.swift
//  CareDirection
//
//  Created by 안재은 on 30/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import Macaw

class ChartView: MacawView {
    static let lastFiveShows = createDummyData()
    static let maxValue = 100
    static let maxValueLineHeight = 100
    static let lineWidth: Double = 550
    
    static let dataDivisor = Double(maxValue/maxValueLineHeight)
    static let adjustData: [Double] = lastFiveShows.map({$0.viewCount / dataDivisor})
    static var animations : [Animation] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: ChartView.createChart(), coder: aDecoder)
        backgroundColor = .clear
    }


    private static func createChart() -> Group {
        var items : [Node] = addYAxisItems() + addXAxisItems()
        items.append(createBar())
        return Group(contents: items, place: .identity)
    }

    private static func addYAxisItems() -> [Node] {
        
        let maxLines = 2
        let lineInterval = Int(maxValue/maxLines)
        let yAxisHeight: Double = 100
        let lineSpacing: Double = 30
        
        var newNodes: [Node] = []
        
        for i in 1...maxLines {
            let y = yAxisHeight - (Double(i) * lineSpacing)
            let valueLine = Line(x1: -20, y1: y, x2: lineWidth, y2: y).stroke(fill: Color.white.with(a: 0.10))
            let valueText = Text(text: "상한 섭취량", align: .max, baseline: .mid, place: .move(dx: -10, dy:y))
            valueText.fill = Color.white
            
            newNodes.append(valueLine)
            newNodes.append(valueText)
        }
        
        //let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).stroke(fill: Color.black.with(a: 0.25))
       // newNodes.append(yAxis)
        
        return newNodes
    }

    private static func addXAxisItems() -> [Node] {
        let chartBaseY: Double = 200
        var newNodes: [Node] = []
        
        for i in 1...adjustData.count {
            let x = (Double(i) * 50)
            let valueText = Text(text: lastFiveShows[i - 1].showNumber, align: .max, baseline: .mid, place: .move(dx: x, dy: chartBaseY + 15))
            valueText.fill = Color.black
            
            newNodes.append(valueText)
        }
        let xAxis = Line(x1: 0, y1: chartBaseY, x2: lineWidth, y2: chartBaseY).stroke(fill: Color.white.with(a: 0.25))
        newNodes.append(xAxis)
        
        return newNodes
    }
    
    static let palette = [0xffabab,0xffabab,0xb5e0e4, 0xcdcdcd, 0xcdcdcd, 0xffabab, 0xffabab,  0xffabab, 0xffabab, 0xffabab, 0xffabab].map { val in Color(val: val)}
    
    private static func createBar() -> Group {
        
        let items = adjustData.map { _ in Group() }
        
        animations = items.enumerated().map { (i: Int, item: Group) in
            item.contentsVar.animation(delay: Double(i) * 0.1) { t in
                let height = adjustData[i] * t
                let rect = RoundRect(rect:Rect(x: Double(i) * 50 + 25, y: 200 - height, w: 30, h: height), rx: 5, ry: 0)
                let fill = LinearGradient(degree: 90, from: palette[i], to: palette[i].with(a: 1))
                return [rect.fill(with: fill)]
            }
        }
        return items.group()
    }
    
    static func playAnimations() {
        animations.combine().play()
    }
    private static func createDummyData() -> [Chart] {
        let one = Chart(showNumber: "비타민C", viewCount: 12)
        let two = Chart(showNumber: "비타민D", viewCount: 20)
        let three = Chart(showNumber: "비타민A", viewCount: 40)
        let four = Chart(showNumber: "아미노산", viewCount: 60)
        let five = Chart(showNumber: "오메가3", viewCount: 66)
        let six = Chart(showNumber: "철분", viewCount: 70)
        let seven = Chart(showNumber: "비타민C", viewCount: 80)
        let eight = Chart(showNumber: "비타민C", viewCount: 100)
        let nine = Chart(showNumber: "비타민C", viewCount: 160)
        let ten = Chart(showNumber: "비타민C", viewCount: 180)
        let eleven = Chart(showNumber: "비타민C", viewCount: 200)

        return [one, two, three, four, five, six, seven, eight, nine, ten, eleven]
    }
}
