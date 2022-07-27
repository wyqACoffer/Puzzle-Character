//
//  AddNewView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/21.
//

import Anchorage
import UIKit
import BSText

class AddNewView: UIView {
    private var addView = UIImageView(image: UIImage(named: "输入文本"))
    private var addBGView = UIImageView(image: UIImage(named: "文本输入框"))
    private var textView = UITextView()
    var callBack: ((String) -> (String))?
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 126
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    private func configViews() {
        self.stackView.addArrangedSubview(self.addView)
        self.stackView.addArrangedSubview(self.addBGView)
        self.addSubview(self.stackView)
        self.stackView.centerAnchors == self.centerAnchors
        self.stackView.edgeAnchors == self.edgeAnchors
        
        self.addSubview(self.textView)
        self.textView.topAnchor == self.addBGView.topAnchor + 30
        self.textView.bottomAnchor == self.addBGView.bottomAnchor - 30
        self.textView.leftAnchor == self.addBGView.leftAnchor + 30
        self.textView.rightAnchor == self.addBGView.rightAnchor - 30
        
        self.textView.backgroundColor = .clear
        self.textView.textColor = .gray
        self.textView.textAlignment = .left
        self.textView.font = .preferredFont(forTextStyle: .body)
        self.textView.text = gPlaceholderText
        self.textView.isEditable = false
        self.textView.isUserInteractionEnabled = true
        self.textView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapTextView)))
    }
    
    @objc private func didTapTextView() {
        guard let labelText = self.textView.text else { return }
        let oldText = (labelText != gPlaceholderText ? labelText : "")
        if let newText = self.callBack?(oldText) {
            self.textView.text = newText
        }
    }
    
    func setText(text: String) {
        self.textView.textColor = (text == gPlaceholderText ? .gray : .black)
        self.textView.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
