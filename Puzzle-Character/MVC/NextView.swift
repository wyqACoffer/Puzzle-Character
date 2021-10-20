//
//  NextView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/18.
//

import Anchorage
import UIKit

class NextView: UIView {
    private let imageView = UIImageView(image: UIImage(named: "继续"))
    var callback: Block?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.confifViews()
    }
    
    private func confifViews() {
        self.addSubview(self.imageView)
        self.imageView.edgeAnchors == self.edgeAnchors
        self.imageView.isUserInteractionEnabled = true
        self.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapBackView)))
    }

    @objc private func didTapBackView() {
        self.callback?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
