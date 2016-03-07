//
//  ViewController.swift
//  statictablegroup
//
//  Created by Gastby on 16/3/7.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "registerComplete:", name: "RegisterCompleteNotification", object: nil)
        
    }

    func registerComplete(notification:NSNotification){
        let data = notification.userInfo! as NSDictionary
        let username = data["username"]! as! String
        self.username.text = username
    }
    
    @IBAction func login_btn(sender: UIButton) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 2{
        
        }
    }
    
}