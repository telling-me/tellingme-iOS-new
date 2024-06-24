//
//  Input.swift
//  ProfileEditScene
//
//  Created by Woody Lee on 6/23/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import Combine
import SnapKit
import Then
import UIKit

import AppCore_DesignSystem
import SharedKit

protocol InputView: UIView {}

final class InputField: UIView {
    private var cancellables = Set<AnyCancellable>()

    private let containerView = UIStackView()
    private var textField = TextField()
    private var lineView = UIView()
    private let errorLabel = UILabel()

    private let validitySubject = CurrentValueSubject<Validity, Never>(.valid)
    private let statusSubject = CurrentValueSubject<Status, Never>(.inactive)

    private var maxCount: Int? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Set up

extension InputField {
    private func setupUI() {
        containerView.do {
            $0.axis = .vertical
            $0.spacing = 8.0
            $0.alignment = .fill
            $0.distribution = .fill

            $0.addArrangedSubview(textField)
            $0.addArrangedSubview(lineView)
            $0.addArrangedSubview(errorLabel)
            addSubview($0)

            $0.snp.makeConstraints { make in
                make.directionalEdges.equalToSuperview()
            }
        }

        textField.do {
            $0.borderStyle = .none
            $0.delegate = self
            $0.leftViewMode = .always
            $0.rightViewMode = .always
            $0.contentVerticalAlignment = .center
            $0.clearButtonMode = .always
            $0.autocorrectionType = .no
            $0.spellCheckingType = .no
            $0.returnKeyType = .done

            $0.defaultTextAttributes = Const.textAttributes
            $0.typingAttributes = Const.textAttributes
            $0.tintColor = Const.textColor

            $0.snp.makeConstraints { make in
                make.height.equalTo(24)
            }
        }

        lineView.do {
            lineView.layer.cornerRadius = 0.5
            lineView.layer.masksToBounds = true

            $0.snp.makeConstraints { make in
                make.height.equalTo(1)
            }
        }
    }

    private func bind() {
        let active = textField.editingDidBegin
            .map { _ in Status.active }

        let inactive = textField.editingDidEnd
            .map { _ in Status.inactive }

        Publishers.Merge(active, inactive)
            .removeDuplicates()
            .sink { [weak self] in self?.statusSubject.send($0) }
            .store(in: &cancellables)

        Publishers.CombineLatest(
            validitySubject,
            statusSubject
        )
        .sink { [weak self] in self?.configureStyle(validity: $0, status: $1) }
        .store(in: &cancellables)
    }
}

// MARK: - Configure (Interface)

extension InputField {
    var text: String {
        textField.text ?? ""
    }

    var textPublisher: AnyPublisher<String, Never> {
        textField.textDidChange
            .eraseToAnyPublisher()
    }

    var editingDidEndPublisher: AnyPublisher<String, Never> {
        textField.editingDidEnd
            .eraseToAnyPublisher()
    }

    var editingDidBeginPublisher: AnyPublisher<String, Never> {
        textField.editingDidBegin
            .eraseToAnyPublisher()
    }

    func setMaxCount(_ maxCount: Int?) {
        self.maxCount = maxCount
    }

    func setText(_ text: String) {
        self.textField.text = text
    }

    func updateValidity(_ validity: Validity) {
        self.validitySubject.send(validity)
    }

    func updateKeyboardType(_ keyboardType: UIKeyboardType) {
        textField.keyboardType = keyboardType
    }

    func updatePlaceholder(_ placeholder: String?) {
        textField.attributedPlaceholder = placeholder?
            .attributedFont(attributes: Const.placeholderAttributes)
    }
}

// MARK: - Configure (Internal)

extension InputField {
    private func configureStyle(validity: Validity, status: Status) {
        configureErrorLabelStyle(validity: validity)
        configureLineStyle(showError: validity != .valid, status: status)
    }

    private func configureErrorLabelStyle(validity: Validity) {
        let errorText: String
        
        if case let .invalid(text) = validity { errorText = text }
        else { errorText = "" }

        errorLabel.setText(
            text: errorText,
            style: .caption_01_R,
            textColor: .red600
        )
    }

    private func configureLineStyle(showError: Bool, status: Status) {
        lineView.backgroundColor = showError ? Const.errorColor : status.color
    }
}

// MARK: - UITextFieldDelegate

extension InputField: UITextFieldDelegate {
    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        guard let text = textField.text else { return true }

        // Note: 띄워쓰기 막기
        if string.contains(" ") {
            return false
        }

        return limitCharacterCount(text: text, range: range, replacementString: string)
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    private func limitCharacterCount(
        text: String,
        range: NSRange,
        replacementString string: String
    ) -> Bool {
        guard let textRange = Range(range, in: text),
              let maxCount = maxCount
        else { return true }

        let res = text.replacingCharacters(in: textRange, with: string)

        if res.count <= maxCount {
            return true
        } else {
            let textClipped = String(res.prefix(maxCount))
            setText(textClipped)
            return false
        }
    }
}

// MARK: - Validity Status

extension InputField {
    enum Validity: Equatable {
        case valid
        case invalid(String)
    }

    enum Status: Equatable {
        case inactive
        case active
    }
}

// MARK: - Const

extension InputField {
    private enum Const {
        static let errorColor: UIColor = .red600
        static let activeColor: UIColor = .primary400
        static let inactiveColor: UIColor = .gray200
        static let textColor: UIColor = .gray600

        static let placeholderAttributes: Font.Attributes = .init(style: .body_01_R, textColor: .gray300)
        static let textAttributes = " "
            .attributedFont(attributes: .init(style: .body_01_R, textColor: textColor))
            .attributes(at: 0, effectiveRange: nil)

    }
}

extension InputField.Status {
    var color: UIColor {
        switch self {
        case .inactive:
            return InputField.Const.inactiveColor
        case .active:
            return InputField.Const.activeColor
        }
    }
}
