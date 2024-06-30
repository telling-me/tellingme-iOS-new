//
//  LevelSectionView.swift
//  AppCoreKit
//
//  Created by 마경미 on 26.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

final public class LevelSectionView: UIView {
    public struct Content {
        let level: Int
        let progress: Int
        
        public init(level: Int, progress: Int) {
            self.level = level
            self.progress = progress
        }
    }
    
    var timer: Timer?
    var toProgress: Int?
    var currentProgress: Float = 0
    let interval: TimeInterval = 0.05
    let duration: TimeInterval = 2.0
    
    private let textStackView: UIStackView = UIStackView()
    private let levelLabel: UILabel = UILabel()
    private let phraseLabel: UILabel = UILabel()
    private let progressView: UIProgressView = UIProgressView(progressViewStyle: .bar)
    private let progressLabel: UILabel = UILabel()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LevelSectionView {
    private func setUI() {
        backgroundColor = .base00
        layer.cornerRadius = 12
        
        textStackView.do {
            addSubview($0)
            
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.spacing = 8
            
            $0.addArrangedSubview(levelLabel)
            $0.addArrangedSubview(phraseLabel)
            
            $0.snp.makeConstraints { make in
                make.directionalHorizontalEdges.equalToSuperview().inset(22)
                make.top.equalToSuperview().inset(12)
                make.height.equalTo(24)
            }
        }
        
        progressView.do {
            addSubview($0)
            
            $0.progressTintColor = .profileCard100
            $0.backgroundColor = .gray100
            $0.layer.sublayers?.forEach { $0.removeAllAnimations() }
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
            $0.layer.sublayers![1].cornerRadius = 4
            $0.subviews[1].clipsToBounds = true
            
            $0.setProgress(Float(currentProgress) / 100, animated: false)
            
            $0.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(22)
                make.top.equalTo(textStackView.snp.bottom).offset(9)
                make.height.equalTo(8)
                make.bottom.equalToSuperview().inset(17)
            }
        }
        
        progressLabel.do {
            $0.layer.cornerRadius = 11
            $0.clipsToBounds = true
            $0.backgroundColor = .profileCard100
            
            addSubview($0)
            
            $0.snp.makeConstraints { make in
                make.height.equalTo(22)
                make.leading.equalTo(progressView.snp.trailing).offset(11)
                make.trailing.equalToSuperview().inset(22)
                make.centerY.equalTo(progressView)
            }
        }
    }
}

extension LevelSectionView {
    public func configure(with content: Content) {
        levelLabel.setText(
            text: "Lv.\(content.level)",
            style: .body_01_B,
            textColor: .gray600
        )
        
        // note: phrase는 서버팀에서 보내는 응답대로 수정 예정
        phraseLabel.setText(
            text: "연속 10일만 작성하면 LV.1 달성! (예시문구)",
            style: .caption_01_R,
            textColor: .gray500,
            textAlignment: .left
        )
        animation(progress: Float(content.progress) / 100.0)
    }
}

extension LevelSectionView {
    @objc private func updateLabel() {
        guard let toProgress = toProgress else { return }
        let increment = toProgress / Int(duration / interval)
        
        if currentProgress < Float(toProgress) {
            currentProgress += Float(increment)
            if currentProgress > Float(toProgress) {
                currentProgress = Float(toProgress)
            }
            let percentage = Int(currentProgress)  // 퍼센티지로 변환
            progressLabel.setText(
                text: "   \(percentage)%   ",
                style: .caption_01_B,
                textColor: .base00
            )
        } else {
            timer?.invalidate()
        }
    }
    
    private func animation(progress: Float) {
        toProgress = Int(progress * 100)  // progress를 0에서 100 사이의 정수로 변환
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.progressView.setProgress(progress, animated: false)
            UIView.animate(withDuration: self.duration, delay: 0, options: [.curveEaseInOut]) {
                self.progressView.layoutIfNeeded()
            }
        }
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
    }
}

