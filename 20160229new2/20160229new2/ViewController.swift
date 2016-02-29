//
//  ViewController.swift
//  20160229new2
//
//  Created by Gastby on 16/2/29.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var listTeams : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = NSBundle.mainBundle().pathForResource("team", ofType: "plist")//获取属性列表文件中的全部数据
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //UITableViewDataSource协议方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.listTeams.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellIdentifier = "Cellidentifier"
        
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)! as UITableViewCell
        
        let row = indexPath.row
        let rowDict = self.listTeams[row] as! NSDictionary
        cell.textLabel?.text = rowDict["name"] as? String
        
        let imagePath = String(format: "%@.png", rowDict["image"] as! String)
        cell.imageView?.image = UIImage(named: imagePath)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }

}

