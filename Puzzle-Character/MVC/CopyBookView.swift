//
//  CopybookView.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/9/23.
//

import Anchorage
import UIKit

class SingleCopybookView: UICollectionViewCell {
    private var deleteView = UIImageView(image: UIImage(named: "delete"))
    private var mainBGView = UIImageView(image: UIImage(named: "字帖背景"))
    private var textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
        self.setText(text: "我的字帖", num: 0)
    }
    
    private func configViews() {
        self.addSubview(self.mainBGView)
        self.mainBGView.heightAnchor == 250
        self.mainBGView.widthAnchor == 250
        self.mainBGView.centerAnchors == self.centerAnchors
        self.mainBGView.layer.cornerRadius = 4
        self.addSubview(self.deleteView)
        self.deleteView.heightAnchor == 40
        self.deleteView.widthAnchor == 40
        self.deleteView.topAnchor == self.mainBGView.topAnchor - 20
        self.deleteView.rightAnchor == self.mainBGView.rightAnchor + 20
        self.addSubview(self.textLabel)
        self.textLabel.topAnchor == self.mainBGView.bottomAnchor + 8
        self.textLabel.centerXAnchor == self.mainBGView.centerXAnchor
    }
    
    func setText(text: String, num: Int) {
        let text = "我的字帖" + (num < 1 ? "" : "  \(num)")
        self.textLabel.text = text
        self.textLabel.font = .boldSystemFont(ofSize: 15)
        self.textLabel.textColor = gColorSelected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CopybookView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var collectionViewFlowLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 1040, height: 592), collectionViewLayout: self.collectionViewFlowLayout)
    private var scrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        self.scrollView.delegate = self
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.isPagingEnabled = true
        self.addSubview(self.scrollView)
        self.scrollView.widthAnchor == 1040
        self.scrollView.heightAnchor == 592
        self.scrollView.contentSize = CGSize(width: 1022*4, height: 590)
        self.scrollView.edgeAnchors == self.edgeAnchors
        
        self.collectionViewFlowLayout.itemSize = CGSize(width: 320, height: 320)
        self.scrollView.addSubview(self.collectionView)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(SingleCopybookView.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.widthAnchor == 1040
        self.collectionView.heightAnchor == 592
        self.collectionView.edgeAnchors == self.scrollView.edgeAnchors
        self.collectionView.backgroundColor = gColorForBackgroundView
    }
    
    @objc private func pageChanged(_ sender: UIPageControl) {
        var frame = scrollView.frame
        frame.origin.x = 1022 * CGFloat(sender.currentPage)
        frame.origin.y = 0
        self.scrollView.scrollRectToVisible(frame, animated: true)
    }
    
// MARK: - UICollectionView Delegate & Data Source
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView = UIImageView(image: UIImage(named: "导出示例"))
        cell.addSubview(imageView)
        imageView.heightAnchor == 250
        imageView.widthAnchor == 250
        imageView.centerAnchors == cell.centerAnchors
        return cell;
    }
}
