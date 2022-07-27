//
//  FontDetailViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/8.
//

import Anchorage
import Hero
import UIKit

class FontDetailViewController: CustomViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    convenience init(fontName: String) {
        self.init()
        self.modalPresentationStyle = .pageSheet
        let fontDetailView = UIImageView(image: UIImage(named: fontName))
        self.view.addSubview(fontDetailView)
        fontDetailView.centerAnchors == self.view.centerAnchors
    }
    override func configViews() {
        super.configViews()
        self.isNextViewHidden(true)
    }
}
