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
}
