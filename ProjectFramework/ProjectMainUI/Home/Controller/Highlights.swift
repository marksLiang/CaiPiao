//
//  Highlights.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class Highlights: CustomTemplateViewController {
    /*******************XIB*********************/
    @IBOutlet weak var tableView: UITableView!
    /*******************属性*********************/
    fileprivate let identifier   = "HighlightsCell"
    fileprivate var viewModel    = HighlightsViewModel()
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
    //MARK: 获取数据
    private func getHttpData()->Void{
        viewModel.GetHighlightsList(PageIndex: PageIndex, PageSize: PageSize) { (result, Nomore) in
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
    //MARK: tableViewdelegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! HighlightsCell
        cell.InitConfig(self.viewModel.ListData[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = PulickVideo()
        vc.urlString = self.viewModel.ListData[indexPath.row].sPlayUrl
        vc.videoTitle = self.viewModel.ListData[indexPath.row].sTitle
        self.navigationController?.show(vc, sender: self)

    }
    //MARK: initUI
    private func initUI() -> Void{
        self.InitCongif(tableView)
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: CommonFunction.kScreenWidth, height: CommonFunction.kScreenHeight - 64 - 49)
        self.tableViewheightForRowAt = 200
    }
}
