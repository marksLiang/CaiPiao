//
//  HighlightsViewModel.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/29.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class HighlightsViewModel: NSObject {
    var ListData = [HighlightsModel]()//列表
    func GetHighlightsList(PageIndex:Int , PageSize:Int ,result:((_ result:Bool?,_ NoMore:Bool?) -> Void)?) -> Void {

        let url = "http://a8.tvesou.com/v3/game/videoList?a8id=183814421826&channel=AppStore&platform=iOS&token=&uid=183814421826"
        CommonFunction.Global_Get(entity: BaseModel(), IsListData: false, url: url, isHUD: false, isHUDMake: false, parameters: ["page":PageIndex,"pageSize":PageSize,"time":Date().StringToUnix()], Model: nil) { (resultModel) in
            
            //请求错误
            if((resultModel! as AnyObject).description=="error"){
                CommonFunction.HUD("数据读取失败", type: .error)
                result?(false,false)
                return
            }
            let model = resultModel as! BaseModel
            if model.data != nil {
                let modelArray = HighlightsModel.mj_objectArray(withKeyValuesArray: model.data)
                if PageIndex == 0 {
                    self.ListData = modelArray as! [HighlightsModel]
                }else{
                    for item in modelArray! {
                        let mdl = item as! HighlightsModel
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

