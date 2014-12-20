//
//  AGChartView.swift
//  AGChart
//
//  Created by Alexey Golovenkov on 19/12/14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import UIKit

@IBDesignable public class AGChartView: UIView {
    @IBOutlet var dataSource: AGChartDataSource?
    @IBOutlet var customizer: AGChartCustomizer? {
        didSet {
            dataLayer.customizer = customizer
        }
    }
    var dataLayer = AGChartDataLayer()
    let calculator = AGChartCalculator()
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.baseInit()
    }
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
        self.baseInit()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        if (customizer == nil) {
            self.customizer = AGChartCustomizer()
        }
    }
    
    // MARK: - Private methods
    
    func baseInit() {
        self.addLayers()
        
        calculator.chartView = self
    }
    
    func addLayers() {
        self.layer.addSublayer(dataLayer)
        dataLayer.frame = self.layer.bounds
        dataLayer.datasource = self.dataSource
        dataLayer.calculator = calculator
        dataLayer.customizer = customizer
    }
    
    public override func layoutSublayersOfLayer(layer: CALayer!) {
        if layer == self.layer {
            dataLayer.frame = calculator.chartFrameForViewFrame(layer.bounds)
        }
    }
}