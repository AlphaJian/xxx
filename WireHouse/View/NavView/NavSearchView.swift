//
//  NavSearchView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class NavSearchView: UIView, UITextFieldDelegate {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    
    var btnTappedHandler : ButtonTouchUpBlock?
    var searchHandler : ReturnBlock?
    var doneHandler : ButtonTouchUpBlock?
    
    override func awakeFromNib() {
        searchTF.delegate = self
    }
    
    @IBAction func btnTapped(_ sender: AnyObject) {
        if btnTappedHandler != nil
        {
            btnTappedHandler!()
        }
    }
    @IBAction func doneTapped(_ sender: AnyObject) {
        if doneHandler != nil
        {
            doneHandler!()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIApplication.shared.keyWindow?.endEditing(false)
        if searchHandler != nil
        {
            searchHandler!(textField.text as AnyObject)
        }
        return true
    }

}
