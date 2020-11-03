//
//  Circle.swift
//  Drawing
//
//  Created by Айдана on 9/28/20.
//

import Foundation
import UIKit

class Circle {
    private var p1: CGPoint
    private var p2: CGPoint
    var color: UIColor
    private var stroke_width: CGFloat
    var path: UIBezierPath?
    
    init(p1: CGPoint, p2: CGPoint, withSome color: UIColor, and stroke_width: CGFloat) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
        self.stroke_width = stroke_width
    }
    
    func drawPath() {
        let radius = abs(p1.x - p2.x) / 2
        if(p1.x - p2.x == abs(p1.x - p2.x) && p1.y - p2.y == abs(p1.y - p2.y) ){
            let temp = p1
            p1 = p2
            p2 = temp
        }
        else if(p1.x - p2.x == abs(p1.x - p2.x) && p1.y - p2.y != abs(p1.y - p2.y) ){
            let width = abs(p1.x - p2.x)
            p1.x = p1.x - width
            p2.x = p2.x - width
        }
        else if(p1.x - p2.x != abs(p1.x - p2.x) && p1.y - p2.y == abs(p1.y - p2.y) ){
            let height = abs(p1.y - p2.y)
            p1.y = p1.y - height
            p2.y = p2.y - height
        }
        let circle_center = CGPoint(x: p1.x + radius, y: p1.y + radius)
        path = UIBezierPath(arcCenter: circle_center,
                                radius: radius,
                                startAngle: 0,
                                endAngle: 2*Double.pi.cg,
                                clockwise: false)
        path!.lineWidth = stroke_width
        color.set()
        path!.close()
    }
    
}

extension Double {
    var cg: CGFloat {
        return CGFloat(self)
    }
}
