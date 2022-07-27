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
    private var personSelecor = UIImageView(image: UIImage(named: "选择框"))
    
    private var fontLabel = UILabel()
    private var fontView = UIImageView(image: UIImage(named: gPickerNames[0][0] + "图"))
    
    private var personLabel = UILabel()
    private var personView = UIImageView(image: UIImage(named: gPickerNames[0][0]))
    
    private var pickerView = UIPickerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        self.addSubview(self.selectFontView)
        self.selectFontView.centerXAnchor == self.centerXAnchor
        self.selectFontView.topAnchor == self.topAnchor + 10
        
        self.addSubview(self.fontSelecor)
        self.fontSelecor.topAnchor == self.selectFontView.bottomAnchor + 40
        self.fontSelecor.leftAnchor == self.leftAnchor
        
        self.addSubview(self.personSelecor)
        self.personSelecor.topAnchor == self.selectFontView.bottomAnchor + 40
        self.personSelecor.rightAnchor == self.rightAnchor - 10
        
        self.addSubview(self.fontView)
        self.fontView.centerXAnchor == self.fontSelecor.centerXAnchor
        self.fontView.topAnchor == self.fontSelecor.bottomAnchor + 40
        
        self.addSubview(self.personView)
        self.personView.centerXAnchor == self.personSelecor.centerXAnchor
        self.personView.centerYAnchor == self.fontView.centerYAnchor
        
        self.fontSelecor.isUserInteractionEnabled = true
        self.fontSelecor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapFontSelector)))
        
        self.personSelecor.isUserInteractionEnabled = true
        self.personSelecor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapPersonSelector)))
        
        self.fontView.layer.shadowColor = UIColor.black.cgColor
        self.fontView.layer.shadowOffset = CGSize(width: -5, height: 5)
        self.fontView.layer.shadowOpacity = 0.7
        
        self.personView.layer.shadowColor = UIColor.black.cgColor
        self.personView.layer.shadowOffset = CGSize(width: -5, height: 5)
        self.personView.layer.shadowOpacity = 0.7
        
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
        
        self.personSelecor.addSubview(self.personLabel)
        self.personLabel.centerXAnchor == self.personSelecor.centerXAnchor - 10
        self.personLabel.centerYAnchor == self.personSelecor.centerYAnchor - 2
        self.personLabel.textColor = gColorNotSelected
        self.personLabel.text = gPickerNames[0][0]
        self.personLabel.font = .preferredFont(forTextStyle: .title2, compatibleWith: .current)
    }
    
    @objc private func didTapFontSelector() {
        self.pickerView.isHidden.toggle()
    }
    
    @objc private func didTapPersonSelector() {
        self.pickerView.isHidden.toggle()
    }
    
    // MARK: - Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return gPickerNames.count
        } else {
            let number = self.pickerView.selectedRow(inComponent: 0)
            print(number)
            return gPickerNames[number].count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = gColorNotSelected
        if component == 0 {
            label.text = gFontPickerNames[row]
        } else {
            let number = self.pickerView.selectedRow(inComponent: 0)
            label.text = gPickerNames[number][row]
        }
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .largeTitle, compatibleWith: .current)
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            self.fontLabel.text = gFontPickerNames[row]
            self.personLabel.text = gPickerNames[row][0]
            self.fontView.image = UIImage(named: gPickerNames[row][0] + "图")
            self.personView.image = UIImage(named: gPickerNames[row][0])
            self.pickerView.reloadAllComponents()
        } else {
            let number = self.pickerView.selectedRow(inComponent: 0)
            self.personView.image = UIImage(named: gPickerNames[number][row])
        }
    }
}
