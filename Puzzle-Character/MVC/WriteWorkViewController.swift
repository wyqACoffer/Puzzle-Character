//
//  WriteWorkViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit
import MaLiang
import Comet
import Chrysan
import Zip

class WriteWorkViewController: CustomViewController {
    private var writePensView = WritePensView()
    private var workViewImage = UIImageView(image: UIImage(named: "临摹"))
    private var bgViewStartCenter = CGPoint.zero
    private var brushes: [Brush] = []
    private var sizeSlider = UISlider()
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var canvas: Canvas!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
        self.registerBrushes()
    }
    
    override func viewDidLayoutSubviews() {
        self.bgView.layer.masksToBounds = true
        self.writePensView.layer.masksToBounds = true
    }
    
    override func configViews() {
        super.configViews()
        self.isNextViewHidden(true)
        
        self.view.addSubview(self.writePensView)
        self.writePensView.widthAnchor == 174
        self.writePensView.heightAnchor == 290
        self.writePensView.centerYAnchor == self.view.centerYAnchor
        self.writePensView.leftAnchor == self.view.leftAnchor - 30
        
        self.bgView.backgroundColor = .clear
        self.bgView.addSubview(self.workViewImage)
        self.bgView.bringSubviewToFront(self.canvas)
        self.workViewImage.centerAnchors == self.canvas.centerAnchors
        self.bgView.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(self.bgViewRotation(rotation:))))
        self.bgView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(bgViewPinch(pinch:))))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.bgViewPan(pan:)))
        pan.minimumNumberOfTouches = 2
        self.bgView.addGestureRecognizer(pan)
        
        self.canvas.isPencilMode = true
        
        self.view.addSubview(self.sizeSlider)
        self.sizeSlider.transform = CGAffineTransform(rotationAngle: .pi * 0.5);
        self.sizeSlider.centerYAnchor == self.view.centerYAnchor
        self.sizeSlider.rightAnchor == self.view.rightAnchor + 150
        self.sizeSlider.heightAnchor == 60
        self.sizeSlider.widthAnchor == 400
        self.sizeSlider.setValue(0, animated: true)
        self.sizeSlider.backgroundColor = gColorForBackgroundView
        self.sizeSlider.setThumbImage(UIImage(named: "调节按钮"), for: .normal)
        self.sizeSlider.setMinimumTrackImage(UIImage(named: "调节按钮小"), for: .normal)
        self.sizeSlider.minimumValueImage = UIImage(named: "调节按钮小")
        self.sizeSlider.maximumValueImage = UIImage(named: "调节按钮大")
        self.sizeSlider.addTarget(self, action: #selector(self.sliderDidchange(slider:)), for: .valueChanged)
    }
     
    @objc private func sliderDidchange(slider: UISlider){
        let size = Int(slider.value)
        self.canvas.currentBrush.pointSize = CGFloat(size)
    }
    
    private func setSizeSlider() {
        self.sizeSlider.minimumValue = Float(self.canvas.currentBrush.pointSize - 20)
        self.sizeSlider.maximumValue = Float(self.canvas.currentBrush.pointSize + 20)
        self.sizeSlider.setValue(Float(self.canvas.currentBrush.pointSize), animated: false)
    }
    
    override func configCallBack() {
        super.configCallBack()
        self.writePensView.callback = { [weak self] number in
            guard let self = self else { return }
            self.brushes[number - 1].use()
            self.setSizeSlider()
        }
    }
    
    private func registerBrush(with imageName: String) -> Brush? {
        let path = Bundle.main.path(forResource: imageName, ofType: "png")!
        return try? self.canvas.registerBrush(from: URL(fileURLWithPath: path))
    }

    private func registerBrushes() {
        let pen1A = self.registerBrush(with: "笔迹1")!
        pen1A.rotation = .random
        pen1A.opacity = 1
        pen1A.pointSize = 13
        pen1A.pointStep = 0.1
        pen1A.forceSensitive = 0.7
        pen1A.forceOnTap = 0.5
        pen1A.color = .black
        
        let pen2A = self.registerBrush(with: "笔迹2")!
        pen2A.rotation = .random
        pen2A.opacity = 1
        pen2A.pointSize = 12
        pen2A.pointStep = 0.1
        pen2A.forceSensitive = 0.75
        pen2A.forceOnTap = 0.5
        pen2A.color = .black
        
        let pen3A = self.registerBrush(with: "笔迹3")!
        pen3A.rotation = .random
        pen3A.opacity = 1
        pen3A.pointSize = 15
        pen3A.pointStep = 0.1
        pen3A.forceSensitive = 0.7
        pen3A.forceOnTap = 0.1
        pen3A.color = .black
        
        let pen1B = self.registerBrush(with: "笔迹1")!
        pen1B.rotation = .random
        pen1B.opacity = 1
        pen1B.pointSize = 13
        pen1B.pointStep = 0.02
        pen1B.forceSensitive = 0.7
        pen1B.forceOnTap = 0.5
        pen1B.color = .black
        
        let pen2B = self.registerBrush(with: "笔迹2")!
        pen2B.rotation = .random
        pen2B.opacity = 1
        pen2B.pointSize = 12
        pen2B.pointStep = 0.02
        pen2B.forceSensitive = 0.75
        pen2B.forceOnTap = 0.5
        pen2B.color = .black
        
        let pen3B = self.registerBrush(with: "笔迹3")!
        pen3B.rotation = .random
        pen3B.opacity = 1
        pen3B.pointSize = 15
        pen3B.pointStep = 0.02
        pen3B.forceSensitive = 0.7
        pen3B.forceOnTap = 0.2
        pen3B.color = .black
        
        let eraser = try! canvas.registerBrush(name: "Eraser") as Eraser
        eraser.opacity = 1
        eraser.use()
        
        brushes = [pen1A, pen2A, pen3A, pen1B, pen2B, pen3B, eraser]
    }
    
    @objc private func bgViewRotation(rotation: UIRotationGestureRecognizer) {
        if rotation.state == .began || rotation.state == .changed {
            self.bgView.transform = self.bgView.transform.rotated(by: rotation.rotation)
            rotation.rotation = 0.0
        }
    }

    @objc func bgViewPan(pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: self.view)
        if pan.state == .began {
            bgViewStartCenter = self.bgView.center
        }
        if pan.state == .ended {
            print("ended")
        }
        if pan.state != .cancelled {
            self.bgView.center = CGPoint(x: bgViewStartCenter.x + translation.x, y: bgViewStartCenter.y + translation.y)
        } else {
            self.bgView.center = bgViewStartCenter
        }
    }

    @objc func bgViewPinch(pinch: UIPinchGestureRecognizer) {
        if pinch.state == .began || pinch.state == .changed {
            self.bgView.transform = self.bgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
            pinch.scale = 1.0
        }
    }
}
