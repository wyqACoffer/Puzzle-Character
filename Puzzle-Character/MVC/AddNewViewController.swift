//
//  AddNewViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/21.
//

import Anchorage
import UIKit

class AddNewViewController: CustomViewController {
    private var addNewView = AddNewView()
    private var textEditView = TextEditView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }
    
    override func configViews() {
        super.configViews()
        self.isNextViewHidden(false)
        self.view.addSubview(self.addNewView)
        self.addNewView.centerAnchors == self.view.centerAnchors
        self.view.addSubview(self.textEditView)
        self.textEditView.edgeAnchors == self.view.edgeAnchors
        self.textEditView.isHidden = true
    }
    
    override func configCallBack() {
        super.configCallBack()
        self.addNewView.callBack = { [weak self] oldText in
            guard let self = self else { return gPlaceholderText}
            self.didTapTextView()
            return gPlaceholderText
        }
        self.textEditView.callBack = {
            let text = self.textEditView.getText()
            if text != gPlaceholderText {
                self.addNewView.setText(text: text)
            }
            UIView.transition(from: self.textEditView, to: self.addNewView, duration: 0.3, options: .transitionCrossDissolve, completion: nil)
            self.configViews()
        }
        
    }
    
    private func didTapTextView() {
        self.isNextViewHidden(true)
        self.textEditView.isHidden = false
        UIView.transition(from: self.addNewView, to: self.textEditView, duration: 0.3, options: .transitionCrossDissolve, completion: nil)
    }
}
