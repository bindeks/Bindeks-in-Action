//
//  BaseView.swift
//  GoodCards
//
//  Created by volodymyrkhmil on 10/27/16.
//  Copyright © 2016 GoodCards. All rights reserved.
//

class BaseView: UIView {
    
    var startColor: UIColor!
    var endColor: UIColor!
    
    //MARK: Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.backgroundLayer == nil {
            self.backgroundLayer = CALayer.bdkBackgroundGradient(startColor: startColor, endColor: endColor)
        }
        
        self.backgroundLayer?.frame = self.bounds
    }
    
    //MARK: Private.Properties
    
    private var backgroundLayer: CALayer? {
        didSet {
            if let backgroundLayer = self.backgroundLayer {
                self.layer.addSublayer(backgroundLayer)
            }
        }
        willSet {
            self.backgroundLayer?.removeFromSuperlayer()
        }
    }
}
