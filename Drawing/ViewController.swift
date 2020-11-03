//
//  ViewController.swift
//  Drawing
//
//  Created by Айдана on 9/28/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var customView: CustomView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(gesture:)))
                self.undoButton.addGestureRecognizer(longPress)
        
    }
    override func didReceiveMemoryWarning() {
        
    }
    @objc func longPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            customView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            if customView.currentShape == .draw {
                customView.lines.removeAll()
            }
        }
    }
    
    
    @IBAction func fillSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            customView.isFilled = true
        }
        else{
            customView.isFilled = false
        }
    }
    
    
    
    
    @IBAction func drawCircle(_ sender: Any) {
        customView.drawShape(selectedShape: .circle)
    }
    
    @IBAction func drawRectangle(_ sender: Any) {
        customView.drawShape(selectedShape: .rectangle)
    }
    
    @IBAction func drawTriangle(_ sender: UIButton) {
        customView.drawShape(selectedShape: .triangle)
    }
    @IBAction func drawLine(_ sender: UIButton) {
        customView.drawShape(selectedShape: .line)
    }
    @IBAction func justDraw(_ sender: UIButton) {
        customView.drawShape(selectedShape: .draw)
    }
    
    @IBAction func undo(_ sender: Any) {
        _ = customView.layer.sublayers?.popLast()
        if customView.currentShape == .draw {
            guard var lastLine = customView.lines.popLast() else {
                return
            }
            lastLine.points.removeLast()
            if lastLine.points.count != 0 {
                customView.lines.append(lastLine)
            }
            
        }
        
    }
    
    @IBAction func colorButton(_ sender: UIButton) {
        customView.color =  sender.backgroundColor!
    }
    
    
}

