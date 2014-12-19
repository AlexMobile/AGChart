//
//  AGChartPoint.swift
//  AGChart
//
//  Created by Alexey Golovenkov on 19/12/14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import Foundation

public protocol AGChartPointValue {
    var value:Double {get}
    var title:String {get}
}

public class AGChartPoint {
    public var xValue: AGChartPointValue?
    public var yValue: AGChartPointValue?
    
    public init(xValue x:AGChartPointValue, yValue y:AGChartPointValue) {
        self.xValue = x
        self.yValue = y
    }
}