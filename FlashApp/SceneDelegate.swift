//
//  SceneDelegate.swift
//  FlashApp
//
//  Created by Audrey Welch on 4/1/20.
//  Copyright © 2020 Audrey Welch. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navController: UINavigationController!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Get the managed object context from the shared persistent container.
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let rootController = UIViewController()
        rootController.view.backgroundColor = .systemRed
        
        let button = UIButton(type: .infoLight)
        button.center = CGPoint(x: rootController.view.bounds.midX,
                                y: rootController.view.bounds.midY)
        
        rootController.view.addSubview(button)
        
        button.addTarget(self, action: #selector(goToNextScreen(_:)), for: .primaryActionTriggered)
        
        // Create navigation view controller
        // Assign the root view controller to our navigation controller
        navController = UINavigationController(rootViewController: rootController)


        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            
            // Create a window (doesn't exist b/c no storyboard)
            // Assign it to the window scene
            let window = UIWindow(windowScene: windowScene)
            
            // Assign navigation controller to our window
            window.rootViewController = navController
            self.window = window
            
            // Make window first responder
            // Make key (bring window forward) and make visible (show it on the screen)
            window.makeKeyAndVisible()
        }
    }
    
    @IBAction func goToNextScreen(_ sender: Any) {
        print("Action was called!")
        
        let secondaryController = UIViewController()
        secondaryController.view.backgroundColor = .systemYellow
        
        navController.pushViewController(secondaryController, animated: true)
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

