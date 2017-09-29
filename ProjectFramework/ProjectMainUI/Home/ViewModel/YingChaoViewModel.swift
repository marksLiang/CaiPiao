//
//  YingChaoViewModel.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/30.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class YingChaoViewModel: NSObject {
    var ListData = [HotSpotModel]()//列表
    //国际足球列表
    func GetYingChaoList(PageIndex:Int , PageSize:Int ,result:((_ result:Bool?,_ NoMore:Bool?) -> Void)?) -> Void {
        let url = "http://118.178.1.136/v3/league/newsList?a8id=183814421826&channel=AppStore&id=4&leagueId=4&platform=iOS&tag=2&title=%E8%8B%B1%E8%B6%85&token=&type=0&uid=183814421826"
        CommonFunction.Global_Get(entity: BaseModel(), IsListData: false, url: url, isHUD: false, isHUDMake: false, parameters: ["page":PageIndex,"pageSize":PageSize,"time":Date().StringToUnix()], Model: nil)
        { (resultModel) in
            //请求错误
            if((resultModel! as AnyObject).description=="error"){
                CommonFunction.HUD("数据读取失败", type: .error)
                result?(false,false)
                return
            }
            let model = resultModel as! BaseModel
            if model.data != nil {
                let modelArray = HotSpotModel.mj_objectArray(withKeyValuesArray: model.data)
                if PageIndex == 0 {
                    self.ListData = modelArray as! [HotSpotModel]
                }else{
                    for item in modelArray! {
                        let mdl = item as! HotSpotModel
                        self.ListData.append(mdl)
                    }
                }
                //没有更多数据
                if (modelArray?.count)! < PageSize{
                    result?(true,true)
                }else{
                    result?(true,false)
                }
            }
            
        }
    }
}
