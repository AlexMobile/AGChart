//
//  AGChartTests.swift
//  AGChartTests
//
//  Created by Alexey Golovenkov on 19/12/14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import UIKit
import XCTest
import AGChart

class AGChartDataSourceTests: XCTestCase {
    var dataSource = AGChartDataSource()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let points = self.randomValues(count: 10)
        dataSource.loadFromArray(points)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoading() {
        let itemsCount = dataSource.count
        // test count
        if (itemsCount != 10) {
            XCTFail("Wrong number of ites in datasource: \(itemsCount) instead of 10");
        }
        // test sorting
        self.checkSortingInDataSource(dataSource)
    }
    
    func testAdding() {
        let points = self.randomValues(count: 125)
        dataSource.addDataFromArray(points)
        let itemsCount = dataSource.count
        // test count
        if (itemsCount != 135) {
            XCTFail("Wrong number of ites in datasource: \(itemsCount) instead of 10");
        }
        // test sorting
        self.checkSortingInDataSource(dataSource)
    }
  
    
    // mark: private methods
    
    func checkSortingInDataSource(dataSource: AGChartDataSource) {
        var xVal:Double = -1
        for index in 0 ..< dataSource.count {
            let currentPoint = dataSource.pointAtIndex(index)
            let currentValue = currentPoint!.xValue!;
            if xVal > currentValue.value {
                XCTFail("Wrong order")
            }
            xVal = currentValue.value
        }
    }
    
    func randomValues(count itemsCount: Int) -> [AGChartPoint] {
        var points :[AGChartPoint] = []
        for _ in 1...itemsCount {
            let x = UInt(arc4random())
            let y = UInt(arc4random())
            let point = AGChartPoint(xValue:x, yValue:y)
            points.append(point)
        }
        return points;
    }
}
