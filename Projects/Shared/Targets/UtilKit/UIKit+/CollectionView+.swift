//
//  CollectionView+.swift
//  Shared_UtilKit
//
//  Created by Woody Lee on 6/11/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func registerSupplementaryHeaderView<SupplementaryView: UICollectionReusableView>(
        _ supplementaryViewType: SupplementaryView.Type
    ) {
        let reuseIdentifier = reuseIdentifier(supplementaryViewType)
        self.register(
            supplementaryViewType,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: reuseIdentifier
        )
    }

    public func registerSupplementaryFooterView<SupplementaryView: UICollectionReusableView>(
        _ supplementaryViewType: SupplementaryView.Type
    ) {
        let reuseIdentifier = reuseIdentifier(supplementaryViewType)
        self.register(
            supplementaryViewType,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: reuseIdentifier
        )
    }

    public func registerCell<Cell: UICollectionViewCell>(_ cellType: Cell.Type) {
        let reuseIdentifier = reuseIdentifier(cellType)
        self.register(cellType, forCellWithReuseIdentifier: reuseIdentifier)
    }

    public func dequeueSupplementaryView<SupplementaryView: UICollectionReusableView>(
        _ supplementaryViewType: SupplementaryView.Type,
        for indexPath: IndexPath
    ) -> SupplementaryView? {
        let reuseIdentifier = reuseIdentifier(supplementaryViewType)
        return self.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        ) as? SupplementaryView
    }

    public func dequeueSupplementaryFooterView<SupplementaryView: UICollectionReusableView>(
        _ supplementaryViewType: SupplementaryView.Type,
        for indexPath: IndexPath
    ) -> SupplementaryView? {
        let reuseIdentifier = reuseIdentifier(supplementaryViewType)
        return self.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        ) as? SupplementaryView
    }

    public func dequeueCell<Cell: UICollectionViewCell>(
        _ cellType: Cell.Type,
        for indexPath: IndexPath
    ) -> Cell? {
        let reuseIdentifier = reuseIdentifier(cellType)
        return self.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        ) as? Cell
    }

}

extension UICollectionView {
    func reuseIdentifier<ReusableView: AnyObject>(_ reusableType: ReusableView.Type) -> String {
        "\(type(of: self))"
    }
}
