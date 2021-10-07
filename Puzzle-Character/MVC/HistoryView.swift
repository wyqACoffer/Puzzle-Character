//
//  HistoryView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/9/24.
//




import Anchorage
import UIKit

class HistoryView: UIView {
    private var fontView = UIImageView(image: UIImage(named: "字体"))
    private var writeToolView = UIImageView(image: UIImage(named: "书写工具"))
    private lazy var stackView = UIStackView(arrangedSubviews: [self.fontView, self.writeToolView])
    var fontViewCallback: Block?
    var writeToolViewCallback: Block?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    private func configViews() {
        self.addSubview(self.stackView)
        self.stackView.axis = .horizontal
        self.stackView.alignment = .bottom
        self.stackView.distribution = .equalSpacing
        self.stackView.spacing = 182
        self.stackView.edgeAnchors == self.edgeAnchors
        self.isHidden = true
        self.fontView.isUserInteractionEnabled = true
        self.fontView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapFontView)))
        self.writeToolView.isUserInteractionEnabled = true
        self.writeToolView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapWriteToolView)))
    }
    
    @objc private func didTapFontView() {
        self.fontViewCallback?()
    }
    
    @objc private func didTapWriteToolView() {
        self.writeToolViewCallback?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
