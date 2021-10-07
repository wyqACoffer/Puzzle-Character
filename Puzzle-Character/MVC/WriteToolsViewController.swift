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
    private var writeToolsDetailView = UIImageView(image: UIImage(named: "书写工具详情"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configViews() {
        super.configViews()
        self.view.addSubview(self.writeToolsDetailView)
        self.writeToolsDetailView.centerAnchors == self.view.centerAnchors
    }
}
