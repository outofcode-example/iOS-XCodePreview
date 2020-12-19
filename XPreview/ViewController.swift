//
//  ViewController.swift
//  XPreview
//
//  Created by DH on 2020/12/19.
//

import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct ViewControllerPreview: PreviewProvider {
    static let deviceNames = [
        "iPhone SE",
        "iPhone 11 Pro Max",
        "iPhone 7"
    ]
    
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            ViewController().toPreview()
                .previewDevice(.init(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif

class ViewController: UIViewController {
    
    private lazy var contentView = ContentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension ViewController {
    final class ContentView: UIView {
        private lazy var button: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .blue
            button.setTitle("타이틀입니다.", for: .normal)
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            return button
        }()
        
        private lazy var imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            let image = UIImage(named: "apple.png")
            guard let size = image?.size else { return imageView }
            
            let height: CGFloat = 60.0
            let width = (height / size.height) * size.width
            
            imageView.image = image
            
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: height),
                imageView.widthAnchor.constraint(equalToConstant: width)
            ])
            
            return imageView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .lightGray
            translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(button)
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: leadingAnchor),
                button.trailingAnchor.constraint(equalTo: trailingAnchor),
                button.bottomAnchor.constraint(equalTo: bottomAnchor),
                
            ])
            
            addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                imageView.topAnchor.constraint(equalTo: topAnchor)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
