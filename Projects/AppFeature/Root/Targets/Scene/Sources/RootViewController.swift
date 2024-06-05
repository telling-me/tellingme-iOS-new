//
//  RootViewController.swift
//  
//
//  Created by Woody Lee on 6/6/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import SnapKit
import Then
import UIKit

import AppCore_DesignSystem
import SharedKit

protocol RootDisplayLogic: AnyObject {}

final class RootViewController: UIViewController {
    var interactor: any RootBusinessLogic
    var router: any RootRoutingLogic
    init(
        interactor: any RootBusinessLogic,
        router: any RootRoutingLogic
    ) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
}

// MARK: - Set up

extension RootViewController {
    private func setUI() {
        
    }
}

// MARK: - Display Logic

extension RootViewController: RootDisplayLogic {
    
}

// MARK: - Scene

extension RootViewController: RootScene {
    
}
