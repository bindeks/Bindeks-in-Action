//
//  ImageShadeView.swift
//  Bindeks in Action
//
//  Created by volodymyrkhmil on 2/1/17.
//  Copyright © 2017 Volodymyr Khmil. All rights reserved.
//

import UIKit

class ImageShadeView: BBBXIBView {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: Public.Properties
    
    var images: [UIImage?] = []
    
    //MArK: Private.Properties
    
    private var timer: Timer?
    private var imageIndex = -1
    private var nextImage: UIImage? {
        var nextImage: UIImage?
        if !self.images.isEmpty {
            self.imageIndex = (self.imageIndex + 1) % self.images.count
            nextImage = self.images[self.imageIndex]
        }
        return nextImage
    }
    
    //MARK: Public.Methods
    
    func start(with interval: TimeInterval) {
        self.stop()
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: { (timer) in
            let animationDuration = interval / 3
            self.animateImageChanging(with: animationDuration)
        })
    }
    
    func stop() {
        self.timer?.invalidate()
    }
    
    func clear() {
        self.imageIndex = -1
        self.timer?.invalidate()
    }
    
    //MARK: Private.Methods
    
    private func animateImageChanging(with duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: { [unowned self] in
            self.imageView.alpha = 0
            }, completion: { [unowned self] isFinished in
                if isFinished {
                    self.imageView.image = self.nextImage
                    UIView.animate(withDuration: duration, animations: { [unowned self] in
                        self.imageView.alpha = 1
                    })
                }
            })
    }
}
