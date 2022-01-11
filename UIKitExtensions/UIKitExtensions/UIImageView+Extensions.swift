//
//  UIImageView+Extensions.swift
//  UIKitExtensions
//
//  Created by Ilhan Sari on 11.01.2022.
//

import UIKit

extension UIImageView {

    public func load(urlString: String) {
        guard let urlString = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: urlString) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
}
