//
//  TextFieldExtensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 03/04/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    
    /// Add a done button in the top of the keyboard inside a UIToolbar
    /// - Parameters:
    ///   - myAction: a Selector fot the done button
    ///   - textButton: The text to be display in the button
    ///   - target: A target for the selector
    public func addDoneButtonToKeyboard(myAction:Selector?, textButton : String, target: Any?){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: textButton, style: UIBarButtonItem.Style.done, target: target, action: myAction)
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.inputAccessoryView = doneToolbar
    }
    
}

