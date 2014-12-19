//
//  AGChartDataLayer.swift
//  AGChart
//
//  Created by Alexey Golovenkov on 19/12/14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import UIKit

class AGChartDataLayer: CAShapeLayer {
    weak var _datasource: AGChartDataSource?
    
    weak var datasource: AGChartDataSource? {
        get {
            return _datasource
        }
        set {
            if (_datasource != nil) {
                
            }
            _datasource = newValue
            self.redraw()
        }
    }
    
    override func display() {
        super.display();
        redraw();
    }
    
    func redraw() {
//        self.lineWidth = 2;
        self.fillColor = UIColor.blueColor().CGColor
        self.strokeColor = UIColor.cyanColor().CGColor
        self.path = CGPathCreateWithEllipseInRect(self.bounds, nil)
        
        self.backgroundColor = UIColor.blackColor().CGColor
        NSLog("frame = \(self.frame)");
        NSLog("bounds = \(self.bounds)");
    }
}
