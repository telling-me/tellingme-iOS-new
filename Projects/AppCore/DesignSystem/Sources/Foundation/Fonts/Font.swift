//
//  Font.swift
//  AppCoreKit
//
//  Created by 마경미 on 10.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

public enum Font {
    public enum Style: String {
        case display
        case head
        case body
        case caption
    }
    public enum Weight: String {
        case bold = "B"
        case regular = "R"
    }
    
    public enum Size: CGFloat {
        case 32
        case 28
        case 24
        case 20
        case 18
        case 16
        case 14
        case 12
        case 10
    }

    private var fontName: String { 
        return "\(style.rawValue)_"\(size.rawValue)"_"(weight.rawValue)"
    }
        
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
        
        var lineHeight: CGFloat {
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
