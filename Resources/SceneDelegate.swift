//
//  SceneDelegate.swift
//  instgramApp
//
//  Created by Ebrahim  Mo Gedamy on 8/30/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let tabBar = TabbarVC()
        let cameraVc = UINavigationController(rootViewController: CameraVC())
        let exploreVc = UINavigationController(rootViewController: ExploreVC())
        let homeVc = UINavigationController(rootViewController: HomeVC())
        let notificationVc = UINavigationController(rootViewController: NotificationsVC())
        let profileVc = UINavigationController(rootViewController: ProfileVC())

        let tabIcon1 = UITabBarItem(title: "Camera", image: UIImage(named: ""), selectedImage: nil)
        let tabIcon2 = UITabBarItem(title: "Explore", image: UIImage(named: ""), selectedImage: nil)
        let tabIcon3 = UITabBarItem(title: "Home", image: UIImage(named: ""), selectedImage: nil)
        let tabIcon4 = UITabBarItem(title: "Notification", image: UIImage(named: ""), selectedImage: nil)
        let tabIcon5 = UITabBarItem(title: "Profile", image: UIImage(named: ""), selectedImage: nil)
        
             cameraVc.tabBarItem = tabIcon1
             exploreVc.tabBarItem = tabIcon2
             homeVc.tabBarItem = tabIcon3
             notificationVc.tabBarItem = tabIcon4
             profileVc.tabBarItem = tabIcon5
        
        let tabControllers = [cameraVc, exploreVc, homeVc, notificationVc, profileVc]
        tabBar.setViewControllers(tabControllers, animated: true)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

