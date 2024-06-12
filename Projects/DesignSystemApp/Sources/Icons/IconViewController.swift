//
//  IconViewController.swift
//  TellingMe-DesignSystem-App
//
//  Created by Woody Lee on 6/9/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import SnapKit
import Then
import UIKit

import AppCore_DesignSystem
import SharedKit

final class IconViewController: UIViewController {
    private typealias DataSource = UITableViewDiffableDataSource<Int, Icon>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Icon>
    private var icons: [Icon] { Icon.all }
    private let tableView = UITableView()
    private lazy var dataSource = self.dataSource(tableView: tableView)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        applyIcons()
    }

    private func setupTableView() {
        tableView.do {
            $0.registerCell(Cell.self)
            $0.allowsSelection = false
            $0.separatorInset = .zero

            view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.directionalVerticalEdges.equalTo(view.safeAreaLayoutGuide)
                make.directionalHorizontalEdges.equalToSuperview()
            }
        }
    }

    private func applyIcons() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(icons)
        dataSource.apply(snapshot)
    }

    private func dataSource(tableView: UITableView) -> DataSource {
        return DataSource(tableView: tableView) { tableView, indexPath, item in
            return tableView.dequeueCell(Cell.self, for: indexPath)?.then {
                $0.configure(icon: item)
            }
        }
    }
}

extension IconViewController {
    final class Cell: UITableViewCell {
        private let stackView = UIStackView()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupUI() {
            self.stackView.do {
                $0.axis = .horizontal
                $0.spacing = 30
                $0.alignment = .center

                self.contentView.addSubview($0)
                $0.snp.makeConstraints { make in
                    make.directionalVerticalEdges.equalToSuperview().inset(6)
                    make.leading.equalToSuperview().inset(20)
                }
            }
        }

        func configure(icon: Icon) {
            self.stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

            for size in Icon.Size.all {
                let image = UIImage.icon(icon: icon, size: size)
                let imageView = UIImageView(image: image)
                imageView.layer.borderColor = UIColor.black.cgColor
                imageView.layer.borderWidth = 0.5
                self.stackView.addArrangedSubview(imageView)
            }
        }
    }
}
