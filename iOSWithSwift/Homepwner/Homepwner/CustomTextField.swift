//
//  CustomTextField.swift
//  Homepwner
//
//  Created by Mia on 6/12/16.
//  Copyright © 2016 Mia. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        self.borderStyle = .Line
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        self.borderStyle = .RoundedRect
        
        return true
    }
}
