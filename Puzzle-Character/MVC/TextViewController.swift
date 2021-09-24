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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0.9, green: 0.88, blue: 0.84, alpha: 1)
        self.configViews()
    }
    
    private func configViews() {
        self.view.addSubview(self.textView)
        self.textView.topAnchor == self.view.topAnchor + 168
        self.textView.leftAnchor == self.view.leftAnchor + 93
        self.textView.heightAnchor == 636
    }
    
}
