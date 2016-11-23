//
//  WorkOrdersModel.swift
//  LarsonApp
//
//  Created by appledev110 on 10/28/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class WorkOrdersModel: NSObject {
    var _id = ""
    var callNumber = ""
    var city = ""
    var createdAt = 0.0
    var currentStatus = ""
    var jobCod = false
    var jobId = ""
    var lastModified = 0.0
    var phoneNumber = ""
    var returnTripNeeded = false
    var serviceDescription = ""
    var siteAddress = ""
    var stationNumber = ""
    var submitted = false
    var techNumber = ""
    var workCompleted = false
    var parts = [PartModel]()
    var returnTripParts = [PartModel]()
    var workDescription = ""
    var returnTripReason = ""
    
    func parseDicToSelf(dic : NSDictionary) {
        self._id = dic.checkValueIfNil(key: "_id", oldValue: self._id)
        self.callNumber = dic.checkValueIfNil(key: "callNumber", oldValue: self.callNumber)
        self.city = dic.checkValueIfNil(key: "city", oldValue: self.city)
        self.createdAt = dic["createdAt"] as! TimeInterval
        self.currentStatus = dic.checkValueIfNil(key: "currentStatus", oldValue: self.currentStatus)
        self.jobCod = dic.checkBoolIfNil(key: "jobCod", oldValue: self.jobCod)
        self.jobId = dic.checkValueIfNil(key: "jobId", oldValue: self.jobId)
        self.lastModified = dic.checkTimeIntervalIfNil(key: "lastModified", oldValue: self.lastModified)
        self.phoneNumber = dic.checkValueIfNil(key: "phoneNumber", oldValue: self.phoneNumber)
        self.returnTripNeeded = dic.checkBoolIfNil(key: "returnTripNeeded", oldValue: self.returnTripNeeded)
        self.serviceDescription = dic.checkValueIfNil(key: "serviceDescription", oldValue: self.serviceDescription)
        self.siteAddress = dic.checkValueIfNil(key: "siteAddress", oldValue: self.siteAddress)
        self.stationNumber = dic.checkValueIfNil(key: "stationNumber", oldValue: self.stationNumber)
        self.submitted = dic.checkBoolIfNil(key: "submitted", oldValue: self.submitted)
        self.techNumber = dic.checkValueIfNil(key: "techNumber", oldValue: self.techNumber)
        self.workCompleted = dic.checkBoolIfNil(key: "workCompleted", oldValue: self.workCompleted)
        self.workDescription = dic.checkValueIfNil(key: "workDescription", oldValue: self.workDescription)
        self.returnTripReason = dic.checkValueIfNil(key: "returnTripReason", oldValue: self.returnTripReason)
        if dic.object(forKey: "parts") != nil {
            var partsArr = [PartModel]()
            for partDic in (dic.object(forKey: "parts") as! [NSDictionary]) {
                let partModel = PartModel()
                partModel.parseDicToSelf(dic: partDic)
                partsArr.append(partModel)
            }
            self.parts = partsArr
        }
        if dic.object(forKey: "returnTripParts") != nil {
            var partsArr = [PartModel]()
            for partDic in (dic.object(forKey: "returnTripParts") as! [NSDictionary]) {
                let partModel = PartModel()
                partModel.parseDicToSelf(dic: partDic)
                partsArr.append(partModel)
            }
            self.returnTripParts = partsArr
        }
        
    }
    
    func parseSelfToDic() -> NSDictionary{
        return ["_id": _id, "callNumber": callNumber, "city": city, "createdAt": createdAt, "currentStatus": currentStatus, "jobCod": jobCod, "jobId": jobId, "lastModified": lastModified, "phoneNumber": phoneNumber, "returnTripNeeded": returnTripNeeded, "serviceDescription": serviceDescription, "siteAddress": siteAddress, "stationNumber": stationNumber, "submitted": submitted, "techNumber": techNumber, "workCompleted": workCompleted]
    }
    
    
    func initWithDic (dic : NSDictionary) {
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(value)" + key)
    }
    
    
    
}
