//
//  OpinionCardView.swift
//  AppCoreKit
//
//  Created by 마경미 on 24.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Combine
import UIKit

import SnapKit
import Then

final public class OpinionCardView: UIView {
    
    public struct Content {
        let emotionImage: UIImage
        let emotionText: String
        let content: String
        let isLiked: Bool
        let likeCount: Int
        
        public init(
            emotionImage: UIImage,
            emotionText: String,
            content: String,
            isLiked: Bool,
            likeCount: Int
        ) {
            self.emotionImage = emotionImage
            self.emotionText = emotionText
            self.content = content
            self.isLiked = isLiked
            self.likeCount = likeCount
        }
    }
    
    public enum Style {
        case preview
        case normal // Note: Preview와 Normal은 AutoLayout에 차이가 없다.
        case full
    }
    
    private let emotionImageView: UIImageView = UIImageView()
    private let emotionTitleLabel: UILabel = UILabel()
    private let contentView: UITextView = UITextView()
    private let heartButton: UIButton = UIButton()
    
    public convenience init(style: Style) {
        self.init(frame: .zero)
        setUI(style)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OpinionCardView {
    private func setUI(_ style: Style) {
        backgroundColor = .base00
        
        emotionImageView.do {
            self.addSubview($0)
        }
        
        emotionTitleLabel.do {
            self.addSubview($0)
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
            $0.backgroundColor = .gray50
        }
        
        contentView.do {
            self.addSubview($0)
            $0.font = .fontNanum(.caption_01_R)
            $0.isEditable = false
            $0.isSelectable = false
            $0.isScrollEnabled = style == .full
            $0.textContainerInset = .zero
        }
        
        heartButton.do {
            self.addSubview($0)
            $0.setTitleColor(.gray600, for: .normal)
            $0.titleLabel?.font = .fontNanum(.caption_01_B)
            $0.setImage(.icon(icon: .heart, size: .p24, color: .red500), for: .selected)
            $0.setImage(.icon(icon: .heart, size: .p24, color: .gray200), for: .normal)
            
            $0.snp.makeConstraints { make in
                make.height.equalTo(48)
                make.width.equalTo(74)
                make.top.trailing.equalToSuperview()
            }
            
            $0.addAction(.init(handler: { [weak self] _ in
                self?.heartButton.isSelected.toggle()
            }), for: .touchUpInside)
        }
        
        if style == .full {
            setFullUI()
        } else {
            setPreviewUI()
        }
    }
    
    private func setPreviewUI() {
        layer.cornerRadius = 20
        
        emotionImageView.snp.makeConstraints { make in
            make.size.equalTo(52)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(22)
        }
        
        emotionTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.leading.equalTo(emotionImageView.snp.trailing).offset(14)
            make.height.equalTo(24)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(emotionTitleLabel.snp.bottom).offset(8)
            make.leading.equalTo(emotionTitleLabel)
            make.bottom.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(22)
        }
    }
    
    private func setFullUI() {
        layer.cornerRadius = 12
        
        emotionImageView.snp.makeConstraints { make in
            make.size.equalTo(52)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(22)
        }
        
        emotionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(emotionImageView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(emotionTitleLabel.snp.bottom).offset(24)
            make.bottom.equalToSuperview().inset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}

extension OpinionCardView {
    public func configure(with content: Content) {
        emotionImageView.image = content.emotionImage
        contentView.setText(text: content.content, style: .caption_01_R)
        heartButton.isSelected = content.isLiked
        heartButton.setTitle("\(content.likeCount)", for: .normal)
        emotionTitleLabel.setText(text: " \(content.emotionText) ", style: .body_02_B, textColor: .gray600)
    }
}
