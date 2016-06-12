//
//  DatePickerViewController.swift
//  Homepwner
//
//  Created by Mia on 6/12/16.
//  Copyright © 2016 Mia. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var dateCreated: NSDate!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        datePicker.date = dateCreated
    }

}
