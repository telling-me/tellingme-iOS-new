//
//  LevelSectionViewController.swift
//  TellingMe-DesignSystem-App
//
//  Created by 마경미 on 28.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

import AppCore_DesignSystem

import SnapKit

final class LevelSectionViewController: UIViewController {
    private let levelSectionView: LevelSectionView = LevelSectionView()
    
    private let testData: LevelSectionView.Content = .init(level: 1, progress: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension LevelSectionViewController {
    private func setUI() {
        levelSectionView.do {
            view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.horizontalEdges.equalToSuperview().inset(22)
            }
            
            $0.configure(with: testData)
        }
    }
}
