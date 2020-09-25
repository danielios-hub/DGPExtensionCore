//
//  ImageExtensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 03/04/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func fixOrientationMine() -> UIImage {
        
        if self.imageOrientation == .up {
            return self
        } else {
            var transform = CGAffineTransform.identity
            
            switch self.imageOrientation {
            case UIImageOrientation.down:
                transform = transform.translatedBy(x: self.size.width, y: self.size.height)
                transform = transform.rotated(by: CGFloat.pi)
            case UIImageOrientation.downMirrored:
                transform = transform.translatedBy(x: self.size.width, y: self.size.height)
                transform = transform.rotated(by: CGFloat.pi);
            case UIImageOrientation.left:
                transform = transform.translatedBy(x: self.size.width, y: 0)
                transform = transform.rotated(by: CGFloat.pi);
            case UIImageOrientation.leftMirrored:
                transform = transform.translatedBy(x: self.size.width, y: 0)
                transform = transform.rotated(by: CGFloat.pi / 2.0)
            case UIImageOrientation.right:
                transform = transform.translatedBy(x: 0, y: self.size.height)
                transform = transform.rotated(by: -CGFloat.pi / 2.0)
            case UIImageOrientation.rightMirrored:
                transform = transform.translatedBy(x: 0, y: self.size.height)
                transform = transform.rotated(by: -CGFloat.pi / 2.0)
            default:
                break
            }
            
            switch (self.imageOrientation) {
            case UIImageOrientation.upMirrored:
                transform = transform.translatedBy(x: self.size.width, y: 0);
                transform = transform.scaledBy(x: -1, y: 1)
            case UIImageOrientation.downMirrored:
                transform = transform.translatedBy(x: self.size.width, y: 0);
                transform = transform.scaledBy(x: -1, y: 1)
                break
            case UIImageOrientation.leftMirrored:
                transform = transform.translatedBy(x: self.size.height, y: 0);
                transform = transform.scaledBy(x: -1, y: 1)
            case UIImageOrientation.rightMirrored:
                transform = transform.translatedBy(x: self.size.height, y: 0)
                transform = transform.scaledBy(x: -1, y: 1)
                break
            default:
                break
            }
            
            let ctx = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: (self.cgImage?.bitsPerComponent)!, bytesPerRow: 0, space: (self.cgImage?.colorSpace!)!, bitmapInfo: (self.cgImage?.bitmapInfo.rawValue)!)
            
            ctx?.concatenate(transform)
            
            switch (self.imageOrientation) {
                case UIImageOrientation.left:
                    ctx?.draw(self.cgImage!, in: CGRect(x: 0,y: 0,width: self.size.height,height: self.size.width));
                case UIImageOrientation.leftMirrored:
                    ctx?.draw(self.cgImage!, in: CGRect(x: 0,y: 0,width: self.size.height,height: self.size.width));
                case UIImageOrientation.right:
                    ctx?.draw(self.cgImage!, in: CGRect(x: 0,y: 0,width: self.size.height,height: self.size.width));
                case UIImageOrientation.rightMirrored:
                    // Grr...
                    ctx?.draw(self.cgImage!, in: CGRect(x: 0,y: 0,width: self.size.height,height: self.size.width));
                    break;
                default:
                    ctx?.draw(self.cgImage!, in: CGRect(x: 0,y: 0,width: self.size.width,height: self.size.height));
                    break;
            }
            
            let cgimg = ctx?.makeImage()
            let im = UIImage(cgImage: cgimg!)
            return im
        }
    }
    
    func scaledToSize(_ size: CGSize) -> UIImage {
        _ = UIGraphicsBeginImageContext(size)
        _ = UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(x: 0,y: 0, width: size.width,height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func imageWithColor(_ tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()! as CGContext
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context.clip(to: rect, mask: self.cgImage!)
        tintColor.setFill()
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        return newImage
    }
}
