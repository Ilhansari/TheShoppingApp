//
//  UIViewController+Extensions.swift
//  UIKitExtensions
//
//  Created by Ilhan Sari on 11.01.2022.
//

import UIKit

extension UIViewController {

    public  func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(OKAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: false, completion: nil)
        }
    }
}
