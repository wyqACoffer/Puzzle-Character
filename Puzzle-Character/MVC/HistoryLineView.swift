//
//  HistoryLineView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/4.
//

import Anchorage
import UIKit

class HistoryLineView: UIView {
    private var lineView = UIImageView(image: UIImage(named: "历史线"))
    private var fontViews = [FontView]()
    var callback: ((FontNameType) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    private func configViews() {
        self.addSubview(self.lineView)
        self.lineView.edgeAnchors == self.edgeAnchors
        for index in 0...4 {
            self.fontViews.append(FontView(type: gFontNames[index]))
            self.addSubview(self.fontViews[index])
            self.fontViews[index].callback = { [weak self] type in
                guard let self = self else { return }
                self.callback?(type)
            }
        }
        
        self.fontViews[0].topAnchor == self.topAnchor + 177
        self.fontViews[0].leftAnchor == self.leftAnchor + 12
        self.fontViews[1].topAnchor == self.topAnchor + 299
        self.fontViews[1].leftAnchor == self.leftAnchor + 232
        self.fontViews[2].topAnchor == self.topAnchor + 56
        self.fontViews[2].leftAnchor == self.leftAnchor + 546
        self.fontViews[3].topAnchor == self.topAnchor + 431
        self.fontViews[3].leftAnchor == self.leftAnchor + 676
        self.fontViews[4].topAnchor == self.topAnchor + 180
        self.fontViews[4].leftAnchor == self.leftAnchor + 934
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
