//
//  TextView.swift
//  Puzzle-Character
//
//  Created by Meisi Fu on 2021/9/24.
//

import Anchorage
import UIKit

class TextView: UIView{
    private var textTitle = TextTitleView()
    private var textField = TextFieldView()
    private lazy var fieldStackView = UIStackView(tools: [self.textTitle, self.textField])
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        self.addSubview(self.fieldStackView)
        fieldStackView.axis = .vertical
        fieldStackView.alignment = .center
        fieldStackView.spacing = 126
        self.fieldStackView.centerAnchors == self.centerAnchors
    }
}
