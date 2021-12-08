//
//  WriteWorkViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit
import MaLiang

class WriteWorkViewController: CustomViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }
    
    override func configViews() {
        super.configViews()
        self.isNextViewHidden(true)
    }
}
