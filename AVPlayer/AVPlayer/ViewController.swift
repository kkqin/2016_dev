//
//  ViewController.swift
//  AVPlayer
//
//  Created by Gastby on 16/3/14.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices

class ViewController: UIViewController,AVAudioPlayerDelegate, UIImagePickerControllerDelegate, UINavigationBarDelegate {

    var playerController:AVPlayerViewController!
    //local
    
    var recorder:AVAudioRecorder!//录音🐔
    var player:AVAudioPlayer!//播放器
    
    @IBAction func localplay(sender: UIButton) {
        if self.playerController == nil{
        //十里花
        self.playerController = AVPlayerViewController()
        //播放器 mov, m4v
        let path = NSBundle.mainBundle().pathForResource("FOTB111", ofType: "m4v")!
        //print(path)
        self.playerController.player = AVPlayer(URL: NSURL(fileURLWithPath: path))
        //显示播放界面，同时进行播放
        self.presentViewController(self.playerController, animated: true, completion: {
            () -> Void in
            self.playerController.player?.play()
            })
        }
    }
    
    //Internet
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject?){
        let destination = segue.destinationViewController as! AVPlayerViewController
        let url = NSURL(string: "https://r17---sn-a5m7ln7z.googlevideo.com/videoplayback?expire=1457942838&ipbits=0&mime=video/mp4&pl=23&mt=1457921123&mv=u&ms=au&itag=18&upn=_hqdU5DA2n8&sparams=dur,id,ip,ipbits,itag,lmt,mime,mm,mn,ms,mv,nh,pl,ratebypass,requiressl,source,upn,expire&mm=31&mn=sn-a5m7ln7z&fexp=9408491,9412913,9416126,9418581,9420095,9420452,9422596,9423661,9423662,9427602,9428331,9429265,9429298,9429351,9431140,9431192&id=o-AOLdnGVvpjdc9TkhL1Ef1-EKhdKVw7whTZQUxYOBcQkg&sver=3&ip=45.62.112.95&requiressl=yes&ratebypass=yes&source=youtube&dur=366.875&lmt=1445682514849896&key=yt6&nh=IgpwcjAyLmxheDAyKgkxMjcuMC4wLjE&signature=CE01960DCBD5BD7FDB92DB0293F46A7590E94633.AA746BC62AB2CBFF19A4B5819465AF3BA78D6A3A&title=Adele+-+Hello")//http://vod.cdn1.v.17173.com/11dd00e1fa1af1ce00e66dd493ee5600e518280719005d3c/cx2/FLVList/20160313/1/112336192_32716541_1.mp4
        dispatch_async(dispatch_get_main_queue()) {
        () -> Void in
            destination.player = AVPlayer(URL: url!)
        }
    }
    
    //录音功能
    @IBAction func audioRecord(sender: UIButton) {
        if recorder == nil{
            var settings = [String:Int]()
            //录音格式
            settings[AVFormatIDKey] = Int(kAudioFormatLinearPCM)
            settings[AVSampleRateKey] = 44100//采样频率
            settings[AVNumberOfChannelsKey] = 1//声道数量
            settings[AVLinearPCMBitDepthKey] = 16//采样位数
            settings[AVLinearPCMIsBigEndianKey] = 0//音频编码是小字节
            settings[AVLinearPCMIsFloatKey] = 0//音频解码不是浮点数
            //获取沙盒中Document目录下录音文件的路径
            //let filePath = String(format: "%@/rec.caf", arguments: [self.doCumentDirectory()])
            let filePath = String(format: "%@/rec.caf", self.doCumentDirectory())
            let fileUrl = NSURL.fileURLWithPath(filePath)
            //初始化录音机
            do{
                self.recorder = try AVAudioRecorder(URL: fileUrl, settings: settings)
            }catch let er as NSError{
                print(er.description)//错误的描述输出
                self.recorder = nil
            }
            
            //录音控制
            if self.recorder.recording{
                return
            }
            
            if self.player != nil && self.player.playing{
                self.player.stop()
            }
            
            self.recorder.record()
        }
        
    }
    @IBAction func stop(sender: UIButton) {
        //stop recorder
        if self.recorder != nil && self.recorder.recording{
            self.recorder.stop()
            self.recorder.delegate = nil
            self.recorder = nil
        }
        //stop play
        if self.player != nil && self.player.playing{
            self.player.stop()
        }
    }
    
    @IBAction func play(sender: UIButton) {
        //stop recorder
        if self.recorder != nil && self.recorder.recording{
            self.recorder.stop()
            self.recorder.delegate = nil
            self.recorder = nil
        }
        //stop play
        if self.player != nil && self.player.playing{
            self.player.stop()
        }
        
        //play the recorder
        let filePath = String(format: "%@/rec.caf", self.doCumentDirectory())
        let fileUrl = NSURL.fileURLWithPath(filePath)
        //初始化播放器
        do{
            self.player = try AVAudioPlayer(contentsOfURL: fileUrl)
            self.player.play()
        }catch let er as NSError{
            print(er.description)
            self.player = nil
        }
    }
    
    func doCumentDirectory() -> String{
        let paths:NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        //return paths[0] as! String
        return paths.firstObject as! String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

