//
//  PulickShowView.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/10/1.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class PulickShowView: UIView {

    typealias closeBackValue=()->Void //类似于OC中的typedef
    var myCloseBackValue:closeBackValue?  //声明一个闭包 类似OC的Block属性
    func  CloseCallbackValue(value:closeBackValue?){
        myCloseBackValue = value //返回值
    }
    typealias CallbackValue=()->Void //类似于OC中的typedef
    var myCallbackValue:CallbackValue?  //声明一个闭包 类似OC的Block属性
    func  FuncCallbackValue(value:CallbackValue?){
        myCallbackValue = value //返回值
    }
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: CommonFunction.kScreenWidth - 60, height: (CommonFunction.kScreenWidth - 60)*1.1))
        imageView.center = self.center
        imageView.backgroundColor = UIColor.white
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    lazy var closeButton: UIButton = {
        let closeButton = UIButton.init(type: .custom)
        //closeButton.backgroundColor = UIColor.red
        closeButton.frame = CGRect.init(x: 0, y: self.imageView.frame.maxY + 25, width: 35, height: 35)
        closeButton.center.x = self.center.x
        closeButton.tag = 1
        closeButton.setBackgroundImage(UIImage.init(named: "closed"), for: .normal)
        closeButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        return closeButton
    }()
    lazy var selectButton: UIButton = {
       let selectButton = UIButton.init(type: .system)
        selectButton.backgroundColor = CommonFunction.SystemColor()
        selectButton.frame = CGRect.init(x: 0, y: self.imageView.frame.maxY - 50, width: self.imageView.frame.width * 0.8, height: 35)
        selectButton.tag = 2
        selectButton.layer.cornerRadius = 8
        selectButton.center.x = self.imageView.center.x
        selectButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        selectButton.setTitle("去领取", for: .normal)
        selectButton.setTitleColor(UIColor.white, for: .normal)
        selectButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        return selectButton
    }()
    init(frame:CGRect,close_callBackValue:@escaping closeBackValue,Click_callBackValue:@escaping CallbackValue) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.myCloseBackValue = close_callBackValue
        self.myCallbackValue = Click_callBackValue
        self.addSubview(imageView)
        self.addSubview(closeButton)
        self.addSubview(selectButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func buttonClick( button:UIButton) -> Void {
        if button.tag == 1 {
            if myCloseBackValue != nil{
                myCloseBackValue!()
            }
            UIView.animate(withDuration: 0.5) {
                self.frame = CGRect.init(x: 0, y: CommonFunction.kScreenHeight, width: CommonFunction.kScreenWidth, height: CommonFunction.kScreenHeight)
            }
        }
        if button.tag == 2 {
            if myCallbackValue != nil {
                myCallbackValue!()
            }
        }
    }
}
