//
//  AGChartExtentions.swift
//  AGChart
//
//  Created by Alexey Golovenkov on 19/12/14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import Foundation

extension NSDate: AGChartPointValue {
    public var value:Double {
        get {
            return self.timeIntervalSince1970
        }
    }
    public var title:String {
        get {
            return self.description
        }
    }
}

extension Double: AGChartPointValue {
    public var value:Double {
        get {
            return self
        }
    }
    public var title:String {
        get {
            return "\(self)";
        }
    }
}

extension Float: AGChartPointValue {
    public var value:Double {
        get {
            return Double(self)
        }
    }
    public var title:String {
        get {
            return "\(self)";
        }
    }
}

extension Int: AGChartPointValue {
    public var value:Double {
        get {
            return Double(self)
        }
    }
    public var title:String {
        get {
            return "\(self)";
        }
    }
}

extension UInt: AGChartPointValue {
    public var value:Double {
        get {
            return Double(self)
        }
    }
    public var title:String {
        get {
            return "\(self)";
        }
    }
}