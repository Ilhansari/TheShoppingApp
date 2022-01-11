//
//  ProductListViewController.swift
//  TheShoppingApp
//
//  Created by Ilhan Sari on 11.01.2022.
//

import UIKit
import UIKitExtensions

final class ProductListViewController: UIViewController {

    private enum Constants {
        static let minTextCount = 2
    }

    // MARK: - Properties
    var viewSource = ProductListView()
    private var viewModel = ProductListViewModel()

    override func loadView() {
        super.loadView()
        view = viewSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Shopping"
        setViewSourceDelegate()
        viewModel.delegate = self
        viewModel.getSearchProductListData()

    }

    private func setViewSourceDelegate() {
        viewSource.tableView.dataSource = self
        viewSource.searchBar.delegate = self
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductCell = tableView.deque(at: indexPath)
        let model = viewModel.getItem(at: indexPath)
        cell.populateUI(model: model)
        return cell
    }
}

// MARK: - UISearchBarDelegate
extension ProductListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.count > Constants.minTextCount else { return }
        viewModel.getSearchProductListData(query: searchText)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewSource.searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewSource.resetSearchBar()
    }
}

// MARK: - ShoppingListViewModelDelegate
extension ProductListViewController: ProductListViewModelDelegate {
    func loadData(state: ProductListViewModel.State) {
        switch state {
        case .loading:
            viewSource.loadingView.showLoading()
        case .ready:
            DispatchQueue.main.async {
                self.viewSource.tableView.reloadData()
            }
            viewSource.loadingView.hideLoading()
        case .error(let message):
            showAlert(title: "Error", message: message)
            viewSource.loadingView.hideLoading()
        }
    }
}
