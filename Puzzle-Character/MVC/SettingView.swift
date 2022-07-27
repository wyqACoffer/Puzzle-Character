//
//  SettingView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/11.
//

import Anchorage
import UIKit

class SettingView: UIView {
    private var detailViews = [UIImageView]()
    private var detailNames = ["云端管理", "版本信息", "关于我们"]
    private var avatarView = UIImageView(image: UIImage(named: "logo"))
    private var lineView = UIImageView(image: UIImage(named: "设置分割线"))
    var callBack: ((String)->())?
    
    private var detailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 6
        return stackView
    }()

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 71
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    private func configViews() {
        for i in 0...2 {
            let imageView = UIImageView(image: UIImage(named: detailNames[i]))
            imageView.isUserInteractionEnabled = true
            self.detailViews.append(imageView)
            self.detailStackView.addArrangedSubview(self.detailViews[i])
        }
        self.detailViews[0].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapDatailView0)))
        self.detailViews[1].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapDatailView1)))
        self.detailViews[2].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapDatailView2)))

        self.stackView.addArrangedSubview(self.avatarView)
        self.stackView.addArrangedSubview(self.lineView)
        self.stackView.addArrangedSubview(self.detailStackView)
        self.addSubview(self.stackView)
        self.stackView.centerAnchors == self.centerAnchors
        self.stackView.edgeAnchors == self.edgeAnchors
        self.isHidden = true
    }
    
    @objc private func didTapDatailView0() {
        self.callBack?("云端管理")
    }
    
    @objc private func didTapDatailView1() {
        self.callBack?("版本信息")
    }
    
    @objc private func didTapDatailView2() {
        self.callBack?("关于我们")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
