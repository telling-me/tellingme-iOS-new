//
//  QuestionSectionView.swift
//  AppCoreKit
//
//  Created by 마경미 on 24.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit
import SnapKit
import Then

final public class QuestionSectionView: UIView {
    public struct Content: Hashable {
        let question: String
        let subQuestion: String
        
        public init(question: String, subQuestion: String) {
            self.question = question
            self.subQuestion = subQuestion
        }
    }
    
    private var hasButton: Bool
    
    private let qLabel: UILabel = UILabel()
    private let questionLabel: UILabel = UILabel()
    private let subQuestionLabel: UILabel = UILabel()
    private let questionStackView: UIStackView = UIStackView()
    private let button: BoxButton = BoxButton(text: "기록하기", attributes: .primaryMedium)
    
    public convenience init(
        hasButton: Bool = true
    ) {
        self.init(frame: .zero)
        self.hasButton = hasButton

        configure()
    }
    
    public override init(frame: CGRect) {
         self.hasButton = true
         super.init(frame: frame)
         
         configure()
     }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QuestionSectionView {
    private func configure() {
        backgroundColor = hasButton ? .base00 : .background100
        layer.cornerRadius = 12
        
        qLabel.do {
            $0.backgroundColor = .gray50
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
            $0.setText(text: "Q", style: .body_01_B, textColor: .gray300, textAlignment: .center)
            
            self.addSubview($0)
        }
        
        questionLabel.do {
            $0.numberOfLines = 0
        }
        
        subQuestionLabel.do {
            $0.numberOfLines = 0
        }
        
        button.do {
            $0.isHidden = !hasButton
            
            self.addSubview($0)
            $0.snp.makeConstraints { make in
                make.width.equalTo(83)
                make.height.equalTo(40)
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().inset(17.5)
            }
        }
    }
}

extension QuestionSectionView {
    public func configure(with content: QuestionSectionView.Content) {
        questionLabel.setText(
            text: content.question,
            style: .body_01_B,
            textColor: .gray700,
            textAlignment: .center
        )
        
        subQuestionLabel.setText(
            text: content.subQuestion,
            style: .body_02_R,
            textColor: .gray700,
            textAlignment: .center
        )
        
        qLabel.do {
            $0.snp.makeConstraints { make in
                make.size.equalTo(28)
                make.top.equalToSuperview().inset(hasButton ? 17.5 : 8)
                make.centerX.equalToSuperview()
            }
        }
        
        questionStackView.do {
            $0.addArrangedSubview(questionLabel)
            $0.addArrangedSubview(subQuestionLabel)
            
            $0.spacing = 8
            $0.axis = .vertical
            $0.distribution = .fillProportionally
            
            self.addSubview($0)
            $0.snp.makeConstraints{ make in
                make.directionalHorizontalEdges.equalToSuperview().inset(22)
                make.top.equalTo(qLabel.snp.bottom).offset(12)
                make.bottom.equalToSuperview().inset(hasButton ? 73.5 : 8)
            }
        }
    }
}
