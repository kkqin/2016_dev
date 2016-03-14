//
//  ViewController.swift
//  ImageSample
//
//  Created by Gastby on 16/3/14.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadBundle(sender: UIButton) {
        let path = NSBundle.mainBundle().pathForResource("1", ofType: "jpg")
        let img = UIImage(contentsOfFile: path!)
        self.imageView.image = img
    }

    @IBAction func loadSandBox(sender: UIButton) {
        let path = self.applicationDocumentsDirectoryFile()
        self.imageView.image = UIImage(contentsOfFile: path)
    }
    
    //获取图片文件 FILE_NAME 在沙盒中的路径
    func applicationDocumentsDirectoryFile() -> String{
//        let documents
    }
    
    func createEditableCopyOfDatabaseIfNeeded(){
        let fileManager = NSFileManager.defaultManager()
        let writableDBPath = applicationDocumentsDirectoryFile()
        let dbexits = fileManager.fileExistsAtPath(writableDBPath)
        if !dbexits {
            let defaultDBPath = ((NSBundle.mainBundle().resourcePath)! as NSString).stringByAppendingPathComponent(FILE_NAME)        }
    }
}

