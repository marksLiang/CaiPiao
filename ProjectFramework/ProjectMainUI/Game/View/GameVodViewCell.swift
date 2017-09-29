//
//  GameVodViewCell.swift
//  ProjectFramework
//
//  Created by hcy on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class GameVodViewCell: UITableViewCell {
    
    @IBOutlet weak var leagueType: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lab1: UILabel!
    
    @IBOutlet weak var lab2: UILabel!
    @IBOutlet weak var gameTime: UILabel!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func InitConfig(_ cell: Any) {
     let model = cell as! PlayGameData
        leagueType.text=model.leagueName
        img.ImageLoad(PostUrl: model.homeTeamLogo)
        lab1.text=model.homeTeamName
        lab2.text = Date().UnixToString(timeStamp: model.beginTime )
        
        let time = Date().UnixToString(timeStamp: model.beginTime )
        gameTime.text=time.split(separator: " ")[0].description
        
        let begintime =  Date().UnixToString(timeStamp: model.beginTime )
        let gamehm  =  begintime.split(separator: " ")[1].split(separator: ":")
       
        let newdate=Date()
        if Calendar.current.isDate(Date().UnixToDate(timeStamp: model.beginTime ), inSameDayAs: NSDate() as Date) {
            if(newdate.currentHour>=Int(gamehm[0].description)!){
                if(newdate.currentMinute>=Int(gamehm[1].description)!){
                    //已经开赛了
                    lab2.text=""
                }else{
                    //未开赛
                    let h =   Int(gamehm[0].description)!
                    let m =   Int(gamehm[1].description)!
                    let hh = h == 1 ? "0" +  gamehm[0].description  :  gamehm[0].description
                    let mm = m == 1 ? "0" + gamehm[1].description : gamehm[1].description
                    lab1.text = hh + ":" + mm + "开始"
                    lab2.text="未开赛"
                    if(newdate.currentMinute+15>=Int(gamehm[1].description)!){
                           lab2.text="即将开始"
                    }
                    lab1.textColor=UIColor.gray
                    lab2.textColor=UIColor.gray
                }
            }
           else{
                //未开赛
                let h =   Int(gamehm[0].description)!
                let m =   Int(gamehm[1].description)!
                let hh = h == 1 ? "0" +  gamehm[0].description  :  gamehm[0].description
                let mm = m == 1 ? "0" + gamehm[1].description : gamehm[1].description
                lab1.text = hh + ":" + mm + "开始"
                lab2.text="未开赛"
                lab1.textColor=UIColor.gray
                lab2.textColor=UIColor.gray
            }
        }else { 
                let h =   Int(gamehm[0].description)!
                let m =   Int(gamehm[1].description)!
                let hh = h == 1 ? "0" +  gamehm[0].description  :  gamehm[0].description
                let mm = m == 1 ? "0" + gamehm[1].description : gamehm[1].description
            lab1.text = hh + ":" + mm + "开始"
            lab2.text="未开赛"
            lab1.textColor=UIColor.gray
            lab2.textColor=UIColor.gray
            
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
