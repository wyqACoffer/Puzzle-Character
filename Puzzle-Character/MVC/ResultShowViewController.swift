//
//  ResultShowViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit

class ResultShowViewController: CustomViewController {
    private var resultShowView = ResultShowView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }
    
    override func configViews() {
        super.configViews()
        self.isNextViewHidden(false)
        
        self.view.addSubview(self.resultShowView)
        self.resultShowView.heightAnchor == 750
        self.resultShowView.widthAnchor == 800
        self.resultShowView.centerAnchors == self.view.centerAnchors
    }
    
    override func configCallBack() {
        super.configCallBack()
//        self.nextView.callback = {
//            self.navigationController?.pushViewController(SelectPaperViewController(), animated: true)
//        }
    }
}
