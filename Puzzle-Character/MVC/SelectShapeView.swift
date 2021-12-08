//
//  SelectShapeView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit

class SelectShapeView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    private var selectShapeView = UIImageView(image: UIImage(named: "选择形制"))
    private var shapeSelecor = UIImageView(image: UIImage(named: "选择框"))
    private var shapeLabel = UILabel()
    private var shapeView = UIImageView(image: UIImage(named: gShapePickerNames[0]))
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
        self.stackView.addArrangedSubview(self.selectShapeView)
        self.stackView.addArrangedSubview(self.shapeSelecor)
        self.stackView.addArrangedSubview(self.shapeView)
        self.addSubview(self.stackView)
        self.stackView.centerAnchors == self.centerAnchors
        self.shapeSelecor.isUserInteractionEnabled = true
        self.shapeSelecor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapShapeSelector)))
        
        self.shapeView.layer.shadowColor = UIColor.black.cgColor
        self.shapeView.layer.shadowOffset = CGSize(width: -5, height: 5)
        self.shapeView.layer.shadowOpacity = 0.7
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.addSubview(self.pickerView)
        self.pickerView.centerXAnchor == self.centerXAnchor
        self.pickerView.bottomAnchor == self.bottomAnchor + 42
        self.pickerView.widthAnchor == UIScreen.main.bounds.width
        self.pickerView.heightAnchor == 300
        self.pickerView.backgroundColor = UIColor(displayP3Red: 256, green: 256, blue: 256, alpha: 0.97)
        self.pickerView.isHidden = true
        
        self.shapeSelecor.addSubview(self.shapeLabel)
        self.shapeLabel.centerXAnchor == self.shapeSelecor.centerXAnchor - 10
        self.shapeLabel.centerYAnchor == self.shapeSelecor.centerYAnchor - 2
        self.shapeLabel.textColor = gColorNotSelected
        self.shapeLabel.text = gShapePickerNames[0]
        self.shapeLabel.font = .preferredFont(forTextStyle: .title2, compatibleWith: .current)
    }
    
    @objc private func didTapShapeSelector() {
        self.pickerView.isHidden.toggle()
    }
    
    // MARK: - Delegate & DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gShapePickerNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = gColorNotSelected
        label.text = gShapePickerNames[row]
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .largeTitle, compatibleWith: .current)
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.shapeLabel.text = gShapePickerNames[row]
        self.shapeView.image = UIImage(named: gShapePickerNames[row])
    }
}
