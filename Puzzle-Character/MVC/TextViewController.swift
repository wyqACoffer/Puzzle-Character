//
//  TextViewController.swift
//  Puzzle-Character
//
//  Created by Meisi Fu on 2021/9/23.
//

import Anchorage
import UIKit

class TextViewController: UIViewController{
    private var textView = TextView()
    private var textFiledView = TextFieldView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0.9, green: 0.88, blue: 0.84, alpha: 1)
        self.configViews()
    }
    
    private func configViews() {
        self.view.addSubview(self.textView)
        self.view.addSubview(self.textFiledView)
        self.textView.topAnchor == self.view.topAnchor + 78
        self.textView.leftAnchor == self.view.leftAnchor + 385
        self.textFiledView.topAnchor == self.view.topAnchor + 251
        self.textFiledView.leftAnchor == self.view.leftAnchor + 103
    }
    
}
