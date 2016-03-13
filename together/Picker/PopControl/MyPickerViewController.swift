//
//  MyPickerViewController.swift
//  PopControl
//
//  Created by 13110100224 on 16/3/9.
//  Copyright © 2016年 13110100224. All rights reserved.
//

import UIKit

public  protocol MyPickerViewControllerDelegate
{
    func  myPickViewClose(selected : String)
}

public class MyPickerViewController: UIViewController  ,UIPickerViewDelegate , UIPickerViewDataSource{

    var  pickerData:NSArray!
    
    public var delegate:MyPickerViewControllerDelegate?
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func done(sender: UIBarButtonItem) {
        self.hideInView()
        
        let selectedIndex = self.picker.selectedRowInComponent(0)
        self.delegate?.myPickViewClose(self.pickerData[selectedIndex] as! String)
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
        
        self.hideInView()
    }
    
    public init()
    {
        let resourcesBundle = NSBundle(forClass: MyPickerViewController.self)
        
        super.init(nibName: "MyPickerViewController", bundle: resourcesBundle)
        
        self.pickerData = ["无成绩","优秀","良好","一般","及格","不及格"]
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return  1
    }
    
    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return  self.pickerData.count
    }
    
    
    public func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  self.pickerData[row] as? String
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
    
    
    public func hideInView()
    {
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.center = CGPointMake(self.view.center.x, 900)
            }, completion: nil )
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
