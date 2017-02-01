
enum BindeksRouter: Router {
    
    //MARK: Private.Nested
    
    private struct BindeksInitial: Initial {
        
        //MARK: Initial
        
        func initial() -> UIViewController {
            return TeamVC()
        }
    }
    
    
    //MARK: Case
    
    //MARK: Public.Property
    
    static var initial: Initial = BindeksInitial()
    
    //MARK: Private.Property
    
    private var from: UIViewController {
        return UIViewController()
    }
    
    private var to: UIViewController {
        return UIViewController()
    }
    
    private var animated: Bool {
        return true
    }
    
    private var presentType: RoutingData.RoutType {
        return .push
    }
    
    //MARK: Private.Methods
    
    //MARK: Router
    
    func routData() -> RoutingData {
        return RoutingData(from: self.from, to: self.to, animated: self.animated, routingType: self.presentType)
    }
}
