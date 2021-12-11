//
//  ResultShowViewController.swift
//  Puzzle-Character
//
//  Created by Acoffer on 2021/12/8.
//

import Anchorage
import UIKit

class ResultShowViewController: CustomViewController {
    private var resultShowView = ResultShowView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }
    
    override func configViews() {
        super.configViews()
        self.isNextViewHidden(false)
        
        self.view.addSubview(self.resultShowView)
        self.resultShowView.heightAnchor == 750
        self.resultShowView.widthAnchor == 900
        self.resultShowView.centerAnchors == self.view.centerAnchors
    }
    
    override func configCallBack() {
        super.configCallBack()
        self.nextView.callback = {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(identifier: "WriteWorkViewController") as WriteWorkViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        self.resultShowView.exportCallback = { [weak self] image in
            guard let self = self else  { return }
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.save(image:didFinishSavingWithError:contextInfo:)), nil)
        }
        
        self.resultShowView.shareCallback = { [weak self] image in
            guard let self = self else  { return }
            let items: [AnyObject] = [image as AnyObject]
            let activity = UIActivityViewController(activityItems: items, applicationActivities: nil)
            activity.popoverPresentationController!.sourceView = self.resultShowView;
            self.present(activity, animated: true, completion: nil)
        }
    }
    
    @objc func save(image:UIImage, didFinishSavingWithError:NSError?,contextInfo:AnyObject) {
         if didFinishSavingWithError != nil {
             let alert = UIAlertController(title: "操作", message: "保存失败", preferredStyle: .alert)
             let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
             alert.addAction(alertAction)
             self.present(alert, animated: true, completion: nil)
         } else {
             let alert = UIAlertController(title: "操作", message: "保存成功", preferredStyle: .alert)
             let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
             alert.addAction(alertAction)
             self.present(alert, animated: true, completion: nil)
         }
     }
}
