
struct RoutingData {
    
    //MARK: Enums
    
    enum RoutType {
        case present
        case push
    }
    
    //MARK: Property
    
    var from: UIViewController!
    var to: UIViewController!
    var animated: Bool = true
    var routingType: RoutType = .push
}

protocol Initial {
    func initial() -> UIViewController
}

protocol Router {
    func routData() -> RoutingData
}

class Rout {
    
    //MARK: Properties
    
    var data: RoutingData?
    
    //MARK: Initialisers
    
    init(router: Router) {
        self.data = router.routData()
    }
    
    //MARK: Methods
    
    class func initial(initial: Initial) -> UIViewController {
        let controller = UINavigationController(rootViewController: initial.initial())
        controller.isNavigationBarHidden = true
        return controller
    }
    
    @discardableResult
    func rout(with completion: RoutCompletiob? = nil) -> RoutingData? {
        if let routData = self.data {
            switch routData.routingType {
            case .present:
                routData.from.present(routData.to, animated: routData.animated, completion: completion)
            case .push:
                routData.from.navigationController?.pushViewController(routData.to, animated: routData.animated)
                completion?()
            }
        }
        
        return self.data
    }
    
    @discardableResult
    func back(with completion: RoutCompletiob? = nil) -> RoutingData? {
        if let routData = self.data {
            switch routData.routingType {
            case .present:
                routData.to.dismiss(animated: routData.animated, completion: nil)
            case .push:
                routData.from.navigationController?.popToViewController(routData.from, animated: routData.animated)
                completion?()
            }
        }
        
        return self.data
    }
    
    //MARK: Typealias
    
    typealias RoutCompletiob = () -> Void
}
