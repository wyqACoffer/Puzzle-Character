//
//  Extension.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/9/22.
//

import UIKit

// MARK: Extension

extension UIImageView {
    convenience init(imageName: String) {
        self.init(image: UIImage(named: imageName)?.withTintColor(gColorNotSelected))
    }
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if self.isUserInteractionEnabled {
            self.alpha = 0.9
        }
    }
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if self.isUserInteractionEnabled {
            self.alpha = 0.9
        }
    }
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if self.isUserInteractionEnabled {
            self.alpha = 1
        }
    }
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        if self.isUserInteractionEnabled {
            self.alpha = 1
        }
    }
}

extension UIStackView {
    convenience init(tool: [UIView]) {
        self.init(arrangedSubviews: tool)
        self.configViews()
        self.spacing = 14
    }
    
    convenience init(tools: [UIView]) {
        self.init(arrangedSubviews: tools)
        self.configViews()
        self.spacing = 49
    }
    
    private func configViews() {
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .equalSpacing
    }
}

extension String {
    var floatValue: CGFloat {
        let db = Double(self) ?? 0
        return CGFloat(db)
    }
}
