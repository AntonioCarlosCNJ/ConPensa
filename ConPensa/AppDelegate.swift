//
//  AppDelegate.swift
//  ConPensa
//
//  Created by Filipe Lopes on 08/07/19.
//  Copyright © 2019 Filipe Lopes. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
      
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ConPensaCoreData")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError?{
                fatalError("Deu error no persistentContainer")
            }
        })
        
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Deu ruim no saveContext(), \(nserror),\(nserror.userInfo)")
            }
        }
    }

}

