//
//  AlertView.swift
//  ProHUD
//
//  Created by xaoxuu on 2019/7/29.
//  Copyright © 2019 Titan Studio. All rights reserved.
//

import UIKit

internal extension ProHUD.Alert {
    class Button: UIButton {
        class func actionButton(title: String?) -> UIButton {
            let btn = Button(type: .system)
            btn.setTitle(title, for: .normal)
            btn.layer.cornerRadius = alertConfig.cornerRadius / 2
            btn.titleLabel?.font = alertConfig.buttonFont
            return btn
        }
        
        func update(style: UIAlertAction.Style) {
            let pd = CGFloat(8)
            if style != .cancel {
                backgroundColor = dynamicColor.withAlphaComponent(0.04)
                contentEdgeInsets = .init(top: pd*1.5, left: pd*1.5, bottom: pd*1.5, right: pd*1.5)
            } else {
                contentEdgeInsets = .init(top: pd*0.5, left: pd*1.5, bottom: pd*0.5, right: pd*1.5)
            }
            switch style {
            case .default:
                setTitleColor(tintColor, for: .normal)
            case .destructive:
                setTitleColor(.init(red: 244/255, green: 67/255, blue: 54/255, alpha: 1), for: .normal)
            case .cancel:
                setTitleColor(UIColorForSecondaryLabel, for: .normal)
            @unknown default:
                break
            }
            tag = style.rawValue
        }
        
        class func minimizeButton() -> UIButton {
            let btn = Button(type: .system)
            let pd = alertConfig.padding/2
            btn.contentEdgeInsets = .init(top: pd*1.5, left: pd*1.5, bottom: pd*1.5, right: pd*1.5)
            btn.imageEdgeInsets.right = pd*1.5
            btn.setTitle(alertConfig.minimizeTitle, for: .normal)
            btn.setTitleColor(UIColor(red:1.00, green:0.55, blue:0.21, alpha:1.00), for: .normal)
            btn.titleLabel?.font = alertConfig.buttonFont
            return btn
        }
        
    }
    
}
