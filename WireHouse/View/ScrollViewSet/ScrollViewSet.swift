//
//  ScrollViewSet.swift
//  LarsonApp
//
//  Created by appledev018 on 11/1/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class ScrollViewSet: UIView, UIScrollViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var tabBarView : TabBarView?

    var scrollView : UIScrollView?
    var scrolledHandler : ReturnBlock?
    
    var scrollToIndexHandler: ReturnBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func initUI(arr : [String]){
        tabBarView = TabBarView.init(frame: CGRect(x: 0, y: 0, width: LCDW, height: 64))
        tabBarView?.initUI(arr: arr)
        scrollView?.delegate = self
        //scrollView?.delegatePass = self
        self.addSubview(tabBarView!)
        
        tabBarView?.tabHandler = {(index)-> Void in
            let page = index as! Int
            self.scrollByTab(index: page)
        }
        
        scrollView = UIScrollView.init(frame: CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 128 ))
        scrollView?.contentSize.height = (scrollView?.frame.height)!
        scrollView?.contentSize.width = LCDW * CGFloat(arr.count)
        scrollView?.showsHorizontalScrollIndicator = false
        
        scrollView?.isPagingEnabled = true
        scrollView?.delegate = self
        self.addSubview(scrollView!)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == self.scrollView {        
            let index = scrollView.contentOffset.x / LCDW
            tabBarView?.scrollByView(index: Int(index))
        
            print("scroll to index \(index)")
            if self.scrollToIndexHandler != nil {
                self.scrollToIndexHandler!(Int(index) as AnyObject)
            }
        }

    }
    
    
    func scrollByTab (index : Int) {
        scrollView?.contentOffset.x = LCDW * CGFloat(index)
        print("scroll to index \(index)")
    }
  

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    
            let view = super.hitTest(point, with: event)
            
        let mapViewFrame = CGRect(x: 0, y: 64, width: LCDW, height: 200)
        
            if mapViewFrame.contains(point) {
               
                self.scrollView?.isScrollEnabled = false
                return view
            } else {
                
                self.scrollView?.isScrollEnabled = true
                return view
            }
    }
}
