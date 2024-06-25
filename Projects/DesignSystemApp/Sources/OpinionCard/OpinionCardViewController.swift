//
//  OpinionCardViewController.swift
//  TellingMe-DesignSystem-App
//
//  Created by 마경미 on 26.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

import AppCore_Entity
import AppCore_DesignSystem

final class OpinionCardViewController: UIViewController {
    private let testEmotion: Emotion = .그저그래요
    private let opinionCardView = OpinionCardView(style: .preview)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        opinionCardView.do {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.width.equalTo(310)
                $0.height.equalTo(130)
                $0.center.equalToSuperview()
            }
        }
        
        opinionCardView.configure(with: .init(
            emotionImage: testEmotion.getImage(size: .large),
            emotionText: testEmotion.korean,
            content: "대학교 1학년 시절, 내가 학교 생활로 힘들어할 때 선배가 술을 사주면서 한 말이 있다. 지금 이 순간이 힘들다 느껴도 나 어쩌구 저쩌구 저쩌구 오쪼구",
            isLiked: true,
            likeCount: 10)
        )
    }
}
