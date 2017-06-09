//
//  ViewController.swift
//  PPCardViewSwift
//
//  Created by boob on 2017/6/9.
//  Copyright © 2017年 YY.COM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cardView:PPCardView!
    var contentView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = self.view.bounds //CGRect(x: 0, y: 0, width: 100, height: 100)
        let cardview = PPCardView.init(frame: rect)
        
        let view = UIImageView.init();
        view.backgroundColor = UIColor.green;
        cardview.contentView = view;
        self.cardView = cardview;
        self.contentView = view;
        
        cardview.showInView(view: self.view)
        
        self.changeImage(AnyClass.self)
        self.view.sendSubview(toBack: self.cardView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeImage(_ sender: Any) {
        let idx = arc4random()%13 + 1
        let img = UIImage.init(named: String(idx))
        self.contentView.image = img
        self.cardView.bgImage = img
    }
    
    @IBAction func hiddleTap(_ sender: UIButton) {
        
        if sender.isSelected {
            self.cardView.showInView(view: self.view)
            self.view.sendSubview(toBack: self.cardView);
        }else{
            self.cardView.hide()
        }
        sender.isSelected = !sender.isSelected
    }
 
    @IBAction func reloadaction(_ sender: Any) {
        self.cardView.showInView(view: self.view);
        self.view.sendSubview(toBack: self.cardView);
    }
}

