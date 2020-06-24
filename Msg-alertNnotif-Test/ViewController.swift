//
//  ViewController.swift
//  Msg-alertNnotif-Test
//
//  Created by 김민영 on 2020/06/24.
//  Copyright © 2020 KIMMINYOUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var res: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        //
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func alertBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "제목", message: "항목을 선택해주세요.", preferredStyle: .alert) //두개 이상부터는 하단으로 내려간다.
        
        let ok = UIAlertAction(title: "확인", style: .default, handler: {(_) in
            self.res.text = "확인 버튼 클릭"
        })
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: {(_) in
            self.res.text = "취소 버튼 클릭"
        })

        let exec = UIAlertAction(title: "실행", style: .destructive, handler: {(_) in
            self.res.text = "실행 버튼 클릭"
        })
        let stop = UIAlertAction(title: "중지", style: .default, handler: {(_) in
            self.res.text = "중지 버튼 클릭"
        })
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let title = "iTunes store에 로그인"
        
        let msg = "사용자의 Apple ID  801sanae@gmail.com의 암호를 입력하시오."
        
        let alert1 = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let cancel1 = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let ok1 = UIAlertAction(title: "확인", style: .default, handler: {(_) in
            if let tf = alert1.textFields?[0] {
                print(tf.text!)
//                print(">>>\(alert1.textFields?.first!.text)")
            }else{
                print("입력된 값은 없다.")
            }
        })
        
        alert1.addAction(cancel1)
        alert1.addAction(ok1)

//        alert1.addTextField(configurationHandler: <#T##((UITextField) -> Void)?##((UITextField) -> Void)?##(UITextField) -> Void#>)
        alert1.addTextField { (tf) in
            tf.placeholder = "암호"
            tf.isSecureTextEntry = true
        }

        present(alert1, animated: false)

    }
    
    @IBAction func authBtn(_ sender: Any) {
        
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            
            let loginId = alert.textFields?[0].text
            let loginPw = alert.textFields?[1].text
            
            if loginId == "muziq43" && loginPw == "1111" {
                self.res.text = "인증 성공."
            }else{
                self.res.text = "인증 실패."
            }
            
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
//        alert.addTextField { (tf) in
//            tf.placeholder = "아이디"
//            tf.isSecureTextEntry = false
//        }
        
        alert.addTextField { (tf:UITextField) in
            tf.placeholder = "아이디"
            tf.isSecureTextEntry = false
        }
        
        
//        alert.addTextField { (tf) in
//            tf.placeholder = "비밀번호"
//            tf.isSecureTextEntry = true
//        }
        
        alert.addTextField { $0.placeholder = "비밀번호"
            $0.isSecureTextEntry = true
        }
        
        self.present(alert, animated: false, completion: nil)
        
    }
    
    
    
}

