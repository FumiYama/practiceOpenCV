//
//  ViewController.swift
//  practiceOpenCV
//
//  Created by Fumiya Yamanaka on 2016/01/10.
//  Copyright © 2016年 Fumiya Yamanaka. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var iv_imageView: UIImageView!
    var eb_edgeButton: UIButton = UIButton()
    var image: UIImage!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sh_screenHeight = self.view.frame.size.height
        let sw_screenWidth = self.view.frame.size.width
        
        image = UIImage(named: "qqq.jpg")
        
        iv_imageView = UIImageView(frame: CGRectMake(0, 0, sw_screenWidth, sh_screenHeight-100))
        iv_imageView.image = image
        iv_imageView.contentMode = UIViewContentMode.ScaleAspectFit
        iv_imageView.layer.position = CGPointMake(sw_screenWidth/2, 100)
        self.view.addSubview(iv_imageView)
        
        self.eb_edgeButton.frame = CGRectMake(0, 0, 100, 100)
        self.eb_edgeButton.setTitle("輪郭カット", forState: .Normal)
        self.eb_edgeButton.setTitleColor(UIColor.purpleColor(), forState: UIControlState.Normal)
        self.eb_edgeButton.layer.position = CGPoint(x: sw_screenWidth/2, y: sh_screenHeight-100)
        self.eb_edgeButton.addTarget(self, action: "onClickEdgeButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.eb_edgeButton)
      
        
    }
    
    func onClickEdgeButton(sender: UIButton) {
        image = iv_imageView.image
        
        let edge = practiceOpenCV.DetectEdgeWithImage(image);
        
        iv_imageView.image = edge as UIImage
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

