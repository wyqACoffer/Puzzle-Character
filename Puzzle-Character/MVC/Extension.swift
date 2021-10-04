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
