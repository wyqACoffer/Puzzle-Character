//
//  SelectFontView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/7.
//

import Anchorage
import UIKit

class SelectFontView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    private var selectFontView = UIImageView(image: UIImage(named: "选择字体"))
    private var fontSelecor = UIImageView(image: UIImage(named: "选择框"))
    private var fontLabel = UILabel()
    private var fontView = UIImageView(image: UIImage(named: gFontPickerNames[0]))
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
        self.stackView.addArrangedSubview(self.selectFontView)
        self.stackView.addArrangedSubview(self.fontSelecor)
        self.stackView.addArrangedSubview(self.fontView)
        self.addSubview(self.stackView)
        self.stackView.centerAnchors == self.centerAnchors
        self.fontSelecor.isUserInteractionEnabled = true
        self.fontSelecor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapFontSelector)))
        
        self.fontView.layer.shadowColor = UIColor.black.cgColor
        self.fontView.layer.shadowOffset = CGSize(width: -5, height: 5)
        self.fontView.layer.shadowOpacity = 0.7
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.addSubview(self.pickerView)
        self.pickerView.centerXAnchor == self.centerXAnchor
        self.pickerView.bottomAnchor == self.bottomAnchor + 42
        self.pickerView.widthAnchor == UIScreen.main.bounds.width
        self.pickerView.heightAnchor == 300
        self.pickerView.backgroundColor = UIColor(displayP3Red: 256, green: 256, blue: 256, alpha: 0.97)
        self.pickerView.isHidden = true
        
        self.fontSelecor.addSubview(self.fontLabel)
        self.fontLabel.centerXAnchor == self.fontSelecor.centerXAnchor - 10
        self.fontLabel.centerYAnchor == self.fontSelecor.centerYAnchor - 2
        self.fontLabel.textColor = gColorNotSelected
        self.fontLabel.text = gFontPickerNames[0]
        self.fontLabel.font = .preferredFont(forTextStyle: .title2, compatibleWith: .current)
    }
    
    @objc private func didTapFontSelector() {
        self.pickerView.isHidden.toggle()
    }
    
    // MARK: - Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gFontPickerNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = gColorNotSelected
        label.text = gFontPickerNames[row]
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .largeTitle, compatibleWith: .current)
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.fontLabel.text = gFontPickerNames[row]
        self.fontView.image = UIImage(named: gFontPickerNames[row])
    }
}
