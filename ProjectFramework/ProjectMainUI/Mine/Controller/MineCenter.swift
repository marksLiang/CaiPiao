//
//  MineCenter.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

import SDWebImage




class MineCenter:UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    let identifier="MyCell"
    let ViewHeight:CGFloat=210  //头部试图高度
    
    
    ///UITableView
    lazy var tableView:UITableView = {
        var _frame=self.view.frame
        _frame.origin.y -= 20
        _frame.size.height += 20
        let tabview=UITableView(frame: _frame, style: .grouped)
        tabview.delegate=self //设置代理
        tabview.dataSource=self
        tabview.showsVerticalScrollIndicator = false
        tabview.tableFooterView=UIView() //去除多余底部线条
        return tabview
    }()
    
    var _MyHeadUIView:Any?=nil
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.separatorStyle = .singleLine
        tableView.sectionHeaderHeight=10
        tableView.sectionFooterHeight=0.01
        tableView.register(MyCell.self, forCellReuseIdentifier: identifier)
        self.view.addSubview(tableView)
        _MyHeadUIView = MyHeadUIView().Show(tableHeaderView: tableView, target: self, ViewHeight: ViewHeight,imgSelector: #selector(UserInfoEdit),loginSelector: #selector(Login),registerSelector: #selector(Register))
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        initlogin()
       
    }
    
    func initlogin(){
        if(Global_UserInfo.IsLogin==true) {
         
            let headview = self._MyHeadUIView as! MyHeadUIView
            headview.Nametext.text=Global_UserInfo.UserName
            headview.loginbtn.isHidden=true
            headview.registerbtn.isHidden=true
            let url = URL(string: Global_UserInfo.ImagePath)
            do {
                let imagea = UIImage(data: try Data(contentsOf: url!))
                if(imagea==nil){
                    headview.ImageBtn.setImage(UIImage.init(named: "userIcon_defualt"), for: .normal)
                }else{
                    headview.ImageBtn.setImage(imagea, for: .normal)   //更改图片
                }
            } catch {
                headview.ImageBtn.setImage(UIImage.init(named: "userIcon_defualt"), for: .normal)
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    //返回节的个数
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return 4
    }
    
    //返回某个节中的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section==0){
            return 2
        }
        if(section==1){
            return 2
        }
        if(section==2){
            return 1
        }
        if(section==3){
            return 1
        }
        
        
        return 1
    }
    
    //为表视图单元格提供数据，该方法是必须实现的方法
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MyCell
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.InitConfig("")
        if(indexPath.section==0){
            if(indexPath.row==0){
                cell.img.image=UIImage(named: "我的信息")  //图标格式 42*42  @2x
                cell.lab.text="我的信息"
            }
            if(indexPath.row==1){
                cell.img.image=UIImage(named: "我的消息")
                cell.lab.text="我的消息"
            }
          
        }
        if(indexPath.section==1){
            if(indexPath.row==0){
                cell.img.image=UIImage(named: "联系客服")
                cell.lab.text="联系客服"
            }
            if(indexPath.row==1){
                cell.img.image=UIImage(named: "关于我们")
                cell.lab.text="关于我们"
            }
        }
        if(indexPath.section==2){
            
            cell.img.image=UIImage(named: "用户反馈")
            cell.lab.text="用户反馈"
        }
        if(indexPath.section==3){
            
            cell.img.image=UIImage(named: "清除缓存")
            cell.lab.text="清除缓存"
        }
        if(indexPath.section==4){
            
            cell.img.image=UIImage(named: "Profil_anquan")
            cell.lab.text=""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.section==0){
            if(indexPath.row==0){
                //个人信息
                print("点击了--个人信息")
                let vc = CommonFunction.ViewControllerWithStoryboardName("Myinfo", Identifier: "Myinfo") as! MyInfoViewController 
                self.navigationController?.show(vc, sender: nil)
            }
            if(indexPath.row==1){
                //我的消息
                   print("点击了--我的消息")
                let vc = MyMsgViewController()
                self.navigationController?.pushViewController(vc, animated: true)
             
            }
          
            
        }
        if(indexPath.section==1){
            if(indexPath.row==0){
                print("点击了--联系客服")
            }
            if(indexPath.row==1){
                let vc = AboutViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                print("点击了--关于我们")
            }
        }
        if(indexPath.section==2){
            print("点击了--用户反馈")
            let vc = FeedbackViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        if(indexPath.section==3){
            print("点击了--清除缓存")
            
            //显示缓存大小
            let intg: Int = Int(SDImageCache.shared().getSize())
            let currentVolum: String = "\(self.fileSizeWithInterge(intg))"
            
            SDImageCache.shared().clearDisk(onCompletion: {
                //清除缓存
                SDImageCache.shared().clearMemory()
                CommonFunction.MessageNotification("为您清除了"+currentVolum, interval: 2, msgtype: .success,font: UIFont.systemFont(ofSize: 13))
            })
            
        }
        
    }
    
    
    ///点击图片产生的事件
    func UserInfoEdit (){
        
        
    }
    
 
    
    //登录
    func Login(){
        
        let vc = LoginViewControllerTwo()
        vc.Callback_Value { (isok) in
            if(isok){
             self.initlogin()
            }
        }
        self.present(vc, animated: true, completion: nil)
      
    }
    
    //注册
    func Register()
    {
       Login()
    }

    
    //获取缓存大小
    func fileSizeWithInterge(_ size: Int) -> String {
        // 1k = 1024, 1m = 1024k
        if size < 1024 {
            // 小于1k
            return "\(Int(size))B"
        }
        else if size < 1024 * 1024 {
            // 小于1m
            let aFloat: CGFloat = CGFloat(size) / 1024
            return String(format: "%.0fK", aFloat)
        }
        else if size < 1024 * 1024 * 1024 {
            // 小于1G
            let aFloat: CGFloat = CGFloat(size) / (1024 * 1024)
            return String(format: "%.1fM", aFloat)
        }
        else {
            let aFloat: CGFloat = CGFloat(size) / (1024 * 1024 * 1024)
            return String(format: "%.1fG", aFloat)
        }
        
    }
    
}
