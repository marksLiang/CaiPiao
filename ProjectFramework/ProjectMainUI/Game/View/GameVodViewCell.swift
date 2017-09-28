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
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func InitConfig(_ cell: Any) {
     let model = cell as! PlayGameData
        leagueType.text=model.leagueType
        img.ImageLoad(PostUrl: model.homeTeamLogo)
        lab1.text=model.homeTeamName
        lab2.text = Date().UnixToString(timeStamp: model.beginTime )
        
        let begintime =  Date().UnixToDate(timeStamp: model.beginTime )
        let hm =  begintime.currentHour + begintime.currentMinute
        let newdate=Date()
        let newhm=newdate.currentHour + newdate.currentMinute
        
        if Calendar.current.isDate(Date().UnixToDate(timeStamp: model.beginTime ), inSameDayAs: NSDate() as Date) { 
            if(newhm>hm){
                //已经开赛了
                lab2.text=""
            }else{
                //未开赛
                let h =  begintime.currentHour.description.characters.count
                let m =  begintime.currentMinute.description.characters.count
                let hh = h == 1 ? "0" + begintime.currentHour.description : begintime.currentHour.description
                let mm = m == 1 ? "0" + begintime.currentMinute.description : begintime.currentMinute.description
                lab1.text = hh + ":" + mm + "开始"
                lab2.text="未开赛"
                lab1.textColor=UIColor.gray
                lab2.textColor=UIColor.gray
            }
        }else { 
            let h =  begintime.currentHour.description.characters.count
            let m =  begintime.currentMinute.description.characters.count
            let hh = h == 1 ? "0" + begintime.currentHour.description : begintime.currentHour.description
            let mm = m == 1 ? "0" + begintime.currentMinute.description : begintime.currentMinute.description
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
