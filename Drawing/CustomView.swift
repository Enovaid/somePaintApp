//
//  CustomView.swift
//  Drawing
//
//  Created by Айдана on 9/28/20.
//

import UIKit

enum Shape {
    case circle
    case rectangle
    case triangle
    case line
    case draw
    
}

class CustomView: UIView {
    var point1: CGPoint?
    var point2: CGPoint!
    var temp: CGPoint!
    var currentShape: Shape?
    var shapes: [Circle]?
    var isFilled: Bool! = true
    var color: UIColor = .black
    
    override func draw(_ rect: CGRect) {
        self.layer.backgroundColor = UIColor.white.cgColor
        if let p1 = point1 {
            
            
            guard let currentShape = currentShape else {
                return
            }
            switch currentShape {
            case .circle:
                let circle = Circle(p1: p1, p2: point2, withSome: .white, and: 3)
                circle.drawPath()
                let shape = CAShapeLayer()
                shape.path = circle.path?.cgPath
                if (isFilled){
                    shape.fillColor = color.cgColor
                    shape.strokeColor = color.cgColor
                    
                }
                else {
                    shape.fillColor = UIColor.clear.cgColor
                    shape.strokeColor = color.cgColor
                }
        
                shape.lineWidth = 3
                self.layer.addSublayer(shape)
            case .rectangle:
                let rect = Rectangle(p1: p1, p2: point2, color: .white, stroke_width: 3)
                rect.drawPath()
                let shape = CAShapeLayer()
                shape.path = rect.path?.cgPath
                if (isFilled){
                    shape.fillColor = color.cgColor
                    shape.strokeColor = color.cgColor
                    
                }
                else {
                    shape.fillColor = UIColor.clear.cgColor
                    shape.strokeColor = color.cgColor
                }
                shape.lineWidth = 3
                self.layer.addSublayer(shape)
                
            case .triangle:
                let rect = Triangle(p1: p1, p2: point2, color: .white, stroke_width: 3)
                rect.drawPath()
                let shape = CAShapeLayer()
                shape.path = rect.path?.cgPath
                if (isFilled){
                    shape.fillColor = color.cgColor
                    shape.strokeColor = color.cgColor
                    
                }
                else {
                    shape.fillColor = UIColor.clear.cgColor
                    shape.strokeColor = color.cgColor
                }
                shape.lineWidth = 3
                self.layer.addSublayer(shape)
            case .line:
                let rect = Line(p1: p1, p2: point2, color: .white, stroke_width: 20)
                rect.drawPath()
                let shape = CAShapeLayer()
                shape.path = rect.path?.cgPath
                if (isFilled){
                    shape.fillColor = color.cgColor
                    shape.strokeColor = color.cgColor
                    
                }
                else {
                    shape.fillColor = UIColor.clear.cgColor
                    shape.strokeColor = color.cgColor
                }
                shape.lineWidth = 3
                self.layer.addSublayer(shape)
            case .draw:
                super.draw(rect)
                guard let context = UIGraphicsGetCurrentContext() else {
                    return
                }
                
                let shape = CAShapeLayer()
                
                    
                    context.setStrokeColor(lines.last!.color.cgColor)
                    context.setLineWidth(5)
                    context.setLineCap(.round)
                    shape.strokeColor = lines.last!.color.cgColor
                    
                    shape.fillColor = UIColor.clear.cgColor
                    for (i, p) in lines.last!.points.enumerated() {
                        if i == 0 {
                            context.move(to: p)
                        }
                        else {
                            context.addLine(to: p)
                            
                        }
                        
                        
                        shape.path = context.path
                        shape.lineWidth = 3
                        self.layer.addSublayer(shape)
                        
                        
                    }
                
                
            }
            
        } 
    }
    
    func drawShape(selectedShape: Shape) {
        currentShape = selectedShape
      
    }
    var lines = [DrawingLine]()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (currentShape == .draw){
            lines.append(DrawingLine.init(color: color, points: []))
        }
        if let touch = touches.first {
            point1 = touch.location(in: self)
        }
    }
//    var line = [CGPoint]()
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (currentShape == .draw){
            
            guard let point = touches.first?.location(in: self) else {
                return
            }
            guard var lastLine = lines.popLast() else {
                return
            }
            lastLine.points.append(point)
            lines.append(lastLine)
//            var lastLine = lines.last
//            lastLine?.append(point)
            print(point)
//            line.append(point)
            setNeedsDisplay()
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            point2 = touch.location(in: self)
        }
        setNeedsDisplay()
    }

}


