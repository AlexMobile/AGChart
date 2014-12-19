//
//  AGChartView.swift
//  AGChart
//
//  Created by Alexey Golovenkov on 19/12/14.
//  Copyright (c) 2014 Alexey Golovenkov. All rights reserved.
//

import UIKit

@IBDesignable public class AGChartView: UIView {
    @IBOutlet weak var dataSource: AGChartDataSource?
     let dataLayer = AGChartDataLayer()
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addLayers()
    }
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
        self.addLayers()
    }
    
    // MARK: - Private methods
    
    func addLayers() {
        self.layer.addSublayer(dataLayer)
        dataLayer.frame = self.layer.bounds
        dataLayer.datasource = self.dataSource
    }
    
    public override func layoutSublayersOfLayer(layer: CALayer!) {
        if layer == self.layer {
            dataLayer.frame = layer.bounds
        }
    }
}