//
//  SelectShapeViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit

class SelectShapeViewController: CustomViewController {
    private var selectShapeView = SelectShapeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }
    
    override func configViews() {
        super.configViews()
        self.isNextViewHidden(false)
        
        self.view.addSubview(self.selectShapeView)
        self.selectShapeView.heightAnchor == 750
        self.selectShapeView.widthAnchor == 800
        self.selectShapeView.centerAnchors == self.view.centerAnchors
    }
    
    override func configCallBack() {
        super.configCallBack()
        self.nextView.callback = {
            self.navigationController?.pushViewController(ResultShowViewController(), animated: true)
        }
    }
}
