//
//  PlayGame.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class PlayGame: CustomTemplateViewController {
 
    let identifier="GameScoreCell"
    let identifier1="GameVodCell"
    var PageIndex: Int = 0
    var PageSize: Int = 20
    var viewModel=PlayGameViewModel()
  
     
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "比赛"
        tableView.frame=CGRect(x: 0, y: CommonFunction.NavigationControllerHeight, width: CommonFunction.kScreenWidth, height:self.view.frame.height-CommonFunction.NavigationControllerHeight)
        self.view.addSubview(tableView)
        self.tableView.backgroundColor=CommonFunction.LineColor()
        self.InitCongif(tableView)
        self.numberOfSections=1
        self.tableViewheightForRowAt=95
        GetHtpsData()
    }
    
    //MARK: Refresh
    override func footerRefresh() {
        PageIndex = PageIndex + 1
        self.GetHtpsData()
    }
    
    override func headerRefresh() { 
        InitializationData()
    }
    
    
    //MARK: 获取数据
    func GetHtpsData() {
        
        viewModel.GetGameList(PageIndex: PageIndex, PageSize: PageSize) { (result,NoMore) in
            self.footer.endRefreshing()
            self.header.endRefreshing()
            if  result == true {
                if(NoMore==true){
                    self.footer.endRefreshingWithNoMoreData()
                }else{
                    self.numberOfRowsInSection = self.viewModel.ListData.count

                    if(self.viewModel.ListData.count==0){
                        self.RefreshRequest(isLoading: false, isHiddenFooter: true)
                        return
                    }
                    if(self.numberOfRowsInSection  < self.PageSize ){
                        self.footer.endRefreshingWithNoMoreData()
                    }
                    self.RefreshRequest(isLoading: false, isHiddenFooter: false)
                }
            }
            else{
                self.RefreshRequest(isLoading: false, isHiddenFooter: true, isLoadError: true)
            }
        }
    }
    
    override func Error_Click() {
      InitializationData()
    }
    //初始化数据
    func InitializationData(){
        PageIndex = 0
        viewModel.ListData.removeAll()
        self.numberOfRowsInSection = self.viewModel.ListData.count
        self.RefreshRequest(isLoading: true, isHiddenFooter: false)
        GetHtpsData()
    }
    
    // MARK: tableViewDelegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
   
        if(viewModel.ListData[indexPath.row].awayTeamLogo != "" && viewModel.ListData[indexPath.row].homeTeamLogo != "" ){
          cell   = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! GameScoreViewCell
        } else{
               cell = tableView.dequeueReusableCell(withIdentifier: identifier1, for: indexPath) as!
            GameVodViewCell
        }
        if(viewModel.ListData[indexPath.row].sinaMatchDataUrl != ""){
            cell.accessoryType = .disclosureIndicator
        }else{
                cell.accessoryType = .none
        }
        
        cell.InitConfig(viewModel.ListData[indexPath.row])
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(viewModel.ListData[indexPath.row].sinaMatchDataUrl != ""){
            let  vc = MCWebViewController(url: viewModel.ListData[indexPath.row].sinaMatchDataUrl, ProcesscColor: CommonFunction.SystemColor())
            self.navigationController?.pushViewController(vc, animated: true)
        }
        

    }
    

  

}
