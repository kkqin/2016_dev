//
//  ViewController.swift
//  FILE
//
//  Created by Gastby on 16/3/16.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //返回documents目录的全地址
    func dirDoc() -> String {
        //1.
        //let path = NSHomeDirectory() + "/Documents"; return path
        //2.
        //let path = (NSHomeDirectory() as NSString).stringByAppendingPathComponent("Documents") ; return path
        //3.
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)
        let path = paths[0]
        return path
    }
    
    //返回Library目录全地址
    func dirLib()->String{
        let paths = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true)
        return paths[0]
    }
    
    //返回Caches目录的地址
    func dirCaches() -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
        return paths[0]
    }
    
    //返回tmp
    func ditTmp()->String{
        return NSTemporaryDirectory()
    }
    
    //创建文件夹，在documents目录下创建
    func createDir(dir:String){
        let documentsPath = self.dirDoc()
        let testDirectory = documentsPath + "/" + dir
        
        let fileManager = NSFileManager.defaultManager()
        
        do{
            try fileManager.createDirectoryAtPath(testDirectory, withIntermediateDirectories: true, attributes: nil)
        }catch{
            print("fail")
        }
    }
    
    //创建文件，在某个目录下创建
    func createFile(filePath:String, fileName:String){
        let fileManager = NSFileManager.defaultManager()
        let testPath = filePath.stringByAppendingString("/\(fileName)")
       let success = fileManager.createFileAtPath(testPath, contents: nil, attributes: nil)
        if success {
            print("yep")
        }else{
            print("oops")
        }
    }
    
    //获取文件属性
    func fileAttibutes(filePath:String, fileName:String){
        let fileManager = NSFileManager.defaultManager()
        var fileAttrs = [String:AnyObject]()
        do{
            fileAttrs = try fileManager.attributesOfItemAtPath(filePath + "/" + fileName)
            for key in fileAttrs.keys{
                print("key:\(key), value:\(fileAttrs[key]!)")
            }
        }
        catch{}
    }
    
    //删除文件
    func deleteFile(filePath:String, fileName:String) -> Bool{
        let fileManager = NSFileManager.defaultManager()
        let  testPath = filePath + "/" + fileName
        if fileManager.fileExistsAtPath(testPath){
            do{
                try fileManager.removeItemAtPath(testPath)
                return true
            }catch{
                print("删除文件失败")
                return false
            }
        }else{
            print("文件不存在")
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = NSHomeDirectory()
        print(home)
        
        let product = Product()
        product.productId = 1
        product.name = "IPhone6s"
        product.price = 6000
        
        //1.对文本文件的读写
        let docPath = self.dirDoc()
        let fileName = "product.txt"
        let filePath = docPath + "/" + fileName

        let fileManager = NSFileManager.defaultManager()//文件管理器
        if fileManager.fileExistsAtPath(filePath){
            print("yep")
            do {
                let content = try String(contentsOfFile: filePath)
                print(content)
            } catch {}
        }else{
            print("no exists")
            let content = String(format: "%i, %@, %g", product.productId, product.name, product.price)
            
            try! content.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
        }
        
        //2.对plist 文件的读写
        let info = [product.name, product.price]
        let idStr = String(format: "%d", product.productId)//Int转化为String
        let myDic:NSMutableDictionary = [idStr:info]
        
        let plistPath = docPath + "/product.plist"
        
        if !fileManager.fileExistsAtPath(plistPath) {
            myDic.writeToFile(plistPath, atomically: true)//直接创建了plist文件
        }else{
            let result = NSMutableDictionary(contentsOfFile: plistPath)
            print(result)
        }
        
        //print(self.dirDoc())
        //createDir("first/2/4")
        
        //let docPath = self.dirDoc()
        //createFile(docPath, fileName: "hello.txt")
        //deleteFile(self.dirDoc(), fileName: "hello.txt")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

