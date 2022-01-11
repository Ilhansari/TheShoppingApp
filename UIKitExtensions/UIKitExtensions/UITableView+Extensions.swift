//
//  UITableView+Extensions.swift
//  UIKitExtensions
//
//  Created by Ilhan Sari on 11.01.2022.
//

import UIKit

public extension UITableView {

    func deque<T: ViewIdentifier>(at indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.viewIdentifier, for: indexPath) as? T else {
            fatalError("can not deque cell with identifier \(T.viewIdentifier) from tableView \(self)")
        }

        return cell
    }
}

