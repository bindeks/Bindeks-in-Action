//
//  MemberInfoView.swift
//  Bindeks
//
//  Created by volodymyrkhmil on 1/31/17.
//  Copyright © 2017 BBBSamples. All rights reserved.
//

import UIKit

class MemberInfoView: BBBXIBView {
    
    //MARK: Properties.Public
    
    @IBInspectable var name: String? {
        didSet {
            self.nameLabel?.text = self.name
        }
    }
    @IBInspectable var position: String? {
        didSet {
            self.positionLabel.text = self.position
        }
    }
    
    //MARK: IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
}
