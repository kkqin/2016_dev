//
//  AppDelegate.swift
//  otherCore
//
//  Created by Gastby on 16/3/21.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //托管对象上下文
    var managedObjectContext: NSManagedObjectContext?
    //托管对象模型
    var managedObjectModel: NSManagedObjectModel?
    //持久话存储协调器
    var persistenStoreCoordinator:NSPersistentStoreCoordinator?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.managedObjectContext = initManagedObjectContext()
        self.managedObjectModel = initManagedObjectModel()
        self.persistenStoreCoordinator = initPersistenStoreCoordinator()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func saveContext () {
        let managedObjectContext:NSManagedObjectContext? = self.managedObjectContext
        if managedObjectContext != nil{
            if managedObjectContext!.hasChanges{
                do {try self.managedObjectContext!.save()}catch let er as NSError{
                    print("Unresolved error \(er), \(er.userInfo)")
                    abort()
                }
            }
        }
    }
    
    //初始化应用的托管对象上下文
    func initManagedObjectContext() -> NSManagedObjectContext{
        //如果_managedObjectContext已经被初始化过，直接返回该对象
        if self.managedObjectContext != nil {
            return self.managedObjectContext!
        }
        let coordinator:NSPersistentStoreCoordinator? = self.initPersistenStoreCoordinator()
        //获取持久化存储协调器
        if coordinator != nil {
            self.managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
            //为NSManagedObjectContext对象设置持久化存储协调器
            self.managedObjectContext?.persistentStoreCoordinator = coordinator
        }
        
        return self.managedObjectContext!
    }
    
    //MAKR: 初始化托管对象
    func initManagedObjectModel() -> NSManagedObjectModel{
        if self.managedObjectModel != nil {
            return self.managedObjectModel!
        }
        //获取实体模型文件对应的NSURL
        let modelURL:NSURL = NSBundle.mainBundle().URLForResource("Model", withExtension: "momd")!
        //加载应用的尸体模型文件，并初始化NSmanagedObjectModel对象
        self.managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL)
        
        return self.managedObjectModel!
    }
    
    //返回应用的持久化存储协调器对象
    func initPersistenStoreCoordinator() ->NSPersistentStoreCoordinator{
        if self.persistenStoreCoordinator != nil {
            return self.persistenStoreCoordinator!
        }
        let storeURL:NSURL = self.applicationDocumentsDirectory().URLByAppendingPathComponent("Books.sqlite")
        self.persistenStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.initManagedObjectModel())
        
        do {
            try self.persistenStoreCoordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch let er as NSError {
            print("Unresolved error \(er), \(er.userInfo)")
            abort()
        }
        return self.persistenStoreCoordinator!
    }

    func applicationDocumentsDirectory() -> NSURL {
        return NSFileManager.defaultManager().URLsForDirectory(.DocumentationDirectory, inDomains: .UserDomainMask).last!
    }
    
}

