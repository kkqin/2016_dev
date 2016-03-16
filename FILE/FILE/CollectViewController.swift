//
//  CollectViewController.swift
//  FILE
//
//  Created by Gastby on 16/3/16.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit

class CollectViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailBox: UITextField!
    @IBOutlet weak var resultView: UITextView!
    
    var _fileManager = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.firstName.delegate = self
        self.lastName.delegate = self
        self.emailBox.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func store(sender: UIButton) {
        //提取信息
        let csvLine = String(format: "%@, %@, %@\n", self.firstName.text!, self.lastName.text!,
            self.emailBox.text!)
        
        let documentPath = _fileManager.dirDoc()
        let surveyFile = documentPath+"/survey.csv"
        
        let manager = NSFileManager.defaultManager()//文件管理器
        if !manager.fileExistsAtPath(surveyFile){
            manager.createFileAtPath(surveyFile, contents: nil, attributes: nil)
        }
        //文件处理器
        let fileHandler = NSFileHandle(forUpdatingAtPath: surveyFile)
        
        fileHandler?.seekToEndOfFile()//末尾追加
        fileHandler?.writeData(csvLine.dataUsingEncoding(NSUTF8StringEncoding)!)
        
        fileHandler?.closeFile()
        self.firstName.text = ""
        self.lastName.text = ""
        self.emailBox.text = ""
    }

    @IBAction func showResult(sender: UIButton) {
        let documentPath = _fileManager.dirDoc()
        let surveyFile = documentPath+"/survey.csv"//从这个位置读
        
        let manager = NSFileManager.defaultManager()
        
        if manager.fileExistsAtPath(surveyFile){
            let fileHandler = NSFileHandle(forReadingAtPath: surveyFile)
            let data = fileHandler?.availableData
            self.resultView.text = String(data:data!, encoding: NSUTF8StringEncoding)
            fileHandler?.closeFile()
        }

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
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
