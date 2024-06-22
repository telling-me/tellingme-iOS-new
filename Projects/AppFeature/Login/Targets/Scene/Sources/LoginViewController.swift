//
//  LoginViewController.swift
//  
//
//  Created by Woody Lee on 6/22/24.
//  Copyright (c) 2024 tellingUs. All rights reserved.
//

import Combine
import SnapKit
import Then
import UIKit

import AppCore_DesignSystem
import SharedKit

protocol LoginDisplayLogic: AnyObject {}

final class LoginViewController: UIViewController {
    var interactor: (any LoginBusinessLogic)?
    var router: (any LoginRoutingLogic)?

    // MARK: - UI
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
}

// MARK: - Set up

extension LoginViewController {
    private func setUI() {
        
    }
}

// MARK: - Display Logic

extension LoginViewController: LoginDisplayLogic {
    
}

// MARK: - Scene

extension LoginViewController: LoginScene {
    
}
