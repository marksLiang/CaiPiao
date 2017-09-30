//
//  NewsDetail.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/30.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class NewsDetail: CustomTemplateViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var viewModel = NewsDetailViewModel()
    fileprivate var webHeght = CommonFunction.kScreenHeight - 64
    fileprivate let indetifer1 = "cell1"
    fileprivate let indetifer2 = "cell2"
    var newID = ""
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "资讯详情"
        self.initUI()
        self.getHttpData()
    }
    private func initUI() -> Void{
        self.InitCongif(tableView)
        self.tableView.frame = CGRect.init(x: 0, y: 64, width: CommonFunction.kScreenWidth, height: CommonFunction.kScreenHeight - 64)
        self.header.isHidden = true
        self.tableView.register(PulickWebCell.self, forCellReuseIdentifier: indetifer1)
        self.tableView.register(UserCommentCell.self, forCellReuseIdentifier: indetifer2)
    }
    //MARK: 获取数据
    private func getHttpData()->Void{
        viewModel.GetNewsDetail(newsID: newID) { (result) in
            if result == true {
                //debugPrint(self.viewModel.dataSouce.content)
                self.getCommontData()
            }
        }
    }
    
    private func getCommontData()->Void{
        viewModel.GetCommentList(newID: newID) { (result) in
            if result == true {
                if self.viewModel.ListData.newList != nil {
                    self.footer.endRefreshingWithNoMoreData()//关掉尾部
                    self.RefreshRequest(isLoading: false, isHiddenFooter: false)
                }else{
                    self.RefreshRequest(isLoading: false, isHiddenFooter: true)
                }
            }else{
                self.RefreshRequest(isLoading: false, isHiddenFooter: true, isLoadError: true)
            }
            //debugPrint(self.viewModel.ListData.hotList.count,self.viewModel.ListData.newList.count)
        }
    }
    //MARK: tableViewdelegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    var _numberOfRowsInSection = [0,0]
    //组个数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if self.viewModel.dataSouce.content != "" {
            _numberOfRowsInSection[0]=1
        }
        if self.viewModel.ListData.newList != nil {
            _numberOfRowsInSection[1]=(self.viewModel.ListData.newList?.count)!
        }
        return _numberOfRowsInSection[section]
    }
    //组头高
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.1 : 40
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return webHeght
        }else{
            let model = self.viewModel.ListData.newList![indexPath.row]
            return 60 + model.content.ContentSize(font: UIFont.systemFont(ofSize: 13), maxSize: CGSize(width: CommonFunction.kScreenWidth - 90, height: 0)).height
        }
    }
    //组头
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if self.viewModel.ListData.newList != nil && self.viewModel.ListData.newList?.count != 0 && section != 0{
            return UIView().setIntroduceView(height: 40, title: "最新评论")
        }else{
            return UIView()
        }
    }
    //组尾高
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    var isfirt = false
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: indetifer1, for: indexPath)as!PulickWebCell
            cell.loadHtmlString(html: self.viewModel.dataSouce.content, isFirst: isfirt)
            isfirt = true
            cell.FuncCallbackValue(value: {[weak self] (height) in
                self?.webHeght = height
                self?.RefreshRequest(isLoading: false, isHiddenFooter: false)
            })
            return cell
        }else{
            let cell = UserCommentCell.init(style: .subtitle, reuseIdentifier: indetifer2)
            cell.InitConfig(self.viewModel.ListData.newList![indexPath.row])
            return cell
        }
    }
}

