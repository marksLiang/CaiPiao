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
        leagueType.text=model.leagueType
        let begintime =  Date().UnixToDate(timeStamp: model.beginTime )
        let hm =  begintime.currentHour + begintime.currentMinute
        let newdate=Date()
        let newhm=newdate.currentHour + newdate.currentMinute
        
        if Calendar.current.isDate(Date().UnixToDate(timeStamp: model.beginTime ), inSameDayAs: NSDate() as Date) { 
            if(newhm>hm){
                //已经开赛了
                homeScore.textColor=UIColor.black
                awayScore.textColor=UIColor.black
                
                homeScore.font=UIFont.boldSystemFont(ofSize: 15)
                awayScore.font=UIFont.boldSystemFont(ofSize: 15)
            }else{
                //未开赛
                let h =  begintime.currentHour.description.characters.count
                let m =  begintime.currentMinute.description.characters.count
                let hh = h == 1 ? "0" + begintime.currentHour.description : begintime.currentHour.description
                let mm = m == 1 ? "0" + begintime.currentMinute.description : begintime.currentMinute.description
                
                homeScore.text = hh + ":" + mm + "开始"
                awayScore.text="未开赛"
                homeScore.textColor=UIColor.gray
                awayScore.textColor=UIColor.gray
            }
        }else {
          let h =  begintime.currentHour.description.characters.count
            let m =  begintime.currentMinute.description.characters.count
             let hh = h == 1 ? "0" + begintime.currentHour.description : begintime.currentHour.description
             let mm = m == 1 ? "0" + begintime.currentMinute.description : begintime.currentMinute.description
            
            homeScore.text = hh + ":" + mm + "开始"
            awayScore.text="未开赛"
            homeScore.textColor=UIColor.gray
            awayScore.textColor=UIColor.gray
            
        }
        
      
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
