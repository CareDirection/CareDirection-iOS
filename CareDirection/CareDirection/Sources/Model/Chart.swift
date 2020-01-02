//
//  Chart.swift
//  CareDirection
//
//  Created by 안재은 on 30/12/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

struct Chart {
    var showNumber : String
    var viewCount : Double
}

struct SingleChart {
    var standardTitle : String
    var stnadard1 : String
    var standard2 : String
    var standard3 : String
    var standardChart : CGFloat
    var standardDetail : String
}


struct MainChart: Codable {
    let nutrient_name : String
    let nutrient_percent : Int
}

struct ChartDetail : Codable {
    let nutrient_name: String
    let my_change_value_description: String
    let my_current_value_percent: Int
    let description: String
}
