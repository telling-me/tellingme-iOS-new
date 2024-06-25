//
//  Emotion.swift
//  AppCore_Entity
//
//  Created by 마경미 on 25.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

import AppCore_DesignSystem

public enum Emotion: String {
    case 행복해요
    case 뿌듯해요
    case 그저그래요 = "그저 그래요"
    case 피곤해요
    case 슬퍼요
    case 화나요
    case 설레요
    case 신나요
    case 편안해요
    case 무기력해요
    case 외로워요
    case 복잡해요
    
    public enum Size: Int {
        case medium = 52
        case large = 64
    }
    
    public var english: String {
        switch self {
        case .행복해요: "happy"
        case .뿌듯해요: "proud"
        case .그저그래요: "meh"
        case .피곤해요: "tired"
        case .슬퍼요: "sad"
        case .화나요: "angry"
        case .설레요: "excited"
        case .신나요: "thrilled"
        case .편안해요: "relax"
        case .무기력해요: "lethargic"
        case .외로워요: "lonely"
        case .복잡해요: "complicated"
        }
    }
    
    public var korean: String {
        return self.rawValue
    }
    
    public func getImage(size: Size) -> UIImage {
        let bundle = AppCoreDesignSystemResources.bundle
        return UIImage(named: "\(self.english)_\(size.rawValue)", in: bundle, compatibleWith: nil) ?? AppCoreDesignSystemAsset.Emotions.happy52.image
    }
}
