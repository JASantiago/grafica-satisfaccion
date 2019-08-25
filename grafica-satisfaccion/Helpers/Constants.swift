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
    static let genericErrorMessage = "Ocurrio un error, por favor intenta de nuevo"
    static let dismissMessage = "Entendido"
    static let noImage = "No hay imagenes tomadas"
}

enum SelfieAlert {
    static let title = "Selfie"
    static let message = "Tomate un selfie o revisa la que ya tienes"
    static let cancel = "Cancelar"
    static let takeSelfieButton = "Tomar Selfie"
    static let checkSelfieButton = "Revisar"
    static let ok = "Ok"
    static let image = "Imagen"
    static let checkSelfie = "Ver selfie"
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
