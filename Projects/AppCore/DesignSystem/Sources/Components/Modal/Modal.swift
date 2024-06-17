//
//  ModalViewController.swift
//  AppCore_DesignSystem
//
//  Created by Woody Lee on 6/17/24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import SnapKit
import Then
import UIKit

public final class Modal: UIViewController {
    private let attributes: Modal.Attributes

    public init(attributes: Modal.Attributes) {
        self.attributes = attributes

        super.init(nibName: nil, bundle: nil)

        self.modalPresentationStyle = .overFullScreen
        setupUI()
    }

    public convenience init(
        title: String,
        description: String? = nil,
        primaryActionText: String,
        primaryActionHandler: @escaping () -> Void,
        secondaryActioniText: String? = nil,
        secondaryActionHandler: (() -> Void)? = nil
    ) {
        self.init(
            attributes: .init(
                title: title,
                description: description,
                primaryActionText: primaryActionText,
                primaryActionHandler: primaryActionHandler,
                secondaryActioniText: secondaryActioniText,
                secondaryActionHandler: secondaryActionHandler
            )
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        startPresentAnimation()
    }

    private let dimmedView: UIView = UIView()
    private let containerView: UIView = UIView()
    private let textStackView: UIStackView = UIStackView()
    private let buttonStackView: UIStackView = UIStackView()
}

// MARK: - Set up

extension Modal {
    private func setupUI() {
        view.backgroundColor = .clear

        setupContainerView()
        setupTextStackView()
        setupButtonStackView()
    }

    private func setupContainerView() {
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = .base00

        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300) // Note: 정확한 값을 모르겠어서 300으로 설정했어요. 
        }
    }

    private func setupTextStackView() {
        textStackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .fill
            $0.distribution = .equalSpacing

            containerView.addSubview($0)
            $0.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(30)
                make.directionalHorizontalEdges.equalToSuperview().inset(16)
            }
        }

        setupTitle()
        setupDescription()
    }

    private func setupTitle() {
        UILabel().do {
            $0.setText(
                text: attributes.title,
                style: .body_01_B,
                textColor: .gray600
            )
            $0.textAlignment = .center

            textStackView.addArrangedSubview($0)
        }
    }

    private func setupDescription() {
        guard let description = attributes.description else { return }
        
        UILabel().do {
            $0.setText(
                text: description,
                style: .body_01_B,
                textColor: .gray600
            )
            $0.textAlignment = .center

            textStackView.addArrangedSubview($0)
        }
    }

    private func setupButtonStackView() {
        buttonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .center
            $0.distribution = .fillEqually

            containerView.addSubview($0)
            $0.snp.makeConstraints { make in
                make.top.equalTo(textStackView.snp.bottom).offset(20)
                make.directionalHorizontalEdges.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(20)
            }
        }

        setupSecondaryButton()
        setupPrimaryButton()
    }

    private func setupSecondaryButton() {
        guard let secondaryActioniText = attributes.secondaryActioniText else { return }

        BoxButton(
            text: secondaryActioniText,
            attributes: .primaryLightLarge
        ).do {
            buttonStackView.addArrangedSubview($0)

            $0.setTapHandler { [weak self] in
                guard let self else { return }

                tapHandler(attributes.secondaryActionHandler)
            }
        }
    }

    private func setupPrimaryButton() {
        BoxButton(
            text: attributes.primaryActionText,
            attributes: .primaryLarge
        ).do {
            buttonStackView.addArrangedSubview($0)
         
            $0.setTapHandler { [weak self] in
                guard let self else { return }

                tapHandler(attributes.primaryActionHandler)
            }
        }
    }
}

// MARK: - Tap Handler

extension Modal {
    private func tapHandler(_ handler: (() -> Void)?) {
        startDismissAnimation { [weak self] in
            self?.dismiss(animated: false, completion: handler)
        }
    }
}

// MARK: - Animation

extension Modal {
    private func startPresentAnimation() {
        preparePresentAnimation()
        
        UIViewPropertyAnimator(
            duration: 0.2,
            curve: .easeOut,
            animations: {
                self.containerView.alpha = 1
                self.containerView.transform = .identity
                self.dimmedView.alpha = 1
            }
        )
        .startAnimation()
    }

    private func preparePresentAnimation() {
        layoutDimmedView()
        containerView.transform = .init(scaleX: 1.1, y: 1.1)
    }

    private func startDismissAnimation(_ completionHandler: @escaping () -> Void) {
        UIViewPropertyAnimator(
            duration: 0.13,
            curve: .easeOut,
            animations: {
                self.containerView.alpha = 0
                self.dimmedView.alpha = 0
            }
        )
        .withCompletion { _ in
            self.dimmedView.removeFromSuperview()
            completionHandler()
        }
        .startAnimation()
    }

    private func layoutDimmedView() {
        dimmedView.do {
            $0.alpha = 0
            $0.backgroundColor = .base100.withAlphaComponent(0.3)

            view.insertSubview($0, at: .zero)
            $0.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}

// MARK: - Show

extension Modal {
    public func show(from viewController: UIViewController) {
        viewController.present(self, animated: false)
    }
}
