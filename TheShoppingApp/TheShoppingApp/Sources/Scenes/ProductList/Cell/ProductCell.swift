//
//  ProductCell.swift
//  TheShoppingApp
//
//  Created by Ilhan Sari on 11.01.2022.
//

import UIKit
import TheShoppingFeed

final class ProductCell: UITableViewCell {

    // MARK: - Properties
    private lazy var imageViews: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.heightAnchor.constraint(equalToConstant: 90.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 90.0).isActive = true
        return imageView
    }()

    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageViews, productNameLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.layoutMargins = UIEdgeInsets(top: 8.0,
                                               left: 8.0,
                                               bottom: 8.0,
                                               right: 8.0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        arrangeViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageViews.image = nil
        productNameLabel.text = nil
    }

}

// MARK: - Arrange Views
private extension ProductCell {

    func arrangeViews() {
        selectionStyle = .none

        contentView.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Populate UI
extension ProductCell {

    func populateUI(model: ProductModel?) {
        guard let model = model else { return }
        productNameLabel.text = model.productName
    }
}
