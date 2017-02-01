//
//  Bindable.swift
//  Bindeks in Action
//
//  Created by volodymyrkhmil on 2/1/17.
//  Copyright © 2017 Volodymyr Khmil. All rights reserved.
//

import Foundation

protocol Bindable {
    func bind(with object: Any?)
}

protocol TextView: class {
    var attributedText: NSAttributedString? { get set }
}

protocol ImageView: class {
    var image: UIImage? { get set }
}

extension UILabel: TextView {
    
}

extension UIImageView: ImageView {
    
}
