//
//  MKWhiteBtn.swift
//  LarsonApp
//
//  Created by appledev018 on 11/10/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//


import UIKit

class MKWhiteBtn: MKButton {
    
    override func awakeFromNib() {
        self.setTitleColor(UIColor.black, for: .normal)
        self.cornerRadius = 3
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.gray.cgColor
    }
    
}
