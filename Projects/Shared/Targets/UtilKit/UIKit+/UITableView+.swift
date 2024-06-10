//
//  UITableView+.swift
//  Shared_UtilKit
//
//  Created by Woody Lee on 6/10/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension UITableView {
    public func registerHeaderFooter<HeaderFooter: UITableViewHeaderFooterView>(_ headerFooterType: HeaderFooter.Type) {
        let reuseIdentifier = reuseIdentifier(headerFooterType)
        self.register(headerFooterType, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }

    public func registerCell<Cell: UITableViewCell>(_ cellType: Cell.Type) {
        let reuseIdentifier = reuseIdentifier(cellType)
        self.register(cellType, forCellReuseIdentifier: reuseIdentifier)
    }

    public func dequeueHeaderFooter<HeaderFooter: UITableViewHeaderFooterView>(_ headerFooterType: HeaderFooter.Type) -> HeaderFooter? {
        let reuseIdentifier = reuseIdentifier(headerFooterType)
        return self.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? HeaderFooter
    }

    public func dequeueCell<Cell: UITableViewCell>(_ cellType: Cell.Type, for indexPath: IndexPath) -> Cell? {
        let reuseIdentifier = reuseIdentifier(cellType)
        return self.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? Cell
    }
}

extension UITableView {
    func reuseIdentifier<ReusableView: AnyObject>(_ reusableType: ReusableView.Type) -> String {
        "\(type(of: self))"
    }
}
