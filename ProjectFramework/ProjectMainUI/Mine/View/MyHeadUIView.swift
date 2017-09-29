//
//  MyHeadUIView.swift
//  ProjectFramework
//
//  Created by hcy on 2017/9/29.
//  Copyright © 2017年 HCY. All rights reserved.
//

import Foundation
class MyHeadUIView: UIView {
    
    ///图片
    lazy var ImageBtn:UIButton = {
        
        let imgWh:CGFloat=90
        let btn = UIButton(frame: CGRect(x: self.bounds.width/2-imgWh/2, y: 40, width:imgWh, height: imgWh))
        btn.setImage(UIImage.init(named: "userIcon_defualt"), for: .normal)
        btn.layer.borderColor=UIColor.white.cgColor
        btn.layer.borderWidth=4
        btn.layer.cornerRadius=imgWh/2
        btn.layer.masksToBounds=true
        return btn
    }()
    
    ///文字
    lazy var Nametext:UILabel = {
        
        let lab=UILabel(frame: CGRect(x: self.bounds.width/2-100/2, y: self.ImageBtn.frame.maxY+5, width: 100, height: 20))
        lab.text="有钱就是任性"
        lab.contentMode = .center
        lab.textColor=UIColor.white
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 13)
        return lab
    }()
    
    ///登录 按钮
    lazy var loginbtn:UIButton = {
        
        let btn = UIButton(frame: CGRect(x: 20, y: self.Nametext.frame.maxY+10, width: self.bounds.width/2-30, height: 30))
        btn.backgroundColor=UIColor(red: 255/255, green: 193/255, blue: 37/255, alpha: 1)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle(  "登  录",   for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.layer.cornerRadius=4
        btn.layer.masksToBounds=true
        return btn
    }()
    
    ///注册 按钮
    lazy var registerbtn:UIButton = {
        
        let btn = UIButton(frame: CGRect(x: self.loginbtn.frame.maxX+20, y: self.Nametext.frame.maxY+10, width: self.bounds.width/2-30, height: 30))
        btn.backgroundColor=UIColor(red: 92/255, green: 190/255, blue: 255/255, alpha: 1)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle(  "注  册",   for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.layer.cornerRadius=4
        btn.layer.masksToBounds=true
        return btn
    }()
    
    
    func Show(tableHeaderView:UITableView,target:UIViewController,ViewHeight:CGFloat,imgSelector:Selector,loginSelector:Selector,registerSelector:Selector) -> UIView{
        
        self.frame=CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(UIScreen.main.bounds.size.width), height: ViewHeight)
        self.backgroundColor = CommonFunction.SystemColor()  //红色背景
        tableHeaderView.tableHeaderView = self
        self.addSubview(ImageBtn)    //添加图片
        self.addSubview(Nametext)    //添加文字
        self.addSubview(loginbtn)    //添加登录按钮
        self.addSubview(registerbtn)    //添加注册按钮
        ImageBtn.addTarget(target, action: imgSelector, for: .touchUpInside)
        loginbtn.addTarget(target, action: loginSelector, for: .touchUpInside)
        registerbtn.addTarget(target, action: registerSelector, for: .touchUpInside)
        return self
    }
    
    
    
}
