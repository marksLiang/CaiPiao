//
//  NewsDetail.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/30.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class NewsDetail: CustomTemplateViewController {
    
    lazy var costomWebView:UIWebView={
        let costomWebView = UIWebView.init(frame: CommonFunction.CGRect_fram(0, y: 64, w: CommonFunction.kScreenWidth, h: CommonFunction.kScreenHeight - 64))
        costomWebView.scrollView.bounces = false
//        costomWebView.scrollView.isScrollEnabled = false
//        costomWebView.delegate = self
        costomWebView.backgroundColor = UIColor.white
        //costomWebView.isUserInteractionEnabled = false
        costomWebView.scrollView.showsVerticalScrollIndicator = false
        costomWebView.scrollView.showsHorizontalScrollIndicator = false
        return costomWebView
    }()
    
    fileprivate var viewModel = NewsDetailViewModel()
    var newID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "资讯详情"
        self.view.addSubview(costomWebView)
        self.getHttpData()
    }
    private func getHttpData()->Void{
        viewModel.GetNewsDetail(newsID: newID) { (result) in
            if result == true {
                debugPrint(self.viewModel.dataSouce.content)
                self.costomWebView.loadHTMLString(self.viewModel.dataSouce.content, baseURL: nil)
                self.getCommontData()
            }
        }
    }
    private func getCommontData()->Void{
        viewModel.GetCommentList(newID: newID) { (result) in
            //debugPrint(self.viewModel.ListData.hotList.count,self.viewModel.ListData.newList.count)
        }
    }

}
