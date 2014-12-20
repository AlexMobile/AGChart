//
//  Calculator.swift
//  AGChart
//
//  Created by Alexey Golovenkov on 20.12.14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import UIKit

/**
*  Calculates geometry parameters
*/
class AGChartCalculator: NSObject {
    
    weak var chartView:AGChartView? = nil
    
    
    func chartFrameForViewFrame(viewFrame: CGRect) -> CGRect {
        return viewFrame
    }
}
