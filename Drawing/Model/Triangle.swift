//
//  Rectangle.swift
//  Drawing
//
//  Created by Айдана on 9/28/20.
//

import Foundation
import UIKit

class Triangle {
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
        
        
        path = UIBezierPath()
        path!.move(to: CGPoint(x:p1.x, y: p1.y))
        path!.addLine(to: CGPoint(x: p2.x, y: p2.y))
        path!.addLine(to: CGPoint(x: p1.x, y: p2.y))
        path!.close()
        path!.lineWidth = stroke_width
        color.set()
        path!.close()
        
        
    }
    
}



