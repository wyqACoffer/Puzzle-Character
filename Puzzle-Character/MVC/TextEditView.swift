//
//  TextEditView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/11/6.
//

import Anchorage
import BSText
import UIKit

class TextEditView: UIView {
    private var textView = BSTextView()
    private var nextView = NextView()
    var callBack: Block?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
        self.configCallbacks()
    }
    
    private func configViews() {
        self.addSubview(self.nextView)
        self.nextView.topAnchor == self.topAnchor + 50
        self.nextView.rightAnchor == self.rightAnchor - 60
        self.addSubview(self.textView)
        self.textView.topAnchor == self.topAnchor + 50
        self.textView.leftAnchor == self.leftAnchor + 50
        self.textView.rightAnchor == self.nextView.leftAnchor
        self.textView.bottomAnchor == self.bottomAnchor
        self.textView.backgroundColor = gColorForBackgroundView
        self.textView.font = .preferredFont(forTextStyle: .largeTitle, compatibleWith: .current)
        self.textView.textAlignment = .natural
        self.textView.placeholderTextColor = .gray
        self.textView.placeholderText = gPlaceholderText
    }
    
    private func configCallbacks() {
        self.nextView.callback =  {
            self.callBack?()
        }
    }
    
    func getText() -> String {
        if self.textView.text == "" {
            return gPlaceholderText
        } else {
            return self.textView.text
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
