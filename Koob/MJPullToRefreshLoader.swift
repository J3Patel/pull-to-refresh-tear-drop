//
//  MJPullToRefreshLoader.swift
//  Koob
//
//  Created by Jatin patel on 11/1/15.
//  Copyright © 2015 Jatin patel. All rights reserved.
//

import UIKit

class MJPullToRefreshLoader: UIView {
    var path = UIBezierPath()
    var circlePath = UIBezierPath()
    var smallCircle = UIBezierPath()
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        path.removeAllPoints()
        circlePath.removeAllPoints()
        
        let centerPoint = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = bounds.width / 3
        let circleCenter = CGPoint(x: centerPoint.x, y: bounds.width / 2)
        let smallCircleRadius: CGFloat = (radius / 2) - 3
        
        circlePath = UIBezierPath(arcCenter: circleCenter, radius: radius, startAngle: 0 , endAngle: 150, clockwise: true)
      if bounds.height < 50 {
        circlePath = UIBezierPath(arcCenter: circleCenter, radius: max(0,radius - ((50 - bounds.height) / 2)) , startAngle: 0 , endAngle: 150, clockwise: true)
      }
        smallCircle = UIBezierPath(arcCenter: CGPoint(x: centerPoint.x, y: bounds.height - 30), radius: smallCircleRadius, startAngle: 0, endAngle: 150, clockwise: true)

        UIColor.blueColor().setFill()
      UIColor.blueColor().set()
        circlePath.fill()
        circlePath.stroke()

      if bounds.height < 50 {
        return
      }
       smallCircle.fill()
       var x: CGFloat = 500
       x = x / bounds.height
        
       if x < 7 {
            x = x / 2

        }

        var y: CGFloat = 1.4
        if bounds.height > 100 {
            y = bounds.height / 70
        }
        print(bounds.height)
        path.moveToPoint(CGPoint(x: circleCenter.x - radius, y: circleCenter.y))
       
        let leftEndPoint = CGPoint(x: centerPoint.x - (smallCircleRadius)  , y: bounds.height - 30 )
        let leftCP1 = CGPoint(x: centerPoint.x , y: bounds.height / y)
        let leftCP2 = CGPoint(x: centerPoint.x - (radius / 2)  , y: bounds.height - 30 )
        
        
        let rightEndPoint = CGPoint(x: circleCenter.x + radius, y: circleCenter.y)
        let rightCP1 = CGPoint(x: centerPoint.x , y: bounds.height / y)
        let rightCP2 = CGPoint(x: centerPoint.x + radius / 2 , y:bounds.height - 30)
        
        path.addCurveToPoint(leftEndPoint, controlPoint1: leftCP1, controlPoint2: leftCP2 )
        path.addLineToPoint(CGPoint(x: circleCenter.x + smallCircleRadius, y: bounds.height - 30))
        path.addCurveToPoint(rightEndPoint, controlPoint1: rightCP2, controlPoint2: rightCP1 )
        path.fill()
        smallCircle.stroke()
        path.stroke()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        backgroundColor = UIColor.whiteColor()
    }
    
    
}
