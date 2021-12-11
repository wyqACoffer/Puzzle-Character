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
    private var showView = UIImageView(image: UIImage(named: "导出示例2"))
    private var exportView = UIImageView(image: UIImage(named: "导出字帖"))
    private var shareView = UIImageView(image: UIImage(named: "分享字帖"))
    private var pickView = UIImageView(image: UIImage(named: "字形选择"))
    private var bgView = UIImageView(image: UIImage(named: "选字背景"))
    
    private var c1 = UIImageView(image: UIImage(named: "c1"))
    private var c2 = UIImageView(image: UIImage(named: "c2"))
    private var c3 = UIImageView(image: UIImage(named: "c3"))
    
    private var c = UIImageView(image: UIImage(named: "传1"))
    
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
        self.showView.centerYAnchor == self.centerYAnchor
        self.showView.leftAnchor == self.leftAnchor - 50
        
        self.addSubview(self.pickView)
        self.pickView.topAnchor == self.showView.topAnchor + 20
        self.pickView.leftAnchor == self.showView.rightAnchor + 250
        
        self.addSubview(self.bgView)
        self.bgView.centerXAnchor == self.pickView.centerXAnchor
        self.bgView.topAnchor == self.pickView.bottomAnchor + 40
        
        self.bgView.isUserInteractionEnabled = true
        self.bgView.addSubview(self.c1)
        self.bgView.addSubview(self.c2)
        self.bgView.addSubview(self.c3)
        
        self.showView.addSubview(self.c)
        self.c.centerYAnchor == self.showView.centerYAnchor
        self.c.rightAnchor == self.showView.rightAnchor - 105
        
        self.c1.centerXAnchor == self.bgView.centerXAnchor
        self.c1.topAnchor == self.bgView.topAnchor + 20
        self.c2.centerAnchors == self.bgView.centerAnchors
        self.c3.centerXAnchor == self.bgView.centerXAnchor
        self.c3.bottomAnchor == self.bgView.bottomAnchor - 20
        
        self.c1.isUserInteractionEnabled = true
        self.c2.isUserInteractionEnabled = true
        self.c3.isUserInteractionEnabled = true
        self.c1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapC1)))
        self.c2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapC2)))
        self.c3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapC3)))
        
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
        let image = UIImageView(image: UIImage(named: "导出示例"))
        self.exportCallback?(image.image!)
    }
    
    @objc private func didTapShareView() {
        let image = UIImageView(image: UIImage(named: "导出示例"))
        self.shareCallback?(image.image!)
    }
    
    @objc private func didTapC1() {
        self.c.image = UIImage(named: "传1")
    }
    
    @objc private func didTapC2() {
        self.c.image = UIImage(named: "传2")
    }
    
    @objc private func didTapC3() {
        self.c.image = UIImage(named: "传3")
    }
}
