//
//  NewsDetailViewModel.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/30.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class NewsDetailViewModel: NSObject {
    var dataSouce = NewsDetailModel()
    var ListData = NewsCommentModel()//列表
    func GetNewsDetail(newsID:String , result:((_ result:Bool?) -> Void)?) -> Void {
        let url = "http://118.178.1.136/right/news/news_html?nid="+newsID
        CommonFunction.Global_Get(entity: BaseModel(), IsListData: false, url: url, isHUD: false, isHUDMake: false, parameters: nil, Model: nil) { (resultModel) in
            //请求错误
            if((resultModel! as AnyObject).description=="error"){
                CommonFunction.HUD("数据读取失败", type: .error)
                result?(false)
                return
            }
            let model = resultModel as! BaseModel
            if model.data != nil {
                let itme = NewsDetailModel.mj_object(withKeyValues: model.data!)
                self.dataSouce = itme as! NewsDetailModel
            }
            result?(true)
        }
    }
    func GetCommentList(newID:String,result:((_ result:Bool?) -> Void)?) -> Void {
        
        let url = "http://pinglun.a8tiyu.com/comment/hotNew?channel=AppStore&hotNum=20&machineCode=0cafc12d4311d84b16293185493558a559c3c74c&newNum=1000&originId=\(newID)&sign=aff31e03d66c004e9434908720dba8cc&time=1506389117&userId=197617371936&userIp=123.12.195.59"
        CommonFunction.Global_Get(entity: BaseModel(), IsListData: false, url: url, isHUD: false, isHUDMake: false, parameters: ["originId":newID,"time":Date().StringToUnix()], Model: nil) { (resultModel) in
            //请求错误
            if((resultModel! as AnyObject).description=="error"){
                CommonFunction.HUD("数据读取失败", type: .error)
                result?(false)
                return
            }
            let model = resultModel as! BaseModel
            if model.data != nil {
                let item = NewsCommentModel.mj_object(withKeyValues: model.data)
                self.ListData = item as! NewsCommentModel
                debugPrint("+++",self.ListData.hotList?.count)
            }
            result?(true)
        }
    }
}
