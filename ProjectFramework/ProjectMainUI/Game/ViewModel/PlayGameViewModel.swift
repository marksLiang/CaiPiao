//
//  PlayGameViewModel.swift
//  ProjectFramework
//
//  Created by hcy on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import Foundation

class PlayGameViewModel {
    
    
    var ListData = [PlayGameData]()
    
    func GetGameList (PageIndex:Int,PageSize:Int,result:((_ result:Bool?,_ NoMore:Bool?) -> Void)?)   {
        
        
        let url = "http://118.178.1.136/v3/game/hot?a8id=183814421826&channel=AppStore&gameType=0&os_ver=10.3.3&platform=iOS&token=7b884e07e8df4bc6a89ece05c7fd5f15&uid=183814421826"
        
        CommonFunction.Global_Get(entity: GameModel(), IsListData: false, url: url, isHUD: false, isHUDMake: false, parameters: ["page":PageIndex,"pageSize":PageSize,"time":Date().StringToUnix()], Model: nil) { (resultModel) in
            
            if((resultModel! as AnyObject).description=="error"){
                CommonFunction.HUD("数据读取失败", type: .error)
                result?(false,false)
                return
            }
            
            let model = resultModel as! GameModel
            
            if(model.data.game.count==0){
                result?(true,true)
                return
            }
            if(self.ListData.count>0){
                for item in model.data.game {
                    self.ListData.append(item )
                }
                
            }else{
                self.ListData = model.data.game
            }
            result?(true,false)
        }
        
    }
    
    
}
