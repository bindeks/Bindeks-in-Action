import UIKit

extension UITableView {

    func bbb_register(reuseIdentifier: String) {
        let bundle = Bundle.main
        let nib = UINib(nibName: reuseIdentifier, bundle: bundle)
        
        self.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func bbb_dequeueReusableCell<T: UITableViewCell>(type: T.Type) -> T? where T: BBB_ReusableView {
        let returnCell: UITableViewCell?
        let identifier = type.defaultReuseIdentifier
        if let cell = self.dequeueReusableCell(withIdentifier: identifier) {
            returnCell = cell
        } else {
            self.bbb_register(reuseIdentifier: identifier)
            returnCell = self.dequeueReusableCell(withIdentifier: identifier)
        }
        return returnCell as? T
    }
}
