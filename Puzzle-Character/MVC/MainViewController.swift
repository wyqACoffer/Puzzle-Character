//
//  Controller.swift
//  Puzzle-Character
//
//  Created by 王岩琦 on 2021/8/24.
//

import Anchorage
import Hero
import UIKit

class MainViewController: UIViewController {
    private var toolsView = ToolsView()
    // Todo
    private var copybookView = CopyboolView(image: UIImage(named: "字帖示例"))
    private var historyView = HistoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
        self.configCallback()
    }
    
    private func configViews() {
        self.view.backgroundColor = gColorForBackgroundView
        self.view.addSubview(self.toolsView)
        self.toolsView.topAnchor == self.view.topAnchor + 42
        self.toolsView.leftAnchor == self.view.leftAnchor + 35
        self.toolsView.rightAnchor == self.view.rightAnchor - 35
        self.toolsView.heightAnchor == 65
        self.toolsView.centerXAnchor == self.view.centerXAnchor
        // Todo
        self.view.addSubview(self.copybookView)
        self.copybookView.topAnchor == self.toolsView.bottomAnchor + 52
        self.copybookView.leftAnchor == self.view.leftAnchor + 77
        self.view.addSubview(self.historyView)
        self.historyView.centerAnchors == self.view.centerAnchors
        self.hero.modalAnimationType = .pageOut(direction: .right)
    }
    
    private func configCallback() {
        self.toolsView.copybookCallback = { [weak self] in
            guard let self = self else { return }
            self.copybookView.isHidden = false
            self.historyView.isHidden = true
        }
        self.toolsView.historyCallback = { [weak self] in
            guard let self = self else { return }
            self.copybookView.isHidden = true
            self.historyView.isHidden = false
        }
        self.toolsView.settingCallback = { [weak self] in
            guard let self = self else { return }
            self.copybookView.isHidden = true
            self.historyView.isHidden = true
        }
        self.historyView.fontViewCallback = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(HistoryViewController(), animated: true)
        }
        self.historyView.writeToolViewCallback = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(WriteToolsViewController(), animated: true)
        }
        
    }
}
