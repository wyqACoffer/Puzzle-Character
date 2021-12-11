//
//  SelectPaperView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit

class SelectPaperView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    private var selectPaperView = UIImageView(image: UIImage(named: "选择纸张"))
    private var paperSelecor = UIImageView(image: UIImage(named: "选择框"))
    private var paperLabel = UILabel()
    private var paperView = UIImageView(image: UIImage(named: gPaperPickerNames[0]))
    private var paperExplainView = UIImageView(image: UIImage(named: "\(gPaperPickerNames[0])介绍"))
    private var pickerView = UIPickerView()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 60
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
        self.addSubview(self.selectPaperView)
        self.selectPaperView.centerXAnchor == self.centerXAnchor
        self.selectPaperView.topAnchor == self.topAnchor
        
        self.addSubview(self.paperView)
        self.paperView.centerYAnchor == self.centerYAnchor
        self.paperView.leftAnchor == self.leftAnchor
        self.paperView.layer.shadowColor = UIColor.black.cgColor
        self.paperView.layer.shadowOffset = CGSize(width: -5, height: 5)
        self.paperView.layer.shadowOpacity = 0.7
        
        self.stackView.addArrangedSubview(self.paperSelecor)
        self.stackView.addArrangedSubview(self.paperExplainView)
        self.addSubview(self.stackView)
        self.stackView.centerYAnchor == self.centerYAnchor
        self.stackView.rightAnchor == self.rightAnchor
        
        self.paperSelecor.isUserInteractionEnabled = true
        self.paperSelecor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapPaperSelector)))
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.addSubview(self.pickerView)
        self.pickerView.centerXAnchor == self.centerXAnchor
        self.pickerView.bottomAnchor == self.bottomAnchor + 42
        self.pickerView.widthAnchor == UIScreen.main.bounds.width
        self.pickerView.heightAnchor == 300
        self.pickerView.backgroundColor = UIColor(displayP3Red: 256, green: 256, blue: 256, alpha: 0.97)
        self.pickerView.isHidden = true
        
        self.paperSelecor.addSubview(self.paperLabel)
        self.paperLabel.centerXAnchor == self.paperSelecor.centerXAnchor
        self.paperLabel.centerYAnchor == self.paperSelecor.centerYAnchor - 2
        self.paperLabel.textColor = gColorNotSelected
        self.paperLabel.text = gPaperPickerNames[0]
        self.paperLabel.font = .preferredFont(forTextStyle: .title2, compatibleWith: .current)
    }
    
    @objc private func didTapPaperSelector() {
        self.pickerView.isHidden.toggle()
    }
    
    // MARK: - Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gPaperPickerNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = gColorNotSelected
        label.text = gPaperPickerNames[row]
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .largeTitle, compatibleWith: .current)
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.paperLabel.text = gPaperPickerNames[row]
        self.paperView.image = UIImage(named: gPaperPickerNames[row])
        self.paperExplainView.image = UIImage(named: "\(gPaperPickerNames[row])介绍")
    }
}
