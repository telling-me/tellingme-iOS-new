//
//  Scene.swift
//  UtilKit
//
//  Created by Woody Lee on 6/5/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

public protocol Scene {
    var viewController: UIViewController { get }
}

public extension Scene where Self: UIViewController {
    var viewController: UIViewController {
        self
    }
}
