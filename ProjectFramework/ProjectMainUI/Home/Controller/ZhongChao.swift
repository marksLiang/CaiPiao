//
//  ZhongChao.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class ZhongChao: CustomTemplateViewController {

    @IBOutlet weak var tableView: UITableView!
    /********************  属性  ********************/
    fileprivate let identifier   = "PulickNewsCell"
    fileprivate let identifier1   = "PulickVideoCell"
    fileprivate var viewModel    = ZhongChaoViewModel()
    fileprivate var PageIndex: Int = 0
    fileprivate var PageSize:  Int = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.getHttpData()
        // Do any additional setup after loading the view.
    }
    //MARK: 头部尾部刷新
    override func headerRefresh() {
        PageIndex = 0
        self.getHttpData()
    }
    override func footerRefresh() {
        PageIndex = PageIndex + 1
        self.getHttpData()
    }
    private func getHttpData()->Void{
        viewModel.GetZhongChaoList(PageIndex: PageIndex, PageSize: PageSize) { (result, Nomore) in
            self.header.endRefreshing()
            self.footer.endRefreshing()
            if result == true {
                
                if Nomore == true {
                    self.footer.endRefreshingWithNoMoreData()
                }else{
                    self.numberOfSections = 1
                    self.numberOfRowsInSection = self.viewModel.ListData.count
                }
                self.RefreshRequest(isLoading: false, isHiddenFooter: false)
            }else{
                self.RefreshRequest(isLoading: false, isHiddenFooter: true, isLoadError: true)
            }
        }
    }
    //MARK: tableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.ListData[indexPath.row].hasVideo == true ? 200*CommonFunction.kScreenWidth/375 : 90
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.viewModel.ListData[indexPath.row].hasVideo == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier1, for: indexPath) as! PulickVideoCell
            cell.InitConfig(self.viewModel.ListData[indexPath.row])
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PulickNewsCell
            cell.InitConfig(self.viewModel.ListData[indexPath.row])
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.viewModel.ListData[indexPath.row].hasVideo == true {
            let vc = PulickVideo()
            vc.urlString = self.viewModel.ListData[indexPath.row].url
            vc.videoTitle = self.viewModel.ListData[indexPath.row].title
            self.navigationController?.show(vc, sender: self)
        }else{
            let vc = CommonFunction.ViewControllerWithStoryboardName("NewsDetail", Identifier: "NewsDetail") as! NewsDetail
            vc.newID = self.viewModel.ListData[indexPath.row].newsId
            self.navigationController?.show(vc, sender: self)
        }
    }
    //MARK: initUI
    private func initUI() -> Void{
        self.InitCongif(tableView)
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: CommonFunction.kScreenWidth, height: CommonFunction.kScreenHeight - 64 - 49)
        let requesterNib = UINib(nibName: "PulickNewsCell", bundle: nil)
        self.tableView.register(requesterNib, forCellReuseIdentifier: identifier)
        let requesterNib1 = UINib(nibName: "PulickVideoCell", bundle: nil)
        self.tableView.register(requesterNib1, forCellReuseIdentifier: identifier1)
    }

}
