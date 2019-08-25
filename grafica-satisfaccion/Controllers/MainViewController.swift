//
//  MainViewController.swift
//  grafica-satisfaccion
//
//  Created by  Jose  Santiago on 8/25/19.
//  Copyright © 2019  Jose  Santiago. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, UITextFieldDelegate {
    
    //MARK: Outlets

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.letters
        let charSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: charSet)
    }
}
