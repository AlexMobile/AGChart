//
//  AGChartCustomizer.swift
//  AGChart
//
//  Created by Alexey Golovenkov on 20.12.14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import UIKit

public class AGChartCustomizer: NSObject {
    @IBOutlet weak var view: AGChartView? = nil
    
    @IBInspectable var chartLineWidth: CGFloat = 1.0
    @IBInspectable var chartColor: UIColor = UIColor.redColor()
    @IBInspectable var horizontalAxe: Bool = false
    @IBInspectable var horizontalAxeAreaWidth: CGFloat = 5.0
    @IBInspectable var horizontalAxeColor: UIColor = UIColor.clearColor()
    @IBInspectable var horizontalAxeWidth: CGFloat = 1.0
    @IBInspectable var verticalAxe: Bool = false
    @IBInspectable var verticalAxeAreaWidth: CGFloat = 5.0
    @IBInspectable var verticalAxeColor: UIColor = UIColor.clearColor()
    @IBInspectable var verticalAxeWidth: CGFloat = 1.0
    
}
