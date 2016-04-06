//
//  ROHUD+MBProgressHUD.swift
//  RuidaoOnline
//
//  Created by Gastby on 16/4/6.
//  Copyright © 2016年 Gastby. All rights reserved.
//

import Foundation

extension MBProgressHUD{
    
    static func showDelayHUDToView(view:UIView, message:String){
        let hud = MBProgressHUD(view:view)
        view.addSubview(hud)
        hud.yOffset = Float(view.frame.size.height)/4
        hud.customView = UIImageView(frame: CGRectZero)
        hud.mode = MBProgressHUDMode.CustomView
        hud.labelText = message
        hud.show(true)
        hud.hide(true,afterDelay:1.0)
    }
}
