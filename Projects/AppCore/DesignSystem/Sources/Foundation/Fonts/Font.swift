//
//  Font.swift
//  AppCoreKit
//
//  Created by 마경미 on 10.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

public enum Font {
    public enum Style {
        case display_01_B
        case display_01_R
        case display_02_B
        case display_02_R
        case head_01_B
        case head_01_R
        case head_02_B
        case head_02_R
        case head_03_B
        case head_03_R
        case body_01_B
        case body_01_R
        case body_02_B
        case body_02_R
        case caption_01_B
        case caption_01_R
        case caption_02_B
        case caption_02_R
        
        var font: AppCoreDesignSystemFontConvertible {
            switch self {
            case .display_01_B, .display_02_B, .head_01_B, .head_02_B, .head_03_B, .body_01_B, .body_02_B, .caption_01_B, .caption_02_B:
                return AppCoreDesignSystemFontFamily.NanumSquareRoundOTF.bold
            default:
                return AppCoreDesignSystemFontFamily.NanumSquareRoundOTF.regular
            }
        }
        
        var size: Size {
            switch self {
            case .display_01_B, .display_01_R:
                return ._32
            case .display_02_B, .display_02_R:
                return ._28
            case .head_01_B, .head_01_R:
                return ._24
            case .head_02_B, .head_02_R:
                return ._20
            case .head_03_B, .head_03_R:
                return ._18
            case .body_01_B, .body_01_R:
                return ._16
            case .body_02_B, .body_02_R:
                return ._14
            case .caption_01_B, .caption_01_R:
                return ._12
            case .caption_02_B, .caption_02_R:
                return ._10
            }
        }
        
        public var lineHeight: CGFloat {
            return size.rawValue * 1.5
        }
        
        var letterSpacing: CGFloat {
            return 0
        }
    }
    
    enum Size: CGFloat {
        case _32 = 32
        case _28 = 28
        case _24 = 24
        case _20 = 20
        case _18 = 18
        case _16 = 16
        case _14 = 14
        case _12 = 12
        case _10 = 10
    }
}
