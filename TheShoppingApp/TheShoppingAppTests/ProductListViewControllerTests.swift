//
//  ProductListViewControllerTests.swift
//  TheShoppingAppTests
//
//  Created by Ilhan Sari on 11.01.2022.
//

import XCTest
@testable import TheShoppingApp

class ProductListViewControllerTests: XCTestCase {

    var sut: ProductListViewController!

    override func setUp() {
        super.setUp()

        sut = ProductListViewController()

        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_load_viewControllerNotNil() {
        XCTAssertNotNil(sut)
    }

    func test_hasSearchBar() {
        XCTAssertNotNil(sut.viewSource.searchBar)
    }

    func test_shouldSetSearchBarDelegate() {
        XCTAssertNotNil(sut.viewSource.searchBar.delegate)
    }

    func test_hasText_placeHolderSearchBar() {
        XCTAssertEqual(sut.viewSource.searchBar.placeholder, "Search")
    }

    func test_conformsToSearchBarDelegateProtocol() {

        XCTAssert(sut.conforms(to: UISearchBarDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.searchBarTextDidBeginEditing(_:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.searchBarCancelButtonClicked(_ :))))
    }


}
