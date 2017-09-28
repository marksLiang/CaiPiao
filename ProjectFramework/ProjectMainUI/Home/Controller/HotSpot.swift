//
//  HotSpot.swift
//  ProjectFramework
//
//  Created by 梁元峰 on 2017/9/28.
//  Copyright © 2017年 HCY. All rights reserved.
//

import UIKit

class HotSpot: CustomTemplateViewController {
    /*******************XIB*********************/
    @IBOutlet weak var tableView: UITableView!
    /********************  属性  ********************/
    fileprivate let identifier   = "PulickNewsCell"
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }
    //MARK: tableViewDelegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PulickNewsCell
        return cell
    }
    //MARK: initUI
    private func initUI() -> Void{
        self.InitCongif(tableView)
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: CommonFunction.kScreenWidth, height: CommonFunction.kScreenHeight - 64 - 49)
        let requesterNib = UINib(nibName: "PulickNewsCell", bundle: nil)
        self.tableView.register(requesterNib, forCellReuseIdentifier: identifier)
        self.numberOfSections = 1
        self.numberOfRowsInSection = 10
        self.tableViewheightForRowAt = 90
    }
    

}
