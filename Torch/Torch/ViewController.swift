//
//  ViewController.swift
//  Torch
//
//  Created by Gastby on 16/3/16.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toggleSwitch: UISwitch!
    
    @IBOutlet weak var brigtnessSlider: UISlider!
    
    @IBOutlet weak var lightSource: UIView!
    override func viewDidLoad() {
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        self.brigtnessSlider.value = userDefault.floatForKey("brightness")
        self.toggleSwitch.on = userDefault.boolForKey("onOff")
        
        if self.toggleSwitch.on{
            self.lightSource.alpha = CGFloat(self.brigtnessSlider.value)
        }else{
            self.lightSource.alpha = 0.0
        }
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setLightSourceAlpaValue(sender: UISlider) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setBool(self.toggleSwitch.on, forKey: "onOff")
        userDefault.setFloat(self.brigtnessSlider.value, forKey: "brightness")
        userDefault.synchronize()
        
        if self.toggleSwitch.on{
            self.lightSource.alpha = CGFloat(self.brigtnessSlider.value)
        }else{
            self.lightSource.alpha = 0.0
        }
    }

}

