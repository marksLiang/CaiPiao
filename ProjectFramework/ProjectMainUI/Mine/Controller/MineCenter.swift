//
//  MineCenter.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit




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
            
        }else{ 
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    //返回节的个数
    func numberOfSections(in tableView: UITableView) -> Int {
        if(Global_UserInfo.IsLogin==false){
            return 5
        }
        return 6
    }
    
    //返回某个节中的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section==0){
            return 5
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
        if(section==4){
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
                cell.accessoryType = .none 
                cell.img.image=UIImage(named: "Profile_yue")  //图标格式 42*42  @2x
                cell.lab.text="余额"
            }
            if(indexPath.row==1){
                cell.img.image=UIImage(named: "购彩票记录")
                cell.lab.text="我的订单"
            }
            if(indexPath.row==2){
                cell.img.image=UIImage(named: "中奖记录")
                cell.lab.text="中奖记录"
            }
            if(indexPath.row==3){
                cell.img.image=UIImage(named: "交易记录")
                cell.lab.text="交易记录"
            }
            if(indexPath.row==4){
                cell.img.image=UIImage(named: "提现")
                cell.lab.text="提现账号"
            }
            
        }
        if(indexPath.section==1){
            if(indexPath.row==0){
                cell.img.image=UIImage(named: "Profile_shoujihao")
                cell.lab.text="手机号"
            }
            if(indexPath.row==1){
                cell.img.image=UIImage(named: "idcard")
                cell.lab.text="身份证"
            }
        }
        if(indexPath.section==2){
            
            cell.img.image=UIImage(named: "修改密码")
            cell.lab.text="修改密码"
        }
        
        if(indexPath.section==3){
            
            cell.img.image=UIImage(named: "Profile_guanyu")
            cell.lab.text="关于我们"
        }
        if(indexPath.section==4){
            
            cell.img.image=UIImage(named: "用户反馈")
            cell.lab.text="用户反馈"
        }
        if(indexPath.section==5){
            
            cell.img.image=UIImage(named: "Profil_anquan")
            cell.lab.text="安全退出"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.section==0){
            if(indexPath.row==0){
//                if(Global_UserInfo.IsLogin==false){
//                    self.noticeOnlyText("请先登录!")
//                    Login()
//                    return
//                }
                
           
            }
            if(indexPath.row==1){
 
            }
            if(indexPath.row==2){
           
                
            }
            if(indexPath.row==3){
 
                
            }
            if(indexPath.row==4){
               
            }
            
        }
        if(indexPath.section==1){
            if(indexPath.row==0){
          
                
            }
            
            if(indexPath.row==1){
      
            }
        }
        if(indexPath.section==2){
         
        }
        if(indexPath.section==3){
            let vc = AboutViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            print("点击了--关于我们")
        }
        if(indexPath.section==4){
            print("点击了--用户反馈")
            let vc = FeedbackViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        if(indexPath.section==5){
            print("点击了--安全退出")
            CommonFunction.AlertController(self, title: "提示", message: "确定退出？", ok_name: "确定", cancel_name: "取消", OK_Callback: {
                
                self.closeLogin()
            }, Cancel_Callback: {
                
            })
            
        }
    }
    //注销
    func closeLogin(){
        CommonFunction.ExecuteUpdate("update MemberInfo set  PhoneNo = (?) ,   IsLogin = (?) ,RealName=(?),money=(?),redBalance=(?),account=(?)",
                                     [ "" as AnyObject
                                        ,false as AnyObject
                                        ,"" as AnyObject
                                        ,"" as AnyObject
                                        ,"" as AnyObject
                                        ,"" as AnyObject
            ], callback: nil)
        
        CommonFunction.ExecuteUpdate("update CooKie set CooKie = (?) ",
                                     ["" as AnyObject  ], callback: nil)
        
        
        Global_UserInfo=MyInfoModel()
        
        
        //更改余额
        let money = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MyCell
        let headview = self._MyHeadUIView as! MyHeadUIView
        headview.loginbtn.setTitle("登  录", for: .normal)
        headview.registerbtn.setTitle("注  册", for: .normal)
        headview.Nametext.text="有钱就是任性"
        headview.ImageBtn.setImage(UIImage.init(named: "userIcon_defualt"), for: .normal)
        self.tableView.reloadData()
    }
    
    ///点击图片产生的事件
    func UserInfoEdit (){
        
        
    }
    
 
    
    //登录
    func Login(){
        
      
    }
    
    //注册
    func Register()
    {
 
    }

}
