//
//  WritePensView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit

class WritePensView: UIView {
    private var pensBGView = UIImageView(image: UIImage(named: "笔迹选择框"))
    
    private var pen1 = UIImageView(image: UIImage(named: "笔刷1未选中"))
    private var pen2 = UIImageView(image: UIImage(named: "笔刷2未选中"))
    private var pen3 = UIImageView(image: UIImage(named: "笔刷3未选中"))
    private var eraser = UIImageView(image: UIImage(named: "橡皮未选中"))
    
    private var isPen1Selected = false
    private var isPen2Selected = false
    private var isPen3Selected = false
    private var isEraserSelected = false
    
    var callback: ((Int) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        self.addSubview(self.pensBGView)
        self.pensBGView.edgeAnchors == self.edgeAnchors
        
        self.addSubview(self.pen1)
        self.addSubview(self.pen2)
        self.addSubview(self.pen3)
        self.addSubview(self.eraser)
        
        self.pen1.topAnchor == self.pensBGView.topAnchor + 10
        self.pen1.leftAnchor == self.pensBGView.leftAnchor - 10
        
        self.pen2.topAnchor == self.pen1.bottomAnchor + 25
        self.pen2.leftAnchor == self.pensBGView.leftAnchor - 10
        
        self.pen3.topAnchor == self.pen2.bottomAnchor + 25
        self.pen3.leftAnchor == self.pensBGView.leftAnchor - 10
        
        self.eraser.topAnchor == self.pen3.bottomAnchor + 25
        self.eraser.leftAnchor == self.pensBGView.leftAnchor - 10
        
        self.pen1.isUserInteractionEnabled = true
        self.pen1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapPen1)))
        
        self.pen2.isUserInteractionEnabled = true
        self.pen2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapPen2)))
        
        self.pen3.isUserInteractionEnabled = true
        self.pen3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapPen3)))
        
        self.eraser.isUserInteractionEnabled = true
        self.eraser.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapEraser)))
    }
    
    @objc private func didTapPen1() {
        self.isPen1Selected.toggle()
        self.isPen2Selected = false
        self.isPen3Selected = false
        self.isEraserSelected = false
        self.pensAnimation()
        self.callback?(1)
    }
    
    @objc private func didTapPen2() {
        self.isPen2Selected.toggle()
        self.isPen1Selected = false
        self.isPen3Selected = false
        self.isEraserSelected = false
        self.pensAnimation()
        self.callback?(2)
    }
    
    @objc private func didTapPen3() {
        self.isPen3Selected.toggle()
        self.isPen1Selected = false
        self.isPen2Selected = false
        self.isEraserSelected = false
        self.pensAnimation()
        self.callback?(3)
    }
    
    @objc private func didTapEraser() {
        self.isEraserSelected.toggle()
        self.isPen1Selected = false
        self.isPen2Selected = false
        self.isPen3Selected = false
        self.pensAnimation()
        self.callback?(7)
    }
    
    private func pensAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.pen1.image = (self.isPen1Selected == true ? UIImage(named: "笔刷1选中") : UIImage(named: "笔刷1未选中"))
            self.pen2.image = (self.isPen2Selected == true ? UIImage(named: "笔刷2选中") : UIImage(named: "笔刷2未选中"))
            self.pen3.image = (self.isPen3Selected == true ? UIImage(named: "笔刷3选中") : UIImage(named: "笔刷3未选中"))
            self.eraser.image = (self.isEraserSelected == true ? UIImage(named: "橡皮选中") : UIImage(named: "橡皮未选中"))
            self.pen1.transform = CGAffineTransform(translationX: (self.isPen1Selected == true ? 10 : 0), y: 0)
            self.pen2.transform = CGAffineTransform(translationX: (self.isPen2Selected == true ? 10 : 0), y: 0)
            self.pen3.transform = CGAffineTransform(translationX: (self.isPen3Selected == true ? 10 : 0), y: 0)
            self.eraser.transform = CGAffineTransform(translationX: (self.isEraserSelected == true ? 10 : 0), y: 0)
        }, completion: nil)
    }
}
