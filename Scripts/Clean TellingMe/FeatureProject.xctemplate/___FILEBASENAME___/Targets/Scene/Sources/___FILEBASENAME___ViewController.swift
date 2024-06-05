//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ tellingUs. All rights reserved.
//

import Combine
import SnapKit
import Then
import UIKit

import AppCore_DesignSystem
import SharedKit

protocol ___VARIABLE_sceneName___DisplayLogic: AnyObject {}

final class ___VARIABLE_sceneName___ViewController: UIViewController {
    var interactor: any ___VARIABLE_sceneName___BusinessLogic
    var router: any ___VARIABLE_sceneName___RoutingLogic
    init(
        interactor: any ___VARIABLE_sceneName___BusinessLogic,
        router: any ___VARIABLE_sceneName___RoutingLogic
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

extension ___VARIABLE_sceneName___ViewController {
    private func setUI() {
        
    }
}

// MARK: - Display Logic

extension ___VARIABLE_sceneName___ViewController: ___VARIABLE_sceneName___DisplayLogic {
    
}

// MARK: - Scene

extension ___VARIABLE_sceneName___ViewController: ___VARIABLE_sceneName___Scene {
    
}
