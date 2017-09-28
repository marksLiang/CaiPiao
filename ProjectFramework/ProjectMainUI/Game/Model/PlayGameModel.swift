//
//  PlayGameModel.swift
//  ProjectFramework
//
//  Created by hcy on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import Foundation


class  GameModel: NSObject {
    
    var data:PlayGameModel!
    var error_code=""
}

class PlayGameModel: NSObject {
    
    var game:[PlayGameData]!
    
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["game":PlayGameData.self]
    }
    
}

class PlayGameData: NSObject {
    var onFire=""
    var leagueName=""
    var desc=""
    var awayTeamLogo=""
    var newsStatus=""
    var hasJC=""
    var visit=""
    var liveChannels:[liveChannelsModel]!
    var type=""
    var liveLiteral=""
    var title=""
    var awayTeamId=""
    var homeTeamLogo=""
    var homeTeamId=""
    var awayTeamName=""
    var homeTeamName=""
    var awayScore=""
    var homeScore=""
    var status=""
    var backGround=""
    var gameId=""
    var beginTime=""
    var typeStatus=""
    var sinaMatchDataUrl=""
    var league=""
    var t=""
    var s=""
    var players:[playersModel]!
    var hot=""
    var channelNames=""
    var officialNum=""
    var leagueType=""
    
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["liveChannels":liveChannelsModel.self,"players":playersModel.self]
    }
    
}

class liveChannelsModel: NSObject {
    var startDate=""
    var platform=""
    var ios_play_status=""
    var android_url=""
    var index=""
    var channelName=""
    var image=""
    var roomId=""
    var endDate=""
    var from=""
    var endTime=""
    var videoType=""
    var url=""
    var startTime=""
    var tvid=""
    var ios_url=""
    var android_play_status=""
    var cst=""
    var cf=""
    var ios_down=""
    var android_down=""
    var isShow=""
}

class playersModel: NSObject {
    
}

