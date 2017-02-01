//
//  BaseVC.swift
//  GoodCards
//
//  Created by volodymyrkhmil on 10/27/16.
//  Copyright © 2016 GoodCards. All rights reserved.
//

class BaseVC<T>:  UIViewController where T: UIView {
    
    //MARK: Public.Property
    
    var outerView: T {
        get {
            return self.bdk_outerView as! T
        }
        set(newValue) {
            self.bdk_outerView = newValue
        }
    }
    
    var startColor: UIColor {
        return UIColor.lightGray
    }
    var endColor: UIColor {
        return UIColor.darkGray
    }
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.outerView = T()
        self.addBaseView()
    }
    
    //MARK: Public.Methods
    
    func showAlertError(_ error: BDKError) {
        let alert = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Private
    
    //MARK: Private.Methods
    
    private func addBaseView() {
        let view: BaseView  = BaseView()
        view.startColor     = self.startColor
        view.endColor       = self.endColor
        
        self.view.insertSubview(view, at: 0)
        self.view.addConstraints(UIView.place(view, onOtherView: self.view))
    }
    
}
