//
//  CustomButton.swift
//  ThreeButtons
//
//  Created by Иван Дроботов on 04.02.2024.
//

import UIKit

final class CustomButton: UIButton {
    private struct Constants {
        static let verticalPedding: CGFloat = 10.0
        static let horizontalPedding: CGFloat = 14.0
        static let imagePedding: CGFloat = 8.0
        static let imageName: String = "arrow.right.circle"
    }

    private let text: String
    private let action: (()->())?
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.5,
                           delay: 0.0,
                           options: [.allowUserInteraction, .beginFromCurrentState],
                           animations: {
                let scale = self.isHighlighted ? 0.6 : 1
                self.transform = CGAffineTransform(scaleX: scale, y: scale)
            }, completion: nil)
            
            if self.isHighlighted {
                action?()
            }
        }
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        if tintAdjustmentMode == .dimmed {
            backgroundColor = .systemGray2
            tintColor = .systemGray3
        } else {
            backgroundColor = .systemBlue
            tintColor = .systemGray6
        }
    }
    
    init(text: String, action: (() -> ())? = nil) {
        self.text = text
        self.action = action
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        backgroundColor = .systemBlue
        layer.cornerRadius = 10.0
        guard let image = UIImage(systemName: Constants.imageName) else { return }
        setImage(image, for: [])
        setTitle(text, for: [])
        tintColor = .systemGray6
    }
    
    private func layout() {
        semanticContentAttribute = .forceRightToLeft
        
        titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -Constants.imagePedding,
            bottom: 0.0,
            right: Constants.imagePedding
        )
        
        contentEdgeInsets = UIEdgeInsets(
            top: Constants.verticalPedding,
            left: Constants.horizontalPedding + Constants.imagePedding,
            bottom: Constants.verticalPedding,
            right: Constants.verticalPedding
        )
    }
}

