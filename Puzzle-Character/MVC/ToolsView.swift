//
//  View.swift
//  Puzzle-Character
//
//  Created by 王岩琦 on 2021/9/7.
//

import Anchorage
import UIKit

class ToolsView: UIView {
    private var copybookStackView = UIStackView(tool: [UIImageView(imageName: "瓦当"), UIImageView(imageName: "字帖")])
    private var historyStackView = UIStackView(tool: [UIImageView(imageName: "瓦当"), UIImageView(imageName: "历史")])
    private var settingStackView = UIStackView(tool: [UIImageView(imageName: "瓦当"), UIImageView(imageName: "设置")])
    private var pencilView = ToolView(image: UIImage(named: "pencil"))
    private var addView = ToolView(image: UIImage(named: "add"))
    private lazy var toolsStackView = UIStackView(tools: [self.copybookStackView, self.historyStackView, self.settingStackView])
    var copybookCallback: Block?
    var historyCallback: Block?
    var settingCallback: Block?
    // Todo
    private var copybookView = UIImageView(image: UIImage(named: "字帖示例"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
        self.didTapCopybook()
    }
    
    private func configViews() {
        self.backgroundColor = UIColor.init(red: 0.84, green: 0.84, blue: 0.84, alpha: 0.6)
        self.layer.cornerRadius = 32.5
        self.layer.masksToBounds = true
        self.addSubview(self.toolsStackView)
        self.addSubview(self.pencilView)
        self.addSubview(self.addView)
        
        self.copybookStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapCopybook)))
        self.historyStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapHistory)))
        self.settingStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapSetting)))
        
        self.addView.centerYAnchor == self.centerYAnchor
        self.addView.rightAnchor == self.rightAnchor - 24
        self.pencilView.rightAnchor == self.addView.leftAnchor - 19
        self.pencilView.centerYAnchor == self.centerYAnchor
        self.toolsStackView.centerYAnchor == self.centerYAnchor
        self.toolsStackView.leftAnchor == self.leftAnchor + 24
    }
    
    @objc private func didTapCopybook() {
        self.configToolsColor(type: .copybook)
        self.hasToolsShowed(true)
        self.copybookCallback?()
    }
    
    @objc private func didTapHistory() {
        self.configToolsColor(type: .history)
        self.hasToolsShowed(false)
        self.historyCallback?()
    }
    
    @objc private func didTapSetting() {
        self.configToolsColor(type: .setting)
        self.hasToolsShowed(false)
        self.settingCallback?()
    }
    
    private func configToolColor(stackView: UIStackView, color: UIColor) {
        stackView.arrangedSubviews.forEach { subview in
            guard let subview = subview as? UIImageView else { return }
            let image = subview.image?.withTintColor(color)
            subview.image = image
        }
    }
    
    private func configToolsColor(type: ToolsColorType) {
        switch type {
        case .empty:
            self.configToolColor(stackView: self.copybookStackView, color: gColorNotSelected)
            self.configToolColor(stackView: self.historyStackView, color: gColorNotSelected)
            self.configToolColor(stackView: self.settingStackView, color: gColorNotSelected)
        case .copybook:
            self.configToolColor(stackView: self.copybookStackView, color: gColorSelected)
            self.configToolColor(stackView: self.historyStackView, color: gColorNotSelected)
            self.configToolColor(stackView: self.settingStackView, color: gColorNotSelected)
        case .history:
            self.configToolColor(stackView: self.copybookStackView, color: gColorNotSelected)
            self.configToolColor(stackView: self.historyStackView, color: gColorSelected)
            self.configToolColor(stackView: self.settingStackView, color: gColorNotSelected)
        case .setting:
            self.configToolColor(stackView: self.copybookStackView, color: gColorNotSelected)
            self.configToolColor(stackView: self.historyStackView, color: gColorNotSelected)
            self.configToolColor(stackView: self.settingStackView, color: gColorSelected)
        }
    }
    
    private func hasToolsShowed(_ ToolsFromCopybook: Bool) {
        self.pencilView.isHidden = ToolsFromCopybook ? false : true
        self.addView.isHidden = ToolsFromCopybook ? false : true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
