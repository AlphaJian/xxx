//
//  InvoicesModel.swift
//  LarsonApp
//
//  Created by appledev110 on 10/28/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class InvoicesModel: NSObject {
    var amountDue: Double = 0.0
    var amountEquipment: Int = 0
    var amountLabor: Int = 0
    var amountMaterial: Double = 0.0
    var amountOther: Int = 0
    var amountSubContractor: Int = 0
    var amountTax: Double = 0.0
    var createdAt: TimeInterval = 0
    var customerName: String = ""
    var invoiceUrl: String = ""
    var isSubmitted: Bool = false
    var lastModified: TimeInterval = 0
    var pdfDate: String = ""
    var clientSignatureName: String = ""
    var signatureUrl: String = ""
    
    func formatter() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM.DDth yyyy"
        return formatter
    }
    
    func parseDicToSelf(dic : NSDictionary) {
        self.amountDue = dic.checkDoubleIfNil(key: "amountDue", oldValue: self.amountDue)
        self.amountMaterial = dic.checkDoubleIfNil(key: "amountMaterial", oldValue: self.amountMaterial)
        self.amountTax = dic.checkDoubleIfNil(key: "amountTax", oldValue: self.amountTax)
        self.amountEquipment = dic.checkIntIfNil(key: "amountEquipment", oldValue: self.amountEquipment)
        self.amountLabor = dic.checkIntIfNil(key: "amountLabor", oldValue: self.amountLabor)
        self.amountOther = dic.checkIntIfNil(key: "amountOther", oldValue: self.amountOther)
        self.amountSubContractor = dic.checkIntIfNil(key: "amountSubContractor", oldValue: self.amountSubContractor)
        self.customerName = dic.checkValueIfNil(key: "customerName", oldValue: self.customerName)
        self.invoiceUrl = dic.checkValueIfNil(key: "invoiceUrl", oldValue: self.invoiceUrl)
        self.isSubmitted = dic.checkBoolIfNil(key: "isSubmitted", oldValue: self.isSubmitted)
        self.createdAt = dic.checkTimeIntervalIfNil(key: "createdAt", oldValue: self.createdAt)
        self.lastModified = dic.checkTimeIntervalIfNil(key: "lastModified", oldValue: self.lastModified)
        self.clientSignatureName = dic.checkValueIfNil(key: "clientSignatureName", oldValue: self.clientSignatureName)
        self.signatureUrl = dic.checkValueIfNil(key: "signatureUrl", oldValue: self.signatureUrl)
        self.pdfDate = formatter().string(from: Date(timeIntervalSince1970: self.createdAt / 1000))
    }
    
    func initWithDic (dic : NSDictionary) {
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(value)" + key)
    }
}
