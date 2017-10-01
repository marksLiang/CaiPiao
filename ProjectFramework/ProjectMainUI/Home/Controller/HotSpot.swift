//
//  HotSpot.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class HotSpot: CustomTemplateViewController {
    
    /********************  懒加载  ********************/
    //轮播图
    fileprivate lazy var shuffling: SDCycleScrollView = {
        let shuffling = SDCycleScrollView(frame:CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 200),delegate:self ,placeholderImage:UIImage.init(named: "placeholder"))
        shuffling?.pageDotColor = UIColor.white
        shuffling?.currentPageDotColor = CommonFunction.SystemColor()
        shuffling?.pageControlRightOffset = -(CommonFunction.kScreenWidth/2 - 50)//分页控制器往右的偏移量
        return shuffling!
    }()
    
    /*******************XIB*********************/
    @IBOutlet weak var tableView: UITableView!
    /********************  属性  ********************/
    fileprivate let identifier   = "PulickNewsCell"
    fileprivate let identifier1   = "PulickVideoCell"
    fileprivate var viewModel    = HotSpotViewModel()
    fileprivate var PageIndex: Int = 0
    fileprivate var PageSize:  Int = 20
    fileprivate var imagesURLStrings = [String]()//轮播图
    fileprivate var textStrings = [String]()
    fileprivate var sview:PulickShowView?
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAdvertising()
        self.initUI()
    }
    //MARK: 头部尾部刷新
    override func headerRefresh() {
        self.imagesURLStrings.removeAll()
        self.textStrings.removeAll()
        PageIndex = 0
        self.getAdvertising()
        
    }
    override func footerRefresh() {
        PageIndex = PageIndex + 1
        self.getHttpData()
    }
    override func Error_Click() {
        self.getHttpData()
    }
    //MARK: 获取数据
    //获取广告
    private func getAdvertising()->Void{
//        viewModel.GetAdvertisingList { (result) in
//            if result == true {
//                for i in 0..<self.viewModel.AdvertisingList.count{
//                    self.imagesURLStrings.append(self.viewModel.AdvertisingList[i].pic)
//                    self.textStrings.append(self.viewModel.AdvertisingList[i].title)
//                }
//                self.getHttpData()
//            }
//        }
        //自己的体彩广告
        viewModel.GetGuangGaoList { (result) in
            if result == true {
                for i in 0..<self.viewModel.GuangGaoList.count{
                    if i == 0 {
                        Global_Jad=self.viewModel.GuangGaoList[i].Jad!//设置全局
                        //debugPrint(Global_Jad.CompanyName)
                    }
                    self.imagesURLStrings.append(self.viewModel.GuangGaoList[i].ImgPath)
                    self.textStrings.append(self.viewModel.GuangGaoList[i].Title)
                }
                self.getHttpData()
            }else{
                self.RefreshRequest(isLoading: false, isHiddenFooter: true, isLoadError: true)
            }
        }
    }
    //热门
    private func getHttpData()->Void{
        viewModel.GetHotSpotList(PageIndex: PageIndex, PageSize: PageSize) { (result, Nomore) in
            self.header.endRefreshing()
            self.footer.endRefreshing()
            if result == true {
                self.shuffling.imageURLStringsGroup = self.imagesURLStrings
                self.shuffling.titlesGroup = self.textStrings
                self.tableView.tableHeaderView = self.shuffling
                if Nomore == true {
                    self.footer.endRefreshingWithNoMoreData()
                }else{
                    self.numberOfSections = 1
                    self.numberOfRowsInSection = self.viewModel.ListData.count
                }
                if(Global_Jad.ID != 0 && Global_Jad.CompanyName != ""){
                    //MARK: 蒙层弹出框
                    self.sview = PulickShowView.init(frame: CGRect.init(x: 0, y: 0, width: CommonFunction.kScreenWidth, height: CommonFunction.kScreenHeight), close_callBackValue: {
                        
                    }) {
                        
                        let  vc = MCWebViewController(url: Global_Jad.JumpURL, ProcesscColor: CommonFunction.SystemColor())
                        self.navigationController?.pushViewController(vc, animated: true)
                        
                    }
                    CommonFunction.RootView?.addSubview(self.sview!)
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
        //
        
    }
    
}
extension HotSpot: SDCycleScrollViewDelegate {
    //MARK: 轮播图代理
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        //debugPrint(index)
//        let vc = CommonFunction.ViewControllerWithStoryboardName("NewsDetail", Identifier: "NewsDetail") as! NewsDetail
//        vc.newID = self.viewModel.AdvertisingList[index].id
//        self.navigationController?.show(vc, sender: self)
        let  vc = MCWebViewController(url: self.viewModel.GuangGaoList[index].JumpURL, ProcesscColor: CommonFunction.SystemColor())
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
