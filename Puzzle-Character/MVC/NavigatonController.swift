//
//  NavigatonController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/7.
//

import Anchorage
import Hero
import UIKit

class NavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.navigationBar.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
