//
//  AddEventController.swift
//  otherCore
//
//  Created by Gastby on 16/3/21.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit
import CoreData

class AddEventController: UIViewController {

    @IBOutlet weak var eventField: UITextField!
    
    var appDelegate:AppDelegate!
    var eventArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.appDelegate = (UIApplication.sharedApplication().delegate) as! AppDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //文本框事件
    @IBAction func finishEdit(sender: AnyObject) {
        sender.resignFirstResponder()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let eventName:String? = self.eventField.text
        if eventName != nil && eventName!.characters.count > 0 {
            let newEvent:MyEvent = NSEntityDescription.insertNewObjectForEntityForName("MyEvent", inManagedObjectContext: appDelegate.managedObjectContext!) as! MyEvent
           
            newEvent.name = eventName
            newEvent.happenDate = NSDate(timeIntervalSinceNow: 0)
        
            do {
                try self.appDelegate.managedObjectContext?.save()
                
                //let actionSheet = UIActionSheet(title: "保存成功", delegate: nil, cancelButtonTitle: "sure", destructiveButtonTitle: nil)
                //actionSheet.showInView(self.view)
                let actionSheet = UIAlertController(title: "保存成功", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
                actionSheet.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(actionSheet, animated: true, completion: nil)
                
            } catch let er as NSError{
                print("save \(er)")
            }
            
        }
    }

}
