//
//  ToastView.swift
//  AppCoreKit
//
//  Created by 마경미 on 17.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

import Then
import SnapKit

final public class ToastView: UIView {
    private let iconView: UIImageView = UIImageView()
    private let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, image: UIImage) {
        self.init(frame: .zero)
        self.label.setText(text: text, style: .body_02_B, textColor: .base00)
        self.iconView.image = image
    }
    
    private func setupView() {
        backgroundColor = .gray500
        layer.cornerRadius = 12
        
        iconView.do {
            addSubview($0)
            $0.backgroundColor = .clear
            $0.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(16)
                make.size.equalTo(24)
                make.directionalVerticalEdges.equalToSuperview().inset(18)
            }
        }
        
        label.do {
            addSubview($0)
            $0.backgroundColor = .clear
            $0.snp.makeConstraints { make in
                make.leading.equalTo(iconView.snp.trailing).offset(8)
                make.trailing.equalToSuperview().inset(16)
                make.directionalVerticalEdges.equalTo(iconView)
            }
        }
    }
}
