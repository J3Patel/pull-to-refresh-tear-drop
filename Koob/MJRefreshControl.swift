//
//  MJRefreshControl.swift
//  Koob
//
//  Created by Jatin patel on 10/31/15.
//  Copyright © 2015 Jatin patel. All rights reserved.
//

import UIKit

class MJRefreshControl: UIRefreshControl {

    var baseView = MJPullToRefreshLoader()
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
    }
    override func didAddSubview(subview: UIView) {
        super.didAddSubview(subview)
    }
    
    override init() {
        super.init()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBaseView()
    }
    
    func setup(){
        backgroundColor = UIColor.whiteColor() // dont remove this, causes stop animating if removed, dont know why?
    }
    
    func setupBaseView() {
        clipsToBounds = true
        baseView.frame.origin.y = 0
        baseView.center.x = (center.x)
        baseView.frame.size = CGSize(width: 50, height:  bounds.height )
       
        baseView.setNeedsDisplay()
        addSubview(baseView)

    }
   
}
