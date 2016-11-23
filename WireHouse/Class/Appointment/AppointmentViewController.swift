//
//  AppointmentViewController.swift
//  LarsonApp
//
//  Created by Jian Zhang on 10/25/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit
import Firebase

class AppointmentViewController: BaseViewController {
    var tableview : AppointmentsTableView!
    
    var listBlock : ReturnBlock?
    var scrollViewSet : ScrollViewSet!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavView(title: "Appointment List", bolBack: false)
        initUI()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        print("#### deinit ####")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//
    }

    func initUI(){
        scrollViewSet = ScrollViewSet.init(frame: CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64 ))
        scrollViewSet.initUI(arr: ["NEED REVIEW","REVIEWED"])
        scrollViewSet?.scrollToIndexHandler = { (index) in
            
        }
        self.view.addSubview(scrollViewSet!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
