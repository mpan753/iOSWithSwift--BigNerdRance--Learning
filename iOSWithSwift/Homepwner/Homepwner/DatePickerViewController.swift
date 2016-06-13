//
//  DatePickerViewController.swift
//  Homepwner
//
//  Created by Mia on 6/12/16.
//  Copyright © 2016 Mia. All rights reserved.
//

import UIKit

protocol DatePickerDelegate : class {
    func dateDidUpdate(date: NSDate)
}

class DatePickerViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: DatePickerDelegate?
    
    var dateCreated: NSDate!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        datePicker.date = dateCreated
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("newDate: \(datePicker.date.description)")
        delegate?.dateDidUpdate(datePicker.date)
    }

}
