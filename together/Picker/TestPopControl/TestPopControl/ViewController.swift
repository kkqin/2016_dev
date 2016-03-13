//
//  ViewController.swift
//  TestPopControl
//
//  Created by 13110100224 on 16/3/9.
//  Copyright © 2016年 13110100224. All rights reserved.
//

import UIKit
import PopControl
import datePickFrame

class ViewController: UIViewController , MyPickerViewControllerDelegate {

    
    var picker = MyPickerViewController()
    var datepick = DatePickerViewController()
    
    @IBAction func clicked(sender: UIButton) {
        self.picker.showInView(self.view)
    }
    
    @IBAction func clickedMyself(sender: UIButton) {
        self.datepick.showInView(self.view)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.picker.delegate = self
    }
    
    func myPickViewClose(selected: String) {
        print("selected \(selected)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

