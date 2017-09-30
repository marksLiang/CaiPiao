//
//  HomeGuangGao.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/10/1.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit


class HomeGuangGao: NSObject {
    var ID=0
    var ImgPath=""
    var JumpURL=""
    var Title=""
    var CompanyName=""
    var isShow=true
    var isNetworkPicture=true
    var Jad:JadModel?
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["Jad":JadModel.self]
    }
}
class JadModel: NSObject {
    var ID=0
    var ImgPath=""
    var JumpURL=""
    var Title=""
    var isClose=true
    var isShowCell=true
    var isNetworkPicture=true
    var CompanyName=""
}
