//
//  AppDelegate.swift
//  instgramApp
//
//  Created by Ebrahim  Mo Gedamy on 8/30/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = TabbarVC()
        let nav = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        UIViewController.preventPageSheetPresentation
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension UIViewController {
    
    static let preventPageSheetPresentation: Void = {
        if #available(iOS 13, *) {
            _swizzling(forClass: UIViewController.self,
                       originalSelector: #selector(present(_: animated: completion:)),
                       swizzledSelector: #selector(_swizzledPresent(_: animated: completion:)))
        }
    }()
    
    @available(iOS 13.0, *)
    @objc private func _swizzledPresent(_ viewControllerToPresent: UIViewController,
                                        animated flag: Bool,
                                        completion: (() -> Void)? = nil) {
        if viewControllerToPresent.modalPresentationStyle == .pageSheet
            || viewControllerToPresent.modalPresentationStyle == .automatic {
            viewControllerToPresent.modalPresentationStyle = .fullScreen
        }
        _swizzledPresent(viewControllerToPresent, animated: flag, completion: completion)
    }
}

private func _swizzling(forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
    if let originalMethod = class_getInstanceMethod(forClass, originalSelector),
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector) {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}

//MARK:- [[[ Segue ]]]
extension UIViewController{
    
    func handlePushSegue<ViewController : UIViewController>(viewController : ViewController.Type){
        
        let viewControllerID = String(describing: viewController.self)
        let vc = self.storyboard?.instantiateViewController(identifier: viewControllerID ) as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func handlePresentSegue<ViewController : UIViewController>(viewController : ViewController.Type , completion : (() -> Void)? = nil){
        
        let viewControllerID = String(describing: viewController.self)
        let vc = self.storyboard?.instantiateViewController(identifier: viewControllerID ) as! ViewController
        self.present(vc, animated: true, completion: completion)
        
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UITableView {
    func registerCell<Cell : UITableViewCell>(cell : Cell.Type){
        
        let nibName = String(describing: cell.self) // transform classCellName to String
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeCell<Cell : UITableViewCell>() -> Cell {
        
        let cellID = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: cellID) as? Cell else{fatalError()}
        return cell
    }
}

extension UIViewController {
    
    func setAction(title:String , message: String ,actionTitle: String , handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: handler)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
