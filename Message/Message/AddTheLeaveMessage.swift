//
//  AddTheLeaveMessage.swift
//  Message
//
//  Created by Gatsby on 16/1/25.
//  Copyright © 2016年 Gatsby. All rights reserved.
//

import UIKit
import Alamofire

class AddTheLeaveMessage: UIViewController, UITextViewDelegate {
    
    var textview:UITextView!
    var lplacehold:UILabel!
    
    override func loadView() {
        super.loadView()

        textview = UITextView(frame: CGRectMake(0, 20, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height-100))
        textview.backgroundColor = UIColor.whiteColor()
        textview.font = UIFont(name: "Times", size: 20)
        textview.hidden = false
        textview.delegate = self
        textview.bounces = false
        self.view.addSubview(textview)
        
        lplacehold = UILabel(frame: CGRectMake(5,0, 150, 40))
        lplacehold.backgroundColor = UIColor.clearColor()
        lplacehold.text = "有什么想说？"
        lplacehold.enabled = false
        textview.addSubview(lplacehold)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        //let btn = UIBarButtonItem(image: UIImage(named: "exitadd.png"), landscapeImagePhone: nil, style: UIBarButtonItemStyle.Plain, target: self, action: Selector("exitAdd"))
        let btn = UIBarButtonItem(title: "❌", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("exitAdd"))
        self.navigationItem.leftBarButtonItem = btn
        let btn2 = UIBarButtonItem(title: "发表", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("doUpload"))
        let btn3 = UIBarButtonItem(title: "图片", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        var tn = [UIBarButtonItem]()
        tn.append(btn2)
        tn.append(btn3)
        self.navigationItem.rightBarButtonItems = tn
    }
    
    func exitAdd(){
        let alertView = UIAlertController(title: "关闭", message: "文字将不会保存", preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel
            , handler: nil))
        alertView.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: { (did:UIAlertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    func doUpload(){
       //Alamofire.upload(.POST, <#T##URLString: URLStringConvertible##URLStringConvertible#>, data: <#T##NSData#>)
    }
    
    func textViewDidChange(textView: UITextView) {
        if (textview.text.isEmpty) {
            lplacehold.text = "有什么想说？"
        }else{
            lplacehold.text = "";
        }
    }
}
