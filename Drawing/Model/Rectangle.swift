//
//  Rectangle.swift
//  Drawing
//
//  Created by Айдана on 9/28/20.
//

import Foundation
import UIKit

class Rectangle {
    private var p1: CGPoint
    private var p2: CGPoint
    var color: UIColor
    private var stroke_width: CGFloat
    var path: UIBezierPath?
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
        self.stroke_width = stroke_width
    }
    
    func drawPath() {
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
        let rect = CGRect(origin: p1,
                          size: CGSize(width: abs(p1.x - p2.x),
                                       height: abs(p1.y-p2.y)))
        path = UIBezierPath(rect: rect)
        path!.lineWidth = stroke_width
        color.set()
        path!.close()
    }
}

extension CGFloat {
    var double: Double {
        return Double(self)
    }
}
