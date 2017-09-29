//
//  ViewController.swift
//  ProjectFramework
//
//  Created by hcy on 2017/9/29.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    
    /// 图片
    lazy var  Image:UIImageView = {
        let imgWh:CGFloat=80
        let img = UIImageView(frame: CGRect(x: self.view.frame.width/2-imgWh/2, y: 120, width:imgWh, height: imgWh))
        img.image=UIImage.init(named: "realname")
        img.layer.borderColor=UIColor.white.cgColor
        img.layer.borderWidth=0
        img.layer.cornerRadius=imgWh/2
        img.layer.masksToBounds=true
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="关于我们"
        self.view.backgroundColor=CommonFunction.LineColor()
        self.view.addSubview(Image)
        
        let lab1 = UILabel(frame: CGRect(x: 20, y: Image.frame.maxX+50, width: self.view.frame.width-40, height: 20))
        lab1.font=UIFont.systemFont(ofSize: 13)
        lab1.textAlignment = .center
        lab1.text="红彩V1.0"
        
        self.view.addSubview(lab1)
        
        
        let lab2 = UILabel(frame: CGRect(x: 20, y: lab1.frame.maxY+5, width: self.view.frame.width-40, height: 20))
        lab2.font=UIFont.boldSystemFont(ofSize: 13)
        lab2.textAlignment = .center
        lab2.text="0632-3333783"
        lab2.textColor=UIColor.red
        
        self.view.addSubview(lab2)
        
        
        let lab3 = UILabel(frame: CGRect(x: 20, y: lab2.frame.maxY+30, width: self.view.frame.width-40, height: 20))
        lab3.font=UIFont.systemFont(ofSize: 13)
        lab3.textAlignment = .center
        lab3.text="Copyright©枣庄云彩信息科技有限公司"
        lab3.textColor=UIColor.gray
        self.view.addSubview(lab3)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
