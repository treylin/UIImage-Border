//
//  ImageHelper.swift
//  Border
//
//  Created by Trey Lin on 2018/11/23.
//  Copyright © 2018 linzetao. All rights reserved.
//

import Foundation
import UIKit

public enum ImageOrientation {
    case horizontal, vertical
}

public extension UIImage {
    var orientation: ImageOrientation {
        get {
            return self.size.width > self.size.height ? .horizontal : .vertical
        }
    }
    
    func applyBorder(borderWidth: CGFloat, borderColor: UIColor) -> UIImage? {
        let newWidth = Int(self.size.width + 2 * borderWidth)
        let newHeight = Int(self.size.height + 2 * borderWidth)
        let imageRect = CGRect(x: borderWidth, y: borderWidth, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height: newHeight))
        let ctx = UIGraphicsGetCurrentContext()
        ctx!.saveGState()
        ctx!.setFillColor(borderColor.cgColor)
        ctx!.fill(CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        ctx!.restoreGState()
        self.draw(in: imageRect)
        let img = UIGraphicsGetImageFromCurrentImageContext();
        return img;
    }
    
    func apply4By5Border(borderWidth: CGFloat, borderColor: UIColor, orientation: ImageOrientation) -> UIImage? {
        var newWidth  = 0
        var newHeight = 0
        if (orientation == .horizontal) {
            newWidth  = 5000
            newHeight = 4000
        } else {
            newWidth  = 4000
            newHeight = 5000
        }
        
        let imageRect = CGRect(x: borderWidth, y: borderWidth, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        let ctx = UIGraphicsGetCurrentContext()
        ctx!.saveGState()
        ctx!.setFillColor(borderColor.cgColor)
        ctx!.fill(CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        ctx!.restoreGState()
        self.draw(in: imageRect)
        let img = UIGraphicsGetImageFromCurrentImageContext();
        return img;
    }
}
