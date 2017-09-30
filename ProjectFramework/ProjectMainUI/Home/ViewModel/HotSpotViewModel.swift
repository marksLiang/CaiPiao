//
//  HotSpotViewModel.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/29.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class HotSpotViewModel: NSObject {
    var GuangGaoList = [HomeGuangGao]()
    var ListData = [HotSpotModel]()//列表
    var AdvertisingList = [AdvertisingModel]()//广告列表
    func GetGuangGaoList(result:((_ result:Bool?) -> Void)?) -> Void {
        //?CompanyName=体彩公司
        let url = "http://39.108.173.130:5421/api/SportslotteryAdv/GetSportslotteryAdvList"
        CommonFunction.Global_Get(entity: AppResultModel(), IsListData: false, url: url, isHUD: false, isHUDMake: false, parameters: ["CompanyName":"体彩公司"], Model: nil) { (resultModel) in
            let Appmodel = resultModel as! AppResultModel
            if Appmodel.Success == true {
                if Appmodel.Content != nil {
                    let modelArray = HomeGuangGao.mj_objectArray(withKeyValuesArray: Appmodel.Content)
                    self.GuangGaoList = modelArray as! [HomeGuangGao]
                }
                result?(true)
            }else{
                result?(false)
            }
        }
    }
    func GetAdvertisingList(result:((_ result:Bool?) -> Void)?) -> Void {
        let url = "http://a8.tvesou.com/v3/hot/banner?a8id=197617371936&channel=AppStore&os_ver=10.3.3&platform=iOS&pos=0&sign=746f3ac7e2e5623072af3b63638af268&token=&uid=197617371936&version=232"
        CommonFunction.Global_Get(entity: BaseModel(), IsListData: false, url: url, isHUD: false, isHUDMake: false, parameters: ["time":Date().StringToUnix()], Model: nil) { (resultModel) in
            //请求错误
            if((resultModel! as AnyObject).description=="error"){
                CommonFunction.HUD("数据读取失败", type: .error)
                result?(false)
                return
            }
            let model = resultModel as! BaseModel
            if model.data != nil {
                let modelArray = AdvertisingModel.mj_objectArray(withKeyValuesArray: model.data)
                self.AdvertisingList = modelArray as! [AdvertisingModel]
            }
            result?(true)
        }
    }
    
    //资讯列表
    func GetHotSpotList(PageIndex:Int , PageSize:Int ,result:((_ result:Bool?,_ NoMore:Bool?) -> Void)?) -> Void {
        let url = "http://118.178.1.136/v3/league/newsList?a8id=183814421826&channel=AppStore&leagueIds=104%2C1%2C4%2C2%2C6%2C9%2C3%2C5%2C8%2C7%2C108&leagueTags=4%2C6%2C7%2C8&os_ver=10.3.3&platform=iOS&sign=ffbe29c9f941bd4dc610b8fc66f1770f&type=1&uid=183814421826"
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
