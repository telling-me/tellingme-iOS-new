//
//  Icon.swift
//  AppCore_DesignSystem
//
//  Created by Woody Lee on 6/10/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

public struct Icon: Hashable {
    let name: String
}

/// Figma Link
/// https://www.figma.com/design/IaTjAU5WHXCs7QBIYNH3fb/New-Tellingme-D.G?node-id=139-285&t=Ctg4lpcq253b5MRS-4
extension Icon {
    public static let caretDown: Icon = Icon(name: "caretDown")
    public static let caretLeft: Icon = Icon(name: "caretLeft")
    public static let caretRight: Icon = Icon(name: "caretRight")
    public static let caretUp: Icon = Icon(name: "caretUp")
    public static let check: Icon = Icon(name: "check")
    public static let close: Icon = Icon(name: "close")
    public static let deleteCircle: Icon = Icon(name: "deleteCircle")
    public static let heart: Icon = Icon(name: "heart")
    public static let home: Icon = Icon(name: "home")
    public static let more: Icon = Icon(name: "more")
    public static let myBookShelf: Icon = Icon(name: "myBookShelf")
    public static let mySpace: Icon = Icon(name: "mySpace")
    public static let notice: Icon = Icon(name: "notice")
    public static let otherSpace: Icon = Icon(name: "otherSpace")
    public static let user: Icon = Icon(name: "user")
    public static let bagpack: Icon = Icon(name: "bagpack")
    public static let briefcase: Icon = Icon(name: "briefcase")
    public static let cookpot: Icon = Icon(name: "cookpot")
    public static let etc: Icon = Icon(name: "etc")
    public static let graduationCap: Icon = Icon(name: "graduationCap")
    public static let handshake: Icon = Icon(name: "handshake")
    public static let health: Icon = Icon(name: "health")
    public static let magnet: Icon = Icon(name: "magnet")
    public static let pen: Icon = Icon(name: "pen")
    public static let siren: Icon = Icon(name: "siren")
    public static let smiley: Icon = Icon(name: "smiley")
    public static let values: Icon = Icon(name: "values")
    public static let warn: Icon = Icon(name: "warn")
}
