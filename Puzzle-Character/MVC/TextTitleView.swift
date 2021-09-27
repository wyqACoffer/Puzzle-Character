//
//  TextTitleView.swift
//  Puzzle-Character
//
//  Created by Meisi Fu on 2021/9/27.
//

import Anchorage
import UIKit

class TextTitleView: UIView{
    private var textTitle = UIImageView(image: UIImage(named:"输入文本"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        self.addSubview(textTitle)
        self.textTitle.leftAnchor == self.leftAnchor + 302
    }
}
