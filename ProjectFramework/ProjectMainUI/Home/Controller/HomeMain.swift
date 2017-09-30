//
//  HomeMain.swift
//  ProjectFramework
//
//  Created by 恋康科技 on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit
import FDFullscreenPopGesture

class HomeMain: UIViewController {

    /*******************懒加载*********************/
    fileprivate lazy var pageMenu: CAPSPageMenu = {
        var controllerArray : [UIViewController] = []
        
        let controller1 = CommonFunction.ViewControllerWithStoryboardName("HotSpot", Identifier: "HotSpot") as! HotSpot
        let controller2 = CommonFunction.ViewControllerWithStoryboardName("Highlights", Identifier: "Highlights") as!  Highlights
        //let controller3 = CommonFunction.ViewControllerWithStoryboardName("Video", Identifier: "Video") as!  Video
        let controller4 = CommonFunction.ViewControllerWithStoryboardName("InternationalFootball", Identifier: "InternationalFootball") as!  InternationalFootball
        let controller5 = CommonFunction.ViewControllerWithStoryboardName("ChinaFootball", Identifier: "ChinaFootball") as!  ChinaFootball
        let controller6 = CommonFunction.ViewControllerWithStoryboardName("Sports", Identifier: "Sports") as!  Sports
        let controller7 = CommonFunction.ViewControllerWithStoryboardName("ChinaBasketball", Identifier: "ChinaBasketball") as!  ChinaBasketball
        let controller8 = CommonFunction.ViewControllerWithStoryboardName("NBALeague", Identifier: "NBALeague") as!  NBALeague
        let controller9 = CommonFunction.ViewControllerWithStoryboardName("YingChao", Identifier: "YingChao") as!  YingChao
        let controller10 = CommonFunction.ViewControllerWithStoryboardName("XiJia", Identifier: "XiJia") as!  XiJia
        let controller11 = CommonFunction.ViewControllerWithStoryboardName("ZhongChao", Identifier: "ZhongChao") as!  ZhongChao
        let controller12 = CommonFunction.ViewControllerWithStoryboardName("DeJia", Identifier: "DeJia") as!  DeJia
        let controller13 = CommonFunction.ViewControllerWithStoryboardName("YiJia", Identifier: "YiJia") as!  YiJia
        let controller14 = CommonFunction.ViewControllerWithStoryboardName("FaJia", Identifier: "FaJia") as!  FaJia
        let controller15 = CommonFunction.ViewControllerWithStoryboardName("OUGuan", Identifier: "OUGuan") as!  OUGuan
        let controller16 = CommonFunction.ViewControllerWithStoryboardName("QuanYunHui", Identifier: "QuanYunHui") as!  QuanYunHui
        
        controller1.title = "热门"
        controller2.title = "集锦"
        //controller3.title = "视频"
        controller4.title = "国际足球"
        controller5.title = "中国足球"
        controller6.title = "综合体育"
        controller7.title = "中国篮球"
        controller8.title = "NBA"
        controller9.title = "英超"
        controller10.title = "西甲"
        controller11.title = "中超"
        controller12.title = "德甲"
        controller13.title = "意甲"
        controller14.title = "法甲"
        controller15.title = "欧冠"
        controller16.title = "全运会"
        
        controllerArray.append(controller1)
        controllerArray.append(controller2)
        //controllerArray.append(controller3)
        controllerArray.append(controller4)
        controllerArray.append(controller5)
        controllerArray.append(controller6)
        controllerArray.append(controller7)
        controllerArray.append(controller8)
        controllerArray.append(controller9)
        controllerArray.append(controller10)
        controllerArray.append(controller11)
        controllerArray.append(controller12)
        controllerArray.append(controller13)
        controllerArray.append(controller14)
        controllerArray.append(controller15)
        controllerArray.append(controller16)
        
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor.white),
            .viewBackgroundColor(UIColor.white),
            .selectionIndicatorColor(UIColor.black),
            .bottomMenuHairlineColor(UIColor.clear),
            .menuItemFont(UIFont.systemFont(ofSize: 13)),
            .selectedMenuItemLabelColor(UIColor.black),
            .unselectedMenuItemLabelColor(UIColor.gray),
            .menuHeight(44.0),
            .menuItemWidth(55.0),
            .centerMenuItems(true),
            .scrollEnabled(true),
            .enableHorizontalBounce(false)
        ]
        let pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0, y: 20, width:self.view.frame.width, height: self.view.frame.height - 49 - 20), pageMenuOptions: parameters)
        
        return pageMenu
    }()
    //MARK: viewDidLoad
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.automaticallyAdjustsScrollViewInsets=false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        // Do any additional setup after loading the view.
        self.initUI()
    }

    //MARK:
    private func initUI()->Void{
        
        //添加分页控制器
        self.addChildViewController(pageMenu)
        self.view.addSubview(pageMenu.view)
        pageMenu.didMove(toParentViewController: self)

    }
    

}
