//
//  Constants.swift
//  grafica-satisfaccion
//
//  Created by  Jose  Santiago on 8/25/19.
//  Copyright © 2019  Jose  Santiago. All rights reserved.
//

import Foundation

enum ApiUrls {
    static let chartData = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld"
}

enum ErrorMessages {
    static let errorTitle = "Error"
    static let genericErrorMessage = "An error ocurred, please try agian later"
    static let dismissMessage = "Dismiss"
    static let noImage = "No image taken"
}

enum SelfieAlert {
    static let title = "Selfie"
    static let message = "Take a selfie or check your past selfie"
    static let cancel = "Cancel"
    static let takeSelfieButton = "Take"
    static let checkSelfieButton = "Check"
    static let ok = "Ok"
    static let image = "Image"
    static let checkSelfie = "Check selfie"
}

enum TableCellIdentifiers {
    static let pieChart = "PieChartCell"
}

enum SelfieValues {
    static let xAxis = 10
    static let yAxis = 10
    static let height = 50
    static let width = 50
}
