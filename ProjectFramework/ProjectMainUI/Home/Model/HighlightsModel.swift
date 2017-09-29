//
//  HighlightsModel.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/29.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class HighlightsModel: NSObject {
    var nId=0
    var sGameId=""
    var sTitle=""//集锦标题
    var sImgUrl=""//集锦封面图
    var sPlayUrl=""//播放地址
    var nPlayType=0//播放类型
    var tCreateTime=0//开赛时间
    var nState=0//集锦状态
    var tGameTime = 0//结束时间
    var sHomeId=""//左边俱乐部
    var sGuestId=""//右边俱乐部
    var sHomeName=""//左边俱乐部名
    var sGuestName=""//右边俱乐部名
    var sHomeLogo=""//左边俱乐部logo
    var sGuestLogo=""
    var nHomeScore=0
    var nGuestScore=1
    var sinaMatchDataUrl=""
    var league=0
    var leagueName=""
    var leagueType=0
}

