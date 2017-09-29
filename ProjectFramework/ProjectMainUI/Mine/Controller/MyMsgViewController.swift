//
//  MyMsgViewController.swift
//  ProjectFramework
//
//  Created by hcy on 2017/9/29.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class  MyMsgViewController:CustomTemplateViewController
{
    
    let identifier="MyMsgCell"
  
 
    
    ///UITableView
    lazy var tableView:UITableView = {
        var _frame=CGRect(x: 0, y: CommonFunction.NavigationControllerHeight, width: CommonFunction.kScreenWidth, height: self.view.frame.height-CommonFunction.NavigationControllerHeight)
        let tabview=UITableView(frame: _frame, style: .plain)
        tabview.register(UITableViewCell.self, forCellReuseIdentifier: self.identifier)
        tabview.backgroundColor=CommonFunction.LineColor()
        return tabview
    }()
    
    override func viewDidLoad()   {
        super.viewDidLoad()
        self.title="我的消息"
        self.view.addSubview(tableView)
        self.tableViewheightForRowAt=50
        self.numberOfRowsInSection=0
        self.header.isHidden=true
        self.footer.isHidden=true
        self.InitCongif(tableView)
        self.RefreshRequest(isLoading: false,isHiddenFooter: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //为表视图单元格提供数据，该方法是必须实现的方法
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! UITableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    
}


