//
//  ErrorAlertPresenter.swift
//  fire-charts
//
//  Created by  Jose  Santiago on 8/24/19.
//  Copyright © 2019  Jose  Santiago. All rights reserved.
//

import UIKit

class ErrorPresenter {
    
    static func showError(message: String, on viewController: UIViewController?, dismissAction: ((UIAlertAction) -> Void)? = nil) {
        weak var vc = viewController
        DispatchQueue.main.async {
            let alert = UIAlertController(title: ErrorMessages.errorTitle,
                                          message: message,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: ErrorMessages.dismissMessage, style: .default, handler: dismissAction))
            vc?.present(alert, animated: true)
        }
    }
}
