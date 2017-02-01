//
//  TeamMemberCell.swift
//  Bindeks
//
//  Created by volodymyrkhmil on 1/31/17.
//  Copyright © 2017 BBBSamples. All rights reserved.
//

import UIKit

class TeamMemberCell: UICollectionViewCell, CompanyMemberBindable {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var imageShadeView: ImageShadeView!
    @IBOutlet private weak var memberInfoView: MemberInfoView!
    
    //MARK: Properties
    
    var images: [UIImage?] {
        set(newValue) {
            self.imageShadeView.images = newValue
        }
        get {
            return self.imageShadeView.images
        }
    }
    
    //MARK: Public.Methods
    
    func start(with interval: TimeInterval) {
        self.imageShadeView.start(with: interval)
    }
    
    func stop() {
        self.imageShadeView.stop()
    }
    
    func clear() {
        self.imageShadeView.clear()
    }
    
    //MARK: CompanyMemberBindable
    
    var firtNameView: TextView? {
        return self.memberInfoView.nameLabel
    }
    var positionView: TextView? {
        return self.memberInfoView.positionLabel
    }
    
}
