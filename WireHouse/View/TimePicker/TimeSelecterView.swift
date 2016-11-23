//
//  TimeSelecterView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/15/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class TimeSelecterView: UIView {

    @IBOutlet weak var timeBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    var timeSelected : Date?
    var datePicker : CustomPickerView?

    var timeUpdateHandler : ReturnBlock?
    func initUI(title : String, time : Date){
        timeSelected = time
        titleLbl.text = title
        timeBtn.setTitle(StringUtil.getStringFromDate(date: time, format: "HH:mm"), for: .normal)
    }
    
    @IBAction func btnTapped(_ sender: AnyObject) {
        self.datePicker = Bundle.main.loadNibNamed("CustomPickerView", owner: self, options: nil)?[0] as? CustomPickerView
        self.datePicker?.frame = (self.window?.bounds)!
        self.datePicker?.createDatePickerView(title: "Select Date", date: timeSelected!)
        self.window!.addSubview(self.datePicker!)
        
        self.datePicker?.cancelHandler = {
            self.datePicker?.removeFromSuperview()
            self.datePicker = nil
        }
        
        self.datePicker?.doneHandler = {(obj : AnyObject) -> () in
            self.timeSelected = (obj as? Date)!
            self.timeBtn.setTitle(StringUtil.getStringFromDate(date: self.timeSelected!, format: "HH:mm"), for: .normal)
            self.datePicker?.removeFromSuperview()
            self.datePicker = nil
            if self.timeUpdateHandler != nil
            {
                self.timeUpdateHandler!(self.timeSelected as AnyObject)
            }
        }
    }
}
