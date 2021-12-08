//
//  ResultShowView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit

class ResultShowView: UIView {
    private var resultShowView = UIImageView(image: UIImage(named: "效果展示"))
    private var showView = UIImageView(image: UIImage(named: "导出示例"))
    private var exportView = UIImageView(image: UIImage(named: "导出字帖"))
    private var shareView = UIImageView(image: UIImage(named: "分享字帖"))
    
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
    }
    
    @objc private func didTapExportView() {
        UIImageWriteToSavedPhotosAlbum(self.showView.image, self, #selector(save(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    private func save(image:UIImage, didFinishSavingWithError:NSError?,contextInfo:AnyObject) {
         if didFinishSavingWithError != nil {
             SVProgressHUD.showError(withStatus: "保存失败")
             SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
         } else {
             SVProgressHUD.showSuccess(withStatus: "保存成功")
             SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
         }
     }
}
