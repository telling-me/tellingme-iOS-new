//
//  ColorViewController.swift
//  TellingMe-DesignSystem-App
//
//  Created by 마경미 on 12.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import SnapKit
import Then
import UIKit

import AppCore_DesignSystem
import SharedKit

final class ColorViewController: UIViewController, UICollectionViewDelegate {
    private typealias DataSource = UICollectionViewDiffableDataSource<Int, UIColor>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, UIColor>
    
    private enum Section: Int, CaseIterable {
        case background
        case base
        case gray
        case primary
        case profileCard
        case red
        case sub
        
        var title: String {
            switch self {
            case .background: return "Background Colors"
            case .base: return "Base Colors"
            case .gray: return "Gray Colors"
            case .primary: return "Primary Colors"
            case .profileCard: return "Profile Card Colors"
            case .red: return "Red Colors"
            case .sub: return "Sub Colors"
            }
        }
    }
    
    private var colorsBySection: [Section: [UIColor]] {
        return [
            .background: [.background100, .background200, .background300],
            .base: [.base00, .base100],
            .gray: [.gray100, .gray200, .gray300, .gray400, .gray50, .gray500, .gray600, .gray700, .gray800, .gray900],
            .primary: [.primary100, .primary200, .primary300, .primary400, .primary50, .primary500, .primary600, .primary700, .primary800],
            .profileCard: [.profileCard100],
            .red: [.red100, .red200, .red300, .red400, .red50, .red500, .red600, .red700],
            .sub: [.sub100]
        ]
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.headerReferenceSize = CGSize(width: 0, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private lazy var dataSource = self.dataSource(collectionView: collectionView)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        applyColors()
    }

    private func setupCollectionView() {
        collectionView.do {
            $0.registerCell(Cell.self)
            $0.registerSupplementaryHeaderView(HeaderView.self)
            $0.backgroundColor = .white
            $0.delegate = self
            view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.directionalVerticalEdges.equalTo(view.safeAreaLayoutGuide)
                make.directionalHorizontalEdges.equalToSuperview()
            }
        }
    }

    private func applyColors() {
        var snapshot = Snapshot()
        Section.allCases.forEach { section in
            if let colors = colorsBySection[section] {
                snapshot.appendSections([section.rawValue])
                snapshot.appendItems(colors, toSection: section.rawValue)
            }
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    private func dataSource(collectionView: UICollectionView) -> DataSource {
        return DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            let cell: Cell? = collectionView.dequeueCell(Cell.self, for: indexPath)
            cell?.configure(color: item)
            return cell
        }.then {
            $0.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
                guard kind == UICollectionView.elementKindSectionHeader, let self = self else { return nil }
                let headerView: HeaderView? = collectionView.dequeueSupplementaryView(HeaderView.self, for: indexPath)
                let section = Section(rawValue: indexPath.section)
                headerView?.configure(title: section?.title ?? "")
                return headerView
            }
        }
    }
}

extension ColorViewController {
    final class Cell: UICollectionViewCell {
        static let identifier = "ColorCell"

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupUI() {
            contentView.layer.borderColor = UIColor.black.cgColor
            contentView.layer.borderWidth = 0.5
        }

        func configure(color: UIColor) {
            contentView.backgroundColor = color
        }
    }
    
    final class HeaderView: UICollectionReusableView {
        static let identifier = "HeaderView"
        
        private let titleLabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupUI() {
            addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(8)
            }
        }
        
        func configure(title: String) {
            titleLabel.setText(text: title, style: .head_02_B)
        }
    }
}
