//
//  InputField+Combine.swift
//  ProfileEditScene
//
//  Created by Woody Lee on 6/23/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Combine
import UIKit

extension UITextField {
    var editingDidEnd: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidEndEditingNotification, object: self)
            .compactMap{ $0.object as? UITextField }
            .map{ $0.text ?? "" }
            .eraseToAnyPublisher()
    }

    var editingDidBegin: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidBeginEditingNotification, object: self)
            .compactMap{ $0.object as? UITextField }
            .map{ $0.text ?? "" }
            .eraseToAnyPublisher()
    }

    var textDidChange: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for:  UITextField.textDidChangeNotification, object: self)
            .compactMap{ $0.object as? UITextField }
            .map{ $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}
