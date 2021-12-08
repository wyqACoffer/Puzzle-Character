//
//  SelectPaperViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit

class SelectPaperViewController: CustomViewController {
    private var selectPaperView = SelectPaperView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }
    
    override func configViews() {
        super.configViews()
        self.isNextViewHidden(false)
        
        self.view.addSubview(self.selectPaperView)
        self.selectPaperView.heightAnchor == 750
        self.selectPaperView.widthAnchor == 1000
        self.selectPaperView.centerXAnchor == self.view.centerXAnchor
        self.selectPaperView.centerYAnchor == self.view.centerYAnchor + 50
    }
    
    override func configCallBack() {
        super.configCallBack()
        self.nextView.callback = {
            self.navigationController?.pushViewController(SelectShapeViewController(), animated: true)
        }
    }
}
