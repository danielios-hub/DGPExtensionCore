//
//  NavigationItemExtension.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 03/07/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import UIKit 

extension UINavigationItem {
    
    //call from the nav which is pushing, not the pushed
    func hideTitleBackButton() {
        self.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
