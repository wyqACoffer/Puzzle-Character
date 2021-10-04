//
//  Controller.swift
//  Puzzle-Character
//
//  Created by 王岩琦 on 2021/8/24.
//

import Anchorage
import UIKit

class MainController: UIViewController {
    private var toolsView = ToolsView()
    // Todo
    private var copybookView = CopyboolView(image: UIImage(named: "字帖示例"))
    private var historyView = HisToryView()
    
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
        // Todo
        self.view.addSubview(self.copybookView)
        self.copybookView.topAnchor == self.toolsView.bottomAnchor + 52
        self.copybookView.leftAnchor == self.view.leftAnchor + 77
        self.view.addSubview(self.historyView)
        self.historyView.centerAnchors == self.view.centerAnchors
        
        self.toolsView.copybookCallBack = {
            self.copybookView.isHidden = false
            self.historyView.isHidden = true
        }
        self.toolsView.historyCallBack = {
            self.copybookView.isHidden = true
            self.historyView.isHidden = false
        }
        self.toolsView.settingCallBack = {
            self.copybookView.isHidden = true
            self.historyView.isHidden = true
        }
    }
}
