//
//  AppDelegate.swift
//  IOS6-HW14-DmitryDorodniy
//
//  Created by Dmitry Dorodniy on 07.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        setNavigation()
        window?.makeKeyAndVisible()

        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            navigationBarAppearance.backgroundColor = .clear

            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            tabBarAppearance.backgroundColor = .clear
        }
        return true
    }

    func setNavigation() {
        let tabBarController = UITabBarController()

        let mediaLibraryViewController = MediaLibraryViewController()
        mediaLibraryViewController.tabBarItem = UITabBarItem(title: "Медиатека",
                                                             image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                                             tag: 0)

        let forYouViewController = ForYouViewController()
        forYouViewController.tabBarItem = UITabBarItem(title: "Для Вас",
                                                       image: UIImage(systemName: "heart.text.square.fill"),
                                                       tag: 1)
        
        let albumViewController = AlbumViewController()
        albumViewController.tabBarItem = UITabBarItem(title: "Альбомы",
                                                      image: UIImage(systemName: "rectangle.stack.fill"),
                                                      tag: 2)
        let albumNavigationViewController = UINavigationController(rootViewController: albumViewController)


        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск",
                                                       image: UIImage(systemName: "magnifyingglass"),
                                                       tag: 3)

        tabBarController.setViewControllers([
            mediaLibraryViewController,
            forYouViewController,
            albumNavigationViewController,
            searchViewController], animated: true)

        window?.rootViewController = tabBarController
    }
}


