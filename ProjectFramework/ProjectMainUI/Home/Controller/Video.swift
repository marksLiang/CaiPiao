//
//  Video.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class Video: CustomTemplateViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let identifier1   = "PulickVideoCell"
    fileprivate var viewModel    = VideoViewModel()
    fileprivate var PageIndex: Int = 0
    fileprivate var PageSize:  Int = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.getHttpData()
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
        viewModel.GetVideoList(PageIndex: PageIndex, PageSize: PageSize) { (result, Nomore) in
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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier1, for: indexPath) as! PulickVideoCell
        cell.InitConfig(self.viewModel.ListData[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PulickVideo()
        vc.urlString = self.viewModel.ListData[indexPath.row].url
        vc.videoTitle = self.viewModel.ListData[indexPath.row].title
        self.navigationController?.show(vc, sender: self)
    }
    //MARK: initUI
    private func initUI() -> Void{
        self.InitCongif(tableView)
        self.tableView.frame = CGRect.init(x: 0, y: 64, width: CommonFunction.kScreenWidth, height: CommonFunction.kScreenHeight - 64 - 49)
        let requesterNib1 = UINib(nibName: "PulickVideoCell", bundle: nil)
        self.tableView.register(requesterNib1, forCellReuseIdentifier: identifier1)
        self.tableViewheightForRowAt =  160*CommonFunction.kScreenWidth/375
    }
}
