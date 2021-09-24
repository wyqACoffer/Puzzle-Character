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
    var copybookCallBack: Block?
    var historyCallBack: Block?
    var settingCallBack: Block?
    // Todo
    private var copybookView = UIImageView(image: UIImage(named: "字帖示例"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
        copybookTap()
    }
    
    private func configViews() {
        self.backgroundColor = UIColor.init(red: 0.84, green: 0.84, blue: 0.84, alpha: 0.6)
        self.layer.cornerRadius = 32.5
        self.layer.masksToBounds = true
        self.addSubview(self.toolsStackView)
        self.addSubview(self.pencilView)
        self.addSubview(self.addView)
        
        self.copybookStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(copybookTap)))
        self.historyStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(historyTap)))
        self.settingStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(settingTap)))
        
        self.addView.centerYAnchor == self.centerYAnchor
        self.addView.rightAnchor == self.rightAnchor - 24
        self.pencilView.rightAnchor == self.addView.leftAnchor - 19
        self.pencilView.centerYAnchor == self.centerYAnchor
        self.toolsStackView.centerYAnchor == self.centerYAnchor
        self.toolsStackView.leftAnchor == self.leftAnchor + 24
    }
    
    @objc private func copybookTap() {
        self.configToolsColor(type: .copybook)
        self.hasToolsShowed(true)
        self.copybookCallBack?()
    }
    
    @objc private func historyTap() {
        self.configToolsColor(type: .history)
        self.hasToolsShowed(false)
        self.historyCallBack?()
    }
    
    @objc private func settingTap() {
        self.configToolsColor(type: .setting)
        self.hasToolsShowed(false)
        self.settingCallBack?()
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
            configToolColor(stackView: self.copybookStackView, color: colorNotSelected)
            configToolColor(stackView: self.historyStackView, color: colorNotSelected)
            configToolColor(stackView: self.settingStackView, color: colorNotSelected)
        case .copybook:
            configToolColor(stackView: self.copybookStackView, color: colorSelected)
            configToolColor(stackView: self.historyStackView, color: colorNotSelected)
            configToolColor(stackView: self.settingStackView, color: colorNotSelected)
        case .history:
            configToolColor(stackView: self.copybookStackView, color: colorNotSelected)
            configToolColor(stackView: self.historyStackView, color: colorSelected)
            configToolColor(stackView: self.settingStackView, color: colorNotSelected)
        case .setting:
            configToolColor(stackView: self.copybookStackView, color: colorNotSelected)
            configToolColor(stackView: self.historyStackView, color: colorNotSelected)
            configToolColor(stackView: self.settingStackView, color: colorSelected)
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
