//
//  SelectFontViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/7.
//

import Anchorage
import UIKit

class SelectFontViewController: CustomViewController {
    private var selectFontView = SelectFontView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }
    
    override func configViews() {
        super.configViews()
        self.isNextViewHidden(false)
        
        self.view.addSubview(self.selectFontView)
        self.selectFontView.heightAnchor == 750
        self.selectFontView.widthAnchor == 900
        self.selectFontView.centerAnchors == self.view.centerAnchors
    }
    
    override func configCallBack() {
        super.configCallBack()
        self.nextView.callback = {
            self.navigationController?.pushViewController(SelectPaperViewController(), animated: true)
        }
    }
}
