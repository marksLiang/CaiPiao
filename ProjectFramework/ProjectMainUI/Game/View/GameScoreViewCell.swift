//
//  GameScoreViewCell.swift
//  ProjectFramework
//
//  Created by hcy on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class GameScoreViewCell: UITableViewCell {
   
    @IBOutlet weak var leagueType: UILabel!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var GameTime: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func InitConfig(_ cell: Any) {
        let model = cell as! PlayGameData
        homeTeamLogo.ImageLoad(PostUrl: model.homeTeamLogo)
        awayTeamLogo.ImageLoad(PostUrl: model.awayTeamLogo)
        homeTeamName.text=model.homeTeamName
        awayTeamName.text=model.awayTeamName
        homeScore.text=model.homeScore
        awayScore.text=model.awayScore
        leagueType.text=model.leagueName
        let time = Date().UnixToString(timeStamp: model.beginTime )
        GameTime.text=time.split(separator: " ")[0].description

        let begintime =  Date().UnixToString(timeStamp: model.beginTime )
        let gamehm  =  begintime.split(separator: " ")[1].split(separator: ":")
          let newdate=Date()
       
        if Calendar.current.isDate(Date().UnixToDate(timeStamp: model.beginTime ), inSameDayAs: NSDate() as Date) { 
            if(newdate.currentHour>=Int(gamehm[0].description)!){
    
                if(newdate.currentMinute>=Int(gamehm[1].description)!){
                    //已经开赛了
                    homeScore.textColor=UIColor.black
                    awayScore.textColor=UIColor.black
                    
                    homeScore.font=UIFont.boldSystemFont(ofSize: 15)
                    awayScore.font=UIFont.boldSystemFont(ofSize: 15)
                }else{
                
                    //未开赛
                    let h =   Int(gamehm[0].description)!
                    let m =   Int(gamehm[1].description)!
                    let hh = h == 1 ? "0" +  gamehm[0].description  :  gamehm[0].description
                    let mm = m == 1 ? "0" + gamehm[1].description : gamehm[1].description
                    
                    homeScore.text = hh + ":" + mm + "开始"
                    awayScore.text="未开赛"
                    if(newdate.currentMinute+15>=Int(gamehm[1].description)!){
                        awayScore.text="即将开始"
                    }
                    homeScore.textColor=UIColor.gray
                    awayScore.textColor=UIColor.gray
                    homeScore.font=UIFont.systemFont(ofSize: 13)
                    awayScore.font=UIFont.systemFont(ofSize: 13)
                }
                
      
            } 
            else{
                //未开赛
                let h =   Int(gamehm[0].description)!
                let m =   Int(gamehm[1].description)!
                let hh = h == 1 ? "0" +  gamehm[0].description  :  gamehm[0].description
                let mm = m == 1 ? "0" + gamehm[1].description : gamehm[1].description
                
                homeScore.text = hh + ":" + mm + "开始"
                awayScore.text="未开赛"
                homeScore.textColor=UIColor.gray
                awayScore.textColor=UIColor.gray
                homeScore.font=UIFont.systemFont(ofSize: 13)
                awayScore.font=UIFont.systemFont(ofSize: 13)
            }
        }else {
            let h =   Int(gamehm[0].description)!
            let m =   Int(gamehm[1].description)!
            let hh = h == 1 ? "0" +  gamehm[0].description  :  gamehm[0].description
            let mm = m == 1 ? "0" + gamehm[1].description : gamehm[1].description
            
            homeScore.text = hh + ":" + mm + "开始"
            awayScore.text="未开赛"
            homeScore.textColor=UIColor.gray
            awayScore.textColor=UIColor.gray
            homeScore.font=UIFont.systemFont(ofSize: 13)
            awayScore.font=UIFont.systemFont(ofSize: 13)
            
        }
        
      
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
