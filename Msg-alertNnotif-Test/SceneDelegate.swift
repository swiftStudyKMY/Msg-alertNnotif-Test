//
//  SceneDelegate.swift
//  Msg-alertNnotif-Test
//
//  Created by 김민영 on 2020/06/24.
//  Copyright © 2020 KIMMINYOUNG. All rights reserved.
//

import UIKit
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
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
        print("sceneWillResignActive call!!")
        
        if #available(iOS 10.0, *){
            
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                
                if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                    
                    let nContents = UNMutableNotificationContent()
                    
                    nContents.badge = 1
                    nContents.title = "로컬 알람 메세지"
                    nContents.subtitle = "로컬 알람 메세지~~~"
                    nContents.body = "로컬 알람 메세지~~~~~~123123112312"
                    nContents.sound = UNNotificationSound.default
                    nContents.userInfo = ["name":"KMY"]
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    let req = UNNotificationRequest(identifier: "wakeup", content: nContents, trigger: trigger)
                    
                    UNUserNotificationCenter.current().add(req)
                    
                    
                }else{
                    print("사용자가 동의하지 않음.")
                }
            }
        }else{
            //UILocalNotification 객체를 이용한 알림(iOS9이하)
            let setting = UIApplication.shared.currentUserNotificationSettings
            
            //허용 거부시 .none
            guard setting?.types != .none else {
                print("can't Schedule")
                return
            }
            
            let noti = UILocalNotification()
            noti.fireDate = Date(timeIntervalSinceNow: 10)
            noti.timeZone = TimeZone.autoupdatingCurrent
            noti.alertBody = "로컬알람 바디"
            noti.alertAction = "로컬알람 액션"
            noti.applicationIconBadgeNumber = 1
            noti.soundName = UILocalNotificationDefaultSoundName
            noti.userInfo = ["name":"kmy"]
            
            UIApplication.shared.scheduleLocalNotification(noti)
            
//            fireDate 무시하고 바로 보내기
//            UIApplication.shared.presentLocalNotificationNow(<#T##notification: UILocalNotification##UILocalNotification#>)
        }
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

