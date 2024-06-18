//
//  ToastManager.swift
//  AppCoreKit
//
//  Created by 마경미 on 17.06.24.
//  Copyright © 2024 tellingUs. All rights reserved.
//

import UIKit

private enum ToastError: Error {
    case keyWindowNotFound
}

final public class ToastPresenter {
    public static let shared = ToastPresenter()
    
    private var activeToasts: NSMutableArray = []
    private var queue: NSMutableArray = []
    private var toastTimer: Timer?
    
    private let animationDuration: TimeInterval = 0.3
    private let duration: TimeInterval = 3.0
    
    private func makeToastView(message: String, icon: UIImage) -> ToastView {
        let toastView = ToastView(text: message, image: icon)
        toastView.alpha = 0.0
        return toastView
    }
    
    private func getWindow() throws -> UIWindow {
        guard let keyWindowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let keyWindow = keyWindowScene.windows.first(where: { $0.isKeyWindow }) else {
            throw ToastError.keyWindowNotFound
        }
        return keyWindow
    }
    
    private func showToast(toastView: ToastView) {
        do {
            if activeToasts.count > 0 {
                queue.add(toastView)
                return // Return here to ensure only one toast is shown at a time
            }
            
            let keyWindow = try getWindow()
            activeToasts.add(toastView)
            
            keyWindow.addSubview(toastView)
            toastView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(40)
                make.bottom.equalToSuperview().inset(80)
            }
            
            toastTimer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { [weak self, weak toastView] _ in
                guard let self = self, let toastView = toastView else { return }
                self.hideToast(toastView)
            }
            
            UIView.animate(withDuration: animationDuration) {
                toastView.alpha = 0.9
            }
        } catch ToastError.keyWindowNotFound {
            debugPrint("Cannot find key window")
        } catch {
            debugPrint("Unexpected error: \(error)")
        }
    }
    
    public func showToast(message: String, icon: UIImage) {
        let toastView = makeToastView(message: message, icon: icon)
        showToast(toastView: toastView)
    }
    
    private func hideToast(_ toast: UIView) {
        UIView.animate(withDuration: animationDuration, animations: {
            toast.alpha = 0.0
        }) { _ in
            self.activeToasts.remove(toast)
            toast.removeFromSuperview()
            
            if let nextToast = self.queue.firstObject as? ToastView {
                self.queue.removeObject(at: 0)
                self.showToast(toastView: nextToast)
            }
        }
        
        toastTimer?.invalidate()
        toastTimer = nil
    }
}

