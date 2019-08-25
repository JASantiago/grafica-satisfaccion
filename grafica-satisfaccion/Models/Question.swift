//
//  Question.swift
//  grafica-satisfaccion
//
//  Created by  Jose  Santiago on 8/25/19.
//  Copyright © 2019  Jose  Santiago. All rights reserved.
//

import Foundation

struct ApiResponse: Decodable {
    var colors: [String]
    var questions: [Question]
}

struct Question: Decodable {
    var total: Int
    var text: String
    var chartData: [ChartData]
}
