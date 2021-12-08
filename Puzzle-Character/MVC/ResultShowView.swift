//
//  ResultShowView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit
import SVProgressHUD

class ResultShowView: UIView {
    private var resultShowView = UIImageView(image: UIImage(named: "效果展示"))
    private var showView = UIImageView(image: UIImage(named: "导出示例"))
    private var exportView = UIImageView(image: UIImage(named: "导出字帖"))
    private var shareView = UIImageView(image: UIImage(named: "分享字帖"))
    var exportCallback: ((UIImage) -> ())?
    var shareCallback: ((UIImage) -> ())?
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 200
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        self.addSubview(self.resultShowView)
        self.resultShowView.centerXAnchor == self.centerXAnchor
        self.resultShowView.topAnchor == self.topAnchor
        
        self.addSubview(self.showView)
        self.showView.centerAnchors == self.centerAnchors
        
        self.stackView.addArrangedSubview(self.exportView)
        self.stackView.addArrangedSubview(self.shareView)
        self.addSubview(self.stackView)
        self.stackView.centerXAnchor == self.centerXAnchor
        self.stackView.bottomAnchor == self.bottomAnchor
        
        self.exportView.isUserInteractionEnabled = true
        self.exportView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapExportView)))
        self.shareView.isUserInteractionEnabled = true
        self.shareView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapShareView)))
    }
    
    @objc private func didTapExportView() {
        guard let image = self.showView.image else { return }
        self.exportCallback?(image)
    }
    
    @objc private func didTapShareView() {
        guard let image = self.showView.image else { return }
        self.shareCallback?(image)
    }
}
