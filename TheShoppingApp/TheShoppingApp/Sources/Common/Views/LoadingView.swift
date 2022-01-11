//
//  LoadingView.swift
//  TheShoppingApp
//
//  Created by Ilhan Sari on 11.01.2022.
//

import UIKit

final class LoadingView: UIActivityIndicatorView {

    // MARK: - Initialization
    init() {
        super.init(frame: .zero)

        color = .black
        style = .large
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showLoading() {
        DispatchQueue.main.async {
            self.startAnimating()
        }
    }

    func hideLoading() {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
}
