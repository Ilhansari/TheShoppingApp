//
//  ProductListViewModel.swift
//  TheShoppingApp
//
//  Created by Ilhan Sari on 11.01.2022.
//

import TheShoppingFeed

protocol ProductListViewModelDelegate: AnyObject {
    func loadData(state: ProductListViewModel.State)
}

final class ProductListViewModel {

    enum State {
        case loading
        case ready
        case error(message: String)
    }

    // MARK: - Properties
    private let networkManager = NetworkManager(baseUrl: AppConfig.environment.baseUrl)
    var dataSource: [ProductModel] = []

    weak var delegate: ProductListViewModelDelegate?
    
}

// MARK: - Networking
extension ProductListViewModel {

    func getSearchProductListData(query: String = "", page: Int = 0) {
        self.delegate?.loadData(state: .loading)
        networkManager.getSearchProduct(query: query, page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.delegate?.loadData(state: .ready)
                self.dataSource = response.products
            case .failure(let error):
                self.delegate?.loadData(state: .error(message: error.rawValue))
            }
        }
    }
}

extension ProductListViewModel {

    var numberOfRows: Int {
        return dataSource.count
    }

    func getItem(at indexPath: IndexPath) -> ProductModel? {
        return dataSource[indexPath.row]
    }
}
