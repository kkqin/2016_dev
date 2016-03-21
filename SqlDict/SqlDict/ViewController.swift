//
//  ViewController.swift
//  SqlDict
//
//  Created by Gastby on 16/3/21.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordField: UITextField!
    @IBOutlet weak var detailField: UITextField!
    @IBOutlet weak var keyField: UITextField!
    @IBOutlet weak var result: UITextView!
    
    var db:SQLiteDB!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //关联文本框的方法
    @IBAction func finishEdit(sender: UITextField) {
    }

    @IBAction func addWord(sender: UIButton) {
        db.execute("create table if not exists t_dict(uid integer primary key, word varchar(20), detail varchar(50))")
        self.saveWord()
    }
    
    func saveWord() {
        let word = self.wordField.text
        let detail = self.detailField.text
        
        if word?.characters.count>0 && detail?.characters.count>0{
            let sql = "insert into t_dict(word, detail) values('\(word!)', '\(detail!)')"
            print(sql)
            db.execute(sql)
            print("sql insert succeed")
        }
    }
    
    @IBAction func showWord(sender: UIButton) {
//        let data = db.query("select * from t_dict")
//        if data.count > 0 {
//THE LASTEST DATA           
//            let user = data[data.count - 1]
//            self.result.text = String(format: "单词:%@ \n解释:%@", (user["wrod"] as! String), (user["detail"] as! String))}
//ALL DATA           for user in data {
//                self.result.text! += String(format: "单词:%@ \n解释:%@ \n", (user["wrod"] as! String), (user["detail"] as! String))
//
//            }
//        }
        
//        if self.keyField.text?.characters.count>0{
//            let sql = "select * from t_dict where word = '\(self.keyField.text!)'"
//            let data = db.query(sql)
//           
//            if data.count > 0 {
//                for user in data{
//                    self.result.text! += String(format: "单词:%@ \n解释:%@ \n", (user["wrod"] as! String), (user["detail"] as! String))
//                }
//            }
//        }
    }
}

