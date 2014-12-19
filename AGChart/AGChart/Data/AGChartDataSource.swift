//
//  AGChartDataSource.swift
//  AGChart
//
//  Created by Alexey Golovenkov on 19/12/14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import UIKit

let AGChartDataSourceUpdateNotification = "AGChartDataUpdated"

public class AGChartDataSource: NSObject {
    var _data: [AGChartPoint] = []
    var _minValue:Double = 0
    var _maxValue:Double = 0
    
    // MARK: - Properties
    
    public var count: Int {
        get {
            return _data.count
        }
    }
    
    public var maxValue:Double {
        get {
            return _maxValue
        }
    }
    
    public var minValue:Double {
        get {
            return _minValue
        }
    }
    
    // MARK: - Public methods
    
    public func loadFromArray(array:[AGChartPoint]) {
        _data = array
        _data.sort(isOrderedBefore)
        self.recalculateExtremums()
        informUIAboutChanges()
    }
    
    public func addDataFromArray(array:[AGChartPoint]) {
        _data += array
        _data.sort(isOrderedBefore)
        self.updateExtremumsWithAppendingArray(array)
        self.informUIAboutChanges()
    }
    
    public func pointAtIndex(index: Int) -> AGChartPoint? {
        if (index < 0 || index >= _data.count) {
            return nil
        }
        return _data[index]
    }
    
    // MARK: - Private methods
    
    func informUIAboutChanges() {
        NSNotificationCenter.defaultCenter().postNotificationName(AGChartDataSourceUpdateNotification, object: self)
    }
    
    func isOrderedBefore(val1: AGChartPoint, val2: AGChartPoint) -> Bool {
        return val1.xValue!.value < val2.xValue!.value
    }
    
    func extremumsForArray(array: [AGChartPoint]) -> (min: Double, max: Double) {
        if (array.count == 0) {
            return (0, 0);
        }
        let firstPoint = _data.first!
        let val = firstPoint.yValue;
        var min = Double(val != nil ? val!.value : 0)
        var max = min
        for point in _data {
            let val = point.yValue;
            let value = Double(val != nil ? val!.value : 0)
            if min > value {
                min = value
            }
            if (max < value) {
                max = value
            }
        }
        return (min: min, max:max)
    }
    
    func recalculateExtremums() {
        let extremums = self.extremumsForArray(_data)
        _minValue = extremums.min;
        _maxValue = extremums.max;
    }
    
    func updateExtremumsWithAppendingArray(array: [AGChartPoint]) {
        let extremums = self.extremumsForArray(array);
        if _minValue > extremums.min {
            _minValue = extremums.min
        }
        if _maxValue < extremums.max {
            _maxValue = extremums.max
        }
    }
}
