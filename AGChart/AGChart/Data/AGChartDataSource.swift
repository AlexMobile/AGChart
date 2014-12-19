//
//  AGChartDataSource.swift
//  AGChart
//
//  Created by Alexey Golovenkov on 19/12/14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import UIKit

public class AGChartDataSource: NSObject {
    var data: [AGChartPoint] = []
    public var count: Int {
        get {
            return data.count
        }
    }
    
    public func loadFromArray(array:[AGChartPoint]) {
        data = array
        data.sort(isOrderedBefore)
    }
    
    public func addDataFromArray(array:[AGChartPoint]) {
        data += array
        data.sort(isOrderedBefore)
    }
    public func pointAtIndex(index: Int) -> AGChartPoint? {
        if (index < 0 || index >= data.count) {
            return nil
        }
        return data[index]
    }
    
    func isOrderedBefore(val1: AGChartPoint, val2: AGChartPoint) -> Bool {
        return val1.xValue?.value < val2.xValue?.value
    }
}
