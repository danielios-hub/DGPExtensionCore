//
//  UrlExtensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 03/04/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation
import UIKit

extension URL {
    
    /// Check if the extension of the url if in any of the types ["png", "jpg", "jpeg", "gif", "bmp"]
    /// - Returns: A bool value indicating the result
    public func isUrlImg() -> Bool {
        let imageExtensions = ["png", "jpg", "jpeg", "gif", "bmp"]
       
        if imageExtensions.contains(self.pathExtension) {
            return true
        }
        
        return false
    }
    
    /// Check if the extension of the url is .gif
    /// - Returns: A bool value indicating the result
    public func isGif() -> Bool {
        return self.pathExtension.contains("gif")
    }
    
    /// Check if the extension of the url is .mp4
    /// - Returns: A bool value indicating the result
    public func isUrlVideo() -> Bool {
        let videoExtensions = ["mp4"]
        return videoExtensions.contains(self.pathExtension)
    }
    
    /// check if the URL contains parameters with a particular name
    /// - Parameter param: the name of the parameter in the url
    /// - Returns: an optional String with the value of the parameter or nil if not exists
    public func getParam(param: String) -> String? {
        let urlComponents: URLComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)!
        if let queryItems = urlComponents.queryItems {
            for item in queryItems {
                if item.name == param {
                    return item.value
                }
            }
        }
        
        return nil
    }
    
    /// check if the url contains width and height parameters
    /// - Returns: an optional CGSize with the value of the parameters or nil if not exists
    public func getSizeParameters() -> CGSize? {
        var width : CGFloat? = nil
        var height : CGFloat? = nil
        let paramWidth = "width"
        let paramHeight = "height"
        
        let urlComponents: URLComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)!
        if let queryItems = urlComponents.queryItems {
            for item in queryItems {
                if let value = item.value {
                    if item.name == paramWidth {
                        if let number = NumberFormatter().number(from: value) {
                            width = CGFloat(truncating: number)
                        }
                    } else if item.name == paramHeight {
                        if let number = NumberFormatter().number(from: value) {
                            height = CGFloat(truncating: number)
                        }
                    }
                }
            }
        }
        
        if let width = width, let height = height {
            return CGSize(width: width, height: height)
        }
        
        return nil
    }
}
