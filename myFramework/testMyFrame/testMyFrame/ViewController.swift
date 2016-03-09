//
//  ViewController.swift
//  testMyFrame
//
//  Created by Gastby on 16/3/9.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit
import myFramework

class ViewController: UIViewController , MyPickerViewCOntrollerDelegate{
    
    var picker = MyPickerViewController()//自定义框架里选择器类
    
    @IBAction func clicked(sender: UIButton) {
        self.picker.showInView(self.view)
    }
    
    //实现MyPickerViewCOntrollerDelegate协议的方法
    func myPickerViewClose(selected: String) {
        print("selected \(selected)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

