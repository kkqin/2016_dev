//
//  MyEventListController.swift
//  otherCore
//
//  Created by Gastby on 16/3/21.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit
import CoreData
class MyEventListController: UITableViewController {

    var eventArray:NSMutableArray!
    var appDelegate:AppDelegate!
    
    @IBOutlet weak var deleteBtn: UIBarButtonItem!
    
    @IBAction func toggleDelete(sender: UIBarButtonItem) {
        if self.deleteBtn.title == "删除"
        {
            self.tableView.setEditing(true, animated: true)
            self.deleteBtn.title = "完成"
        }
        else
        {
            self.tableView.setEditing(false, animated: true)
            self.deleteBtn.title = "删除"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.appDelegate = (UIApplication.sharedApplication().delegate) as! AppDelegate
        
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //创建抓取数据请求对象
        let request:NSFetchRequest = NSFetchRequest()
        //设置要抓取数据的实体
        let entity:NSEntityDescription? = NSEntityDescription.entityForName("MyEvent", inManagedObjectContext: self.appDelegate.managedObjectContext!)
        
        request.entity = entity
        
        //执行抓取数据的请求,返回符合条件的数据
        do{
            let ab = try self.appDelegate.managedObjectContext?.executeFetchRequest(request)
            eventArray = NSMutableArray(array: ab!)
        }catch let er as NSError{
            print(er.userInfo)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eventArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Identifier", forIndexPath: indexPath)

        // Configure the cell...

        let test:MyEvent = eventArray![indexPath.row] as! MyEvent
        cell.textLabel?.text = test.name
        cell.detailTextLabel?.text = test.happenDate?.description
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "确认删除"
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let deleteEvent:MyEvent = eventArray[indexPath.row] as! MyEvent
            self.appDelegate.managedObjectContext?.deleteObject(deleteEvent)
            
            do{
                try self.appDelegate.managedObjectContext?.save()
                eventArray.removeObject(deleteEvent)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }catch let er as NSError{
                print("删除FKEvent实体出错: \(er), \(er.userInfo)")
            }
            

        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
