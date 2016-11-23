//
//  DataManager.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/27/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseStorage

let single = DataManager()

class DataManager: NSObject {
    
    var ref = FIRDatabase.database().reference()
    var storeRef = FIRStorage.storage().reference()
    
    var items: NSMutableDictionary = ["0":"Upcoming Appointments", "1":"Log Out", "didSelect": 0]
    
    var referenceStr = "o8GCshuaUieenxLhcI8ampnaZC63"
    
    
    class var shareManager : DataManager {
        return single
    }
    
    func insertUser(emial : String, accessToken : String){
        let tempRef = ref.child("engineerApp").child("user-info").childByAutoId()
        tempRef.setValue(["email":emial, "token":accessToken])
        //        tempRef.updateChildValues([tempRef.childByAutoId():["email":emial, "token":accessToken]])
    }
    
    func fetchInvoiceData(appointModel: AppointmentModel,  successHandler : @escaping ReturnBlock, failHandeler : @escaping ReturnBlock) {
        let detailRef = ref.child("engineerApp/appointment-invoices").child(appointModel.appointmentId)
        detailRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                let invoiceModel: InvoicesModel = InvoicesModel()
                let dic = snapshot.value as? NSDictionary
                invoiceModel.parseDicToSelf(dic: dic!)
                successHandler(invoiceModel)
            } else {
                failHandeler("err" as AnyObject)
            }
        }, withCancel: { (error) in
            
        })
        
    }
}
