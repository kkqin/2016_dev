//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Gastby on 16/3/9.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageTrashFull : UIImage!
    var imageTrashEmpty : UIImage!
    
    var boolTrashEmptyFlag = false//垃圾桶空标志,false is full
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bundle = NSBundle.mainBundle()
        let imageTrashFullPath = bundle.pathForResource("full", ofType: "jpg")
        let imageTrashEmptyPath = bundle.pathForResource("empty", ofType: "jpg")
        self.imageTrashFull = UIImage(contentsOfFile: imageTrashFullPath!)
        self.imageTrashEmpty = UIImage(contentsOfFile: imageTrashEmptyPath!)
        
        self.imageView.image = self.imageTrashFull
        self.imageView.userInteractionEnabled = true
        
    }

    @IBAction func tapRecognizer(sender: UITapGestureRecognizer) {
        print("long pressed gesture state = \(sender.state.rawValue)")
        if sender.state == UIGestureRecognizerState.Began{
            self.imageView.image = self.imageTrashFull
            boolTrashEmptyFlag = false
        }else{
            self.imageView.image = self.imageTrashEmpty
            boolTrashEmptyFlag = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

