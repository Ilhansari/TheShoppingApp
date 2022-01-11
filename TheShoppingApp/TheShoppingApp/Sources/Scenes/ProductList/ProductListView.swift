//
//  ProductListView.swift
//  TheShoppingApp
//
//  Created by Ilhan Sari on 11.01.2022.
//

import UIKit
import UIKitExtensions

final class ProductListView: UIView {

    // MARK: - Properties
    private(set) lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.tintColor = .black
        searchBar.searchTextField.textColor = .black
        searchBar.searchTextField.returnKeyType = .search
        searchBar.searchTextField.placeholder = "Search"
        searchBar.searchTextField.enablesReturnKeyAutomatically = true
        return searchBar
    }()

    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = 100.0
        tableView.register(ProductCell.self,
                           forCellReuseIdentifier: ProductCell.viewIdentifier)
        return tableView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [searchBar, tableView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()

    var loadingView = LoadingView()

    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        arrangeViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func resetSearchBar() {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

// MARK: - Arrange Views
private extension ProductListView {

    func arrangeViews() {
        backgroundColor = .white

        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        addSubview(loadingView)
        loadingView.frame = UIScreen.main.bounds
    }
}
