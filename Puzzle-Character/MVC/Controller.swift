//
//  Controller.swift
//  Puzzle-Character
//
//  Created by 王岩琦 on 2021/8/24.
//

import Anchorage
import UIKit

class Controller: UIViewController {
    private var toolsView = ToolsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0.9, green: 0.88, blue: 0.84, alpha: 1)
        self.configViews()
    }
    
    private func configViews() {
        self.view.addSubview(self.toolsView)
        self.toolsView.topAnchor == self.view.topAnchor + 42
        self.toolsView.leftAnchor == self.view.leftAnchor + 35
        self.toolsView.rightAnchor == self.view.rightAnchor - 35
        self.toolsView.heightAnchor == 65
        self.toolsView.centerXAnchor == self.view.centerXAnchor
    }
}
