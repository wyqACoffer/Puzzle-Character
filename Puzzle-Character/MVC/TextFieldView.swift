//
//  TextFieldView.swift
//  Puzzle-Character
//
//  Created by Meisi Fu on 2021/9/24.
//

import Anchorage
import UIKit

class TextFieldView: UIView{
    private var textBgView = UIImageView(image: UIImage(named:"文本输入框"))
    private var textFieldView: UITextView = {
            let textView: UITextView = UITextView() //初始化
            textView.text = "请在此输入文本" //给UITextView赋值普通文本
            textView.attributedText = NSAttributedString(string: "") //赋值富文本
            textView.font = UIFont.systemFont(ofSize: 18)   //设置字体
            textView.textColor = UIColor.black  //设置颜色
            textView.backgroundColor = UIColor.clear
            textView.textAlignment = .justified     //设置文本对齐方式
            //设置内容区域的内边距，默认为（8， 0， 8， 0）
            textView.textContainerInset = UIEdgeInsets(top: 8, left: 50, bottom: 8, right: 50)
            textView.usesStandardTextScaling = true
            textView.isEditable = true     //是否可以编辑
            textView.isSelectable = true    //文本是否可选
            textView.scrollRangeToVisible(NSMakeRange(0, 10))    //滚动到指定的范围，使之可见
            textView.allowsEditingTextAttributes = false    //是否允许编辑选中文本的样式，默认为false
            textView.clearsOnInsertion = true   //新编辑的文本是否会替换之前的文本
            return textView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        self.addSubview(textBgView)
        self.addSubview(textFieldView)
        self.textFieldView.heightAnchor == 330
        self.textFieldView.widthAnchor == 600
        self.textFieldView.centerAnchors == self.textBgView.centerAnchors
    }
}
