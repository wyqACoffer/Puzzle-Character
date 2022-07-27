//
//  CustomViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/7.
//

import Anchorage
import Hero
import UIKit

class CustomViewController: UIViewController, UIGestureRecognizerDelegate {
    var backView = BackView()
    var nextView = NextView()
    
    override func viewDidLoad() {
        self.configViews()
        self.configCallBack()
    }
    
    func configViews() {
        self.view.backgroundColor = gColorForBackgroundView
        self.heroModalAnimationType = .pageIn(direction: .left)
        self.view.addSubview(self.backView)
        self.backView.topAnchor == self.view.topAnchor + 50
        self.backView.leftAnchor == self.view.leftAnchor + 60
        self.view.addSubview(self.nextView)
        self.nextView.topAnchor == self.view.topAnchor + 50
        self.nextView.rightAnchor == self.view.rightAnchor - 60
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func isNextViewHidden(_ isHidden: Bool) {
        self.nextView.isHidden = isHidden
    }
    
    func configCallBack() {
        self.backView.callback = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.popViewController(animated: true)
        }
    }
}
