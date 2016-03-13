//
//  DatePickerViewController.swift
//  datePickFrame
//
//  Created by Gatsby on 16/3/13.
//  Copyright © 2016年 Gatsby. All rights reserved.
//

import UIKit

public class DatePickerViewController: UIViewController {

    @IBOutlet weak var datepick: UIDatePicker!
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cancelDate(sender: UIBarButtonItem) {
        self.hideInView()
    }
    
    @IBAction func doneDate(sender: UIBarButtonItem) {
        self.hideInView()
        let date =  self.datepick.date
        let dformater = NSDateFormatter()  //创建一个日期格式器
        dformater.dateFormat = "yyy年MM月dd日 HH:mm:ss"//确定日期格式器显示格式
        let dateStr = dformater.stringFromDate(date)//转换日期格式器为字符串
        print("select date :\(dateStr)")
    }
    
    public init()
    {
        let resourcesBundle = NSBundle(forClass: DatePickerViewController.self)
        
        super.init(nibName: "DatePickerViewController", bundle: resourcesBundle)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func hideInView()
    {
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.center = CGPointMake(self.view.center.x, 900)
            }, completion: nil )
    }

    public func showInView (superview : UIView)
    {
        if self.view.superview == nil
        {
        superview.addSubview(self.view)
        }
        self.view.center = CGPointMake(self.view.center.x,900)
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, superview.frame.size.width, self.view.frame.size.height)
        
        UIView.animateWithDuration(0.3, delay: 0.3, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.center = CGPointMake(superview.center.x, superview.frame.size.height - self.view.frame.size.height/2 )
            }, completion: nil)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
