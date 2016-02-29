//
//  ViewController.swift
//  20160229new
//
//  Created by Gastby on 16/2/29.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(sender: UIBarButtonItem) {
        label.text = "save"
    }
    
    @IBAction func open(sender: UIBarButtonItem) {
        label.text = "open"
    }
}

