//
//  ROLogonRegPageViewController.swift
//  RuidaoOnline
//
//  Created by Gastby on 16/4/6.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit


class ROLogonRegPageViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var checkCode: UITextField!
    @IBOutlet weak var checkCodeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.checkCodeImage.userInteractionEnabled = true
        
        let recongizer = UITapGestureRecognizer(target: self, action: "checkImageClicked")
        
        self.checkImageClicked(recongizer)
        
    }

    func checkImageClicked(recognizer:UITapGestureRecognizer){
        print("clicked picture")
        let checkImgStr = "http://www.neuedu.cn/imgcode"
        let checkImgURL = NSURL(string: checkImgStr)
        
        let request = NSMutableURLRequest(URL: checkImgURL!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
        
        request.addValue("image/*", forHTTPHeaderField: "Accept")
        self.checkCodeImage.setImageWithURLRequest(request, placeholderImage: UIImage(named: "logo.png"), success: nil, failure: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //:MARK:取消按钮
    @IBAction func backToMainPage(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
        self.navigationController?.navigationBarHidden = true
    }
    
    @IBAction func logn(sender: UIButton) {
        if self.username.text?.characters.count == 0{
            MBProgressHUD.showDelayHUDToView(self.view, message: "no username")
        }else if self.password.text?.characters.count == 0{
            MBProgressHUD.showDelayHUDToView(self.view, message: "no password")
        }else{
            //POST 远端服务器
            let URLString = "http://www.neuedu.cn/m/mobileLogin!loginNeu.action"
            let parameters = ["username": self.username.text!,
                              "password":self.password.text!,
                              "imgCode":checkCode.text!]
            let manager = AFHTTPSessionManager()
            let request = AFHTTPRequestSerializer().requestWithMethod("POST", URLString: URLString, parameters: parameters, error: nil)
            
            let task = manager.dataTaskWithRequest(request, completionHandler: { (response, data, error) -> Void in
                if error == nil {
                    print(data)
                    let loginReturnDict = (data as! NSDictionary)["loginReturn"] as! NSDictionary
                    let loginFlag = loginReturnDict["loginFlag"] as! String
                    let msg = loginReturnDict["msg"] as? String
                    
                }else{
                    MBProgressHUD.showDelayHUDToView(self.view, message: "错误")
                }
            })
            
        }
    }
    
    /* 睿
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
