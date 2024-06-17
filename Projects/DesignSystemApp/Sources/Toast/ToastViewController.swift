//
//  ToastViewController.swift
//  TellingMe-DesignSystem-App
//
//  Created by 마경미 on 17.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

import AppCore_DesignSystem

final class ToastViewController: UIViewController {
    private let button = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        
        button.do {
            $0.setTitle("토스트", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.addTarget(self, action: #selector(showToast), for: .touchDown)
            
            view.addSubview($0)
            
            $0.snp.makeConstraints {
                $0.center.equalToSuperview()
                $0.size.equalTo(100)
            }
        }
    }
    
    @objc func showToast() {
        ToastManager.shared.showToast(message: "안녕하세용", icon: .checkmark)
    }
}
