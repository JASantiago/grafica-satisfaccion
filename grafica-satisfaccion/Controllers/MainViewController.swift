//
//  MainViewController.swift
//  grafica-satisfaccion
//
//  Created by  Jose  Santiago on 8/25/19.
//  Copyright © 2019  Jose  Santiago. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    //MARK: Outlets

    @IBOutlet weak var nameField: UITextField!
    
    // MARK: Properties
    var imageTaken: UIImage?
    var imagePicker: UIImagePickerController!
    
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

// MARK: Table Settings

extension MainViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let alert = UIAlertController(title: SelfieAlert.title, message: SelfieAlert.message, preferredStyle: .alert)
            
            let takePictureAction = UIAlertAction(title: SelfieAlert.takeSelfieButton, style: .default) { _ in
                
                self.imagePicker =  UIImagePickerController()
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .camera
                
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            
            // Adds View of the Taken Picture
            
            let checkPictureAction = UIAlertAction(title: SelfieAlert.checkSelfieButton, style: .default) { _ in
                if self.imageTaken != nil {
                    alert.dismiss(animated: true, completion: nil)
                    
                    let imageAlert = UIAlertController(title: SelfieAlert.image, message: SelfieAlert.checkSelfie, preferredStyle: .alert)
                    
                    let image = self.imageTaken
                    let imageView = UIImageView(frame: CGRect(x: SelfieValues.xAxis, y: SelfieValues.yAxis, width: SelfieValues.width, height: SelfieValues.height))
                    imageView.image = image
                    
                    let action = UIAlertAction(title: SelfieAlert.ok, style: .default, handler: nil)
                    imageAlert.addAction(action)
                    imageAlert.view.addSubview(imageView)
                    self.present(imageAlert, animated: true, completion: nil)
                } else {
                    alert.dismiss(animated: true, completion: nil)
                    ErrorPresenter.showError(message: ErrorMessages.noImage, on: self)
                }
            }
            
            
            let cancelAction = UIAlertAction(title: SelfieAlert.cancel, style: .cancel)
            
            alert.addAction(takePictureAction)
            alert.addAction(checkPictureAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: Conforming To

extension MainViewController:  UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageTaken = info[.originalImage] as? UIImage
    }
}
