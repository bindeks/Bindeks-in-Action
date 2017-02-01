import UIKit

protocol BBB_ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

protocol BBB_NibLoadableView: class {
    static var nibName: String { get }
}

extension BBB_ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension BBB_NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UITableViewCell: BBB_ReusableView {}

extension UITableViewCell : BBB_NibLoadableView {}

extension UICollectionViewCell: BBB_ReusableView {}

extension UICollectionViewCell : BBB_NibLoadableView {}
