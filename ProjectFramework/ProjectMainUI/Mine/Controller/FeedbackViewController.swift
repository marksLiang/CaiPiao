//
//  ViewController.swift
//  ProjectFramework
//
//  Created by hcy on 2017/9/29.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    ///内容
    lazy var Msg_text:CustomTextView = {
        let view = CustomTextView(frame: CGRect.init(x: 10, y: 5, width: self.view.frame.width-20, height: 180) )
        view.SetPlaceholder("欢迎您提出的建议，请在此写点什么吧？")
        view.SetMaxLength(200)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=CommonFunction.LineColor()
        self.title="用户反馈"
        self.automaticallyAdjustsScrollViewInsets=false // //取消掉被NavigationController管理的自动留白
        self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "提交", style: .done, target: self, action: #selector(post))
        let uview=UIView(frame: CGRect(x: 0, y: 70, width: self.view.frame.width, height: 200))
        uview.backgroundColor=UIColor.white
        
        uview.addSubview(Msg_text)
        self.view.addSubview(uview)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func post(){
        
        if(Msg_text.textview?.text!==""){
            
            CommonFunction.HUD("请输入您要反馈的内容", type: .error)
            return
        }
        
        CommonFunction.HUD("提交成功", type: .success)
        
//        let parameters = ["msg":Msg_text.textview?.text!]
//        let url = "apphome/feedBack"
//        CommonFunction.Global_Get(entity: nil, IsListData: false, url: url, isHUD: true, isHUDMake: false, parameters:  parameters as NSDictionary?, Model: { (result) in
//
//      _ = self.navigationController?.popViewController(animated: true)
//
//        }, ModelNoAnalysis: nil)
        
    
        
    }
    
}
