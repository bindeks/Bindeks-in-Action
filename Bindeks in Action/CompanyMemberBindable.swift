//
//  CompanyMemberBindable.swift
//  Bindeks in Action
//
//  Created by volodymyrkhmil on 2/1/17.
//  Copyright © 2017 Volodymyr Khmil. All rights reserved.
//

import Foundation

protocol CompanyMemberBindable: Bindable {
    var nameView: TextView? { get }
    var positionView: TextView? { get }
    var preWordView: TextView? { get }
    var profileImageView: ImageView? { get }
    var topImageView: ImageView? { get }
    var botImageView: ImageView? { get }
    
    func name(from firstName: String, and lastName: String) -> NSAttributedString?
}

extension CompanyMemberBindable {
    
    var nameView: TextView? { return nil }
    var positionView: TextView? { return nil }
    var preWordView: TextView? { return nil }
    var profileImageView: ImageView? { return nil }
    var topImageView: ImageView? { return nil }
    var botImageView: ImageView? { return nil }
    
    func bind(with object: Any?) {
        if let companyMember = object as? CompanyMember {
            self.nameView?.attributedText       = self.name(from: companyMember.firstName, and: companyMember.lastName)
            self.positionView?.attributedText   = NSAttributedString(string: companyMember.position)
            self.preWordView?.attributedText    = NSAttributedString(string: companyMember.preWord)
            self.profileImageView?.image        = companyMember.profileImage
            self.topImageView?.image            = companyMember.topImage
            self.botImageView?.image            = companyMember.botImage
        }
    }
    
    func name(from firstName: String, and lastName: String) -> NSAttributedString? {
        let nameAttributed = NSMutableAttributedString(string: "\(firstName) ",
                                                   attributes: [ NSFontAttributeName: UIFont.systemFont(ofSize: 20) ])
        
        nameAttributed.append(NSMutableAttributedString(string: lastName,
                                                    attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 40) ]))
        return nameAttributed
    }
}
