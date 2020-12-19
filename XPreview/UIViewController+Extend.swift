//
//  UIViewController+Extend.swift
//  XPreview
//
//  Created by DH on 2020/12/19.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
extension UIViewController {
    private struct ViewControllerRepresentable: UIViewControllerRepresentable {
        private let viewController: UIViewController
        
        init(with viewController: UIViewController) {
            self.viewController = viewController
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            // Not Use
        }
    }
    
    func toPreview() -> some View {
        ViewControllerRepresentable(with: self)
    }
}

#endif
