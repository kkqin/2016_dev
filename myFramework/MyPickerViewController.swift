//
//  MyPickerViewController.swift
//  myFramework
//
//  Created by Gastby on 16/3/9.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit

public protocol MyPickerViewCOntrollerDelegate{
    func myPickerViewClose(selected :String)
}

public class MyPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var pickerData:NSArray!
    
    public var delegate:MyPickerViewCOntrollerDelegate?
    
    @IBOutlet weak var pickerview: UIPickerView!
    
    //定义构造器
    public init(){
        //获取的资源目录是MyPickerViewController类所在的目录
        let resourcesBundle = NSBundle(forClass: MyPickerViewController.self)
        //通过Xib文件名调用父类构造器
        super.init(nibName: "MyPickerViewController", bundle: resourcesBundle)
        self.pickerData = ["价格不限", "0-1000","1000-2000","2000-3000","3000-5000"]
    }
    
    required public init?(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
        fatalError("sd")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.hideInView()
    }
    

    @IBAction func done(sender: UIBarButtonItem) {
        self.hideInView()
        //获取第一个拨轮中的索引
        let selectedIndex = self.pickerview.selectedRowInComponent(0)
        //调用委托对象方法
        self.delegate?.myPickerViewClose(self.pickerData[selectedIndex] as! String)
    }
    
    //show the view
    public func showInView(superview:UIView){
        if self.view.superview == nil {
            superview.addSubview(self.view)
        }
        //调整控件的中心位置， 让它在屏幕外
        self.view.center = CGPointMake(self.view.center.x, 900)
        //重新调整控件的大小，根据运行屏幕的大小
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, superview.frame.size.width, self.view.frame.size.height)
        //以动画方式显示试图，动画持续时间，延迟时间，效果，执行动画时用闭包，动画完成时调用闭包
        UIView.animateWithDuration(0.3, delay: 0.3, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.center = CGPointMake(superview.center.x, superview.frame.size.height - self.view.frame.size.height/2)//保证控件下边界与父视图下边界对齐
            }, completion: nil)
        
    }
    
    //hidden the view
    public func hideInView(){
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.center = CGPointMake(self.view.center.x, 900)
            }, completion: nil)
    }
    
    //datasource
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return self.pickerData.count
    }
    
    //pickerview Delegate
    public func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return self.pickerData[row] as? String
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
