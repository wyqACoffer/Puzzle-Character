//
//  WriteToolsView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/10/18.
//

import Anchorage
import UIKit

class WriteToolsView: UIView, UIScrollViewDelegate {
    private var scrollView = UIScrollView()
    private var pageControl = UIPageControl()
    private var detailViewNames = ["笔", "墨", "纸", "砚"]
    private var detailViews = [UIImageView]()
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    func configViews() {
        self.scrollView.delegate = self
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.isPagingEnabled = true
        self.scrollView.widthAnchor == 1022
        self.scrollView.heightAnchor == 590
        self.scrollView.contentSize = CGSize(width: 1022*4, height: 590)
        for (index, item) in self.detailViewNames.enumerated() {
            let imageView = UIImageView(image: UIImage(named: item))
            self.detailViews.append(imageView)
            self.scrollView.addSubview(self.detailViews[index])
            self.detailViews[index].centerYAnchor == self.scrollView.centerYAnchor
            self.detailViews[index].centerXAnchor == self.scrollView.centerXAnchor + Float(1022 * index)
        }
        self.pageControl.numberOfPages = 4
        self.pageControl.currentPage = 0
        self.pageControl.pageIndicatorTintColor = gColorNotSelected
        self.pageControl.currentPageIndicatorTintColor = gColorSelected
        self.pageControl.addTarget(self, action: #selector(pageChanged(_:)), for: .valueChanged)
        
        self.stackView.addArrangedSubview(self.scrollView)
        self.stackView.addArrangedSubview(self.pageControl)
        self.addSubview(self.stackView)
        self.centerAnchors == self.centerAnchors
        self.stackView.edgeAnchors == self.edgeAnchors
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(self.scrollView.contentOffset.x / self.scrollView.frame.width)
        self.pageControl.currentPage = Int(pageNumber)
    }
    
    @objc private func pageChanged(_ sender: UIPageControl) {
        var frame = scrollView.frame
        frame.origin.x = 1022 * CGFloat(sender.currentPage)
        frame.origin.y = 0
        self.scrollView.scrollRectToVisible(frame, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


