//
//  CustomPickerView.swift
//  BusinessOS
//
//  Created by Jian Zhang on 10/28/15.
//  Copyright © 2015 PwC. All rights reserved.
//

import UIKit

typealias cancelBlock = ()->()
typealias doneBlock = (AnyObject) ->()

class CustomPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerContainer: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    var termArr  = NSArray()
    var termPicker : UIPickerView?
    var datePicker : UIDatePicker?
    
    var cancelHandler : cancelBlock?
    var doneHandler : doneBlock?
    
    var selectedStr = ""
    var selectedDate = Date()
    
    func createTermPickerView(title : String,arr : NSArray)
    {
        self.layoutIfNeeded()
        termArr = arr
        
        titleLbl.text = title
        termPicker = UIPickerView(frame: pickerContainer.bounds)
        termPicker?.delegate = self
        termPicker?.dataSource = self
        pickerContainer.addSubview(termPicker!)
        selectedStr = arr[0] as! String
    }
    
    func createDatePickerView(title : String, date : Date)
    {
        self.layoutIfNeeded()
        
        selectedDate = date
        
        titleLbl.text = title
        datePicker = UIDatePicker(frame: pickerContainer.bounds)
        datePicker?.datePickerMode = UIDatePickerMode.time
        datePicker?.date = date
        pickerContainer.addSubview(datePicker!)
    }
    
    @IBAction func cancelTapped(_ sender: AnyObject) {
        self.removeFromSuperview()
        if self.cancelHandler != nil
        {
            self.cancelHandler!()
        }
    }
    @IBAction func doneTapped(_ sender: AnyObject) {
        if datePicker != nil
        {
            //Date Picker
            if self.doneHandler != nil
            {
                self.doneHandler!((datePicker?.date)! as AnyObject)
            }
        }
        else
        {
            //Term Picker
            if self.doneHandler != nil
            {
                self.doneHandler!(self.selectedStr as AnyObject)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return termArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.termArr[row] as? String
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedStr = termArr[row] as! String
    }
    
}
