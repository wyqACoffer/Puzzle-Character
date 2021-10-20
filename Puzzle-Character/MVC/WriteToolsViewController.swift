//
//  WriteToolsViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/7.
//

import Anchorage
import Hero
import UIKit

class WriteToolsViewController: CustomViewController {
    private var writeToolsDetailView = WriteToolsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configViews() {
        super.configViews()
        self.view.addSubview(self.writeToolsDetailView)
        self.writeToolsDetailView.centerXAnchor == self.view.centerXAnchor
        self.writeToolsDetailView.centerYAnchor == self.view.centerYAnchor + 10
        self.isNextViewHidden(true)
    }
}
