//
//  ViewController.swift
//  favicon
//
//  Created by abel on 15/10/10.
//  Copyright © 2015年 abel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var tableView:UITableView?
    let hosts = ["hangge.com","163.com","baidu.com","qq.com","taobao.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //初始化tableView
    func initView(){
        self.tableView = UITableView(frame:CGRectMake(0,20,self.view.frame.width,self.view.frame.height),style:UITableViewStyle.Plain)
        self.tableView!.dataSource = self
        self.tableView!.delegate = self
        self.tableView!.registerClass(FaviconTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
    }
    
    /**#pragma mark -- UITableViewDataSource**/
    //返回组数的代理方法
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //返回行数的代理方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hosts.count
    }
    //返回每一行cell的代理方法
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(ID) as? FaviconTableViewCell
            
            let host = hosts[indexPath.row]
            let url = NSURL(string: "http://\(host)/favicon.ico")
            cell!.url = url
        
            //设置cell的选中样式
            cell!.selectionStyle = UITableViewCellSelectionStyle.None
            //设置cell后面的箭头样式
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell!
        
    }

    
}

