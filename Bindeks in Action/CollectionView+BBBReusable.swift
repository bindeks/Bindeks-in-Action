import UIKit

extension UICollectionView {
    
    func bbb_register(reuseIdentifier: String) {
        let bundle = Bundle.main
        let nib = UINib(nibName: reuseIdentifier, bundle: bundle)
        
        self.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func bbb_dequeueReusableCell<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T? where T: BBB_ReusableView {
        let identifier = type.defaultReuseIdentifier
        
        self.bbb_register(reuseIdentifier: identifier)
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        return cell as? T
    }
}
