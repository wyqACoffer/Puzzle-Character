//
//  FontView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/8.
//

import Anchorage
import UIKit

class FontView: UIView {
    private var fontNameType: FontNameType!
    var callback: ((_ type: FontNameType) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(type: FontNameType) {
        self.init()
        self.fontNameType = type
        let view = UIImageView(image: UIImage(named: type.rawValue))
        self.addSubview(view)
        view.edgeAnchors == self.edgeAnchors
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapFontView)))
    }
    
    @objc private func didTapFontView() {
        self.callback?(self.fontNameType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
