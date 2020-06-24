//
//  ViewController2.swift
//  Msg-alertNnotif-Test
//
//  Created by 김민영 on 2020/06/24.
//  Copyright © 2020 KIMMINYOUNG. All rights reserved.
//

import Foundation
import UIKit

import UserNotifications

class ViewController2 : UIViewController{
    
    @IBOutlet weak var msg: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { setting in
                
                if setting.authorizationStatus ==  UNAuthorizationStatus.authorized {
                    
                    DispatchQueue.main.async {
                        let nContent = UNMutableNotificationContent()
                        nContent.body = (self.msg.text)!
                        nContent.title = "미리 알림"
                        nContent.sound = UNNotificationSound.default
                        
                        let time = self.datePicker.date.timeIntervalSinceNow
                        
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        
                        let req = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(req) {(_) in
                            DispatchQueue.main.async {
                                let date = self.datePicker.date.addingTimeInterval(9*60*60)
                                
                                let msg = "알람이 등록되었습니다. \n 등록된 알람은 \(date)에 발송됩니다."
                                
                                let alert = UIAlertController(title: "알람등록", message: msg, preferredStyle: .alert)
                                
                                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                                
                                alert.addAction(ok)
                                
                                self.present(alert, animated: false, completion: nil)

                            }
                        }
                        
                    }
                    
                }else{
                    let alert = UIAlertController(title: "알림등록", message: "알림이 허용되지 있지 않습니다.", preferredStyle: .alert)
                    
                    let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                    
                    alert.addAction(ok)
                    
                    self.present(alert, animated: false, completion: nil)
                    
                    return
                }
                
            }
        }else {
            
        }
        
    }
    
}
