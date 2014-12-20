//
//  AGChartDataLayer.swift
//  AGChart
//
//  Created by Alexey Golovenkov on 19/12/14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import UIKit

class AGChartDataLayer: CAShapeLayer {
    weak var calculator: AGChartCalculator? {
        didSet {
            redraw()
        }
    }
    
    weak var customizer: AGChartCustomizer? {
        didSet {
            redraw()
        }
    }
    
    weak var datasource: AGChartDataSource? {
        didSet {
            self.redraw()
        }
    }
    
    override var bounds: CGRect {
        didSet {
            redraw()
        }
    }
    
    // MARK: - Initializers
    
    override init() {
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK - Private methods
    
    func redraw() {
        if (customizer == nil) {
            return
        }
        self.lineWidth = customizer!.chartLineWidth;
        self.strokeColor = customizer!.chartColor.CGColor
        self.path = CGPathCreateWithEllipseInRect(self.bounds, nil)
    }
}
