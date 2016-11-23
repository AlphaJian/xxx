//
//  PayCodeModel.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/18/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PayCodeModel: NSObject {
    var billingAmount = 0
    var gpDescription = ""
    var payCode = ""
    var usedFor = ""
    
    func parseDicToSelf(dic : NSDictionary)
    {
        self.billingAmount = dic.checkIntIfNil(key: "billingAmount", oldValue: self.billingAmount)
        self.gpDescription = dic.checkValueIfNil(key: "gpDescription", oldValue: self.gpDescription)
        self.payCode = dic.checkValueIfNil(key: "payCode", oldValue: self.payCode)
        self.usedFor = dic.checkValueIfNil(key: "usedFor", oldValue: self.usedFor)
    }
}
