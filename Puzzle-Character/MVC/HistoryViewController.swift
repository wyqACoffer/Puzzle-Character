//
//  HistoryViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/4.
//

import Anchorage
import Hero
import UIKit

class HistoryViewController: CustomViewController {
    private var lineView = HistoryLineView()
    private var fontViewController = [FontDetailViewController]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configViews() {
        super.configViews()
        self.view.addSubview(self.lineView)
        self.lineView.centerYAnchor == self.view.centerYAnchor
        self.lineView.centerXAnchor == self.view.centerXAnchor + 25
        for index in 0...4 {
            self.fontViewController.append(FontDetailViewController(fontName: gFontNameDetails[index].rawValue)) 
        }
        self.lineView.callback = { [weak self] type in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.fontViewController[FontNameNumberType(type: type).rawValue], animated: true)
        }
    }
}

