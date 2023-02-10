//
//  SceneDelegate.swift
//  Millionaire_v2
//
//  Created by Evgeny Mikhaylov on 10.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        // можно назначить свой ViewController с которым работаешь
        window?.rootViewController = ViewController()         // Default
        window?.makeKeyAndVisible()
    }
}

