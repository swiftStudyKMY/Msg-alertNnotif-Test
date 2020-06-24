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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func alertBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "제목", message: "항목을 선택해주세요.", preferredStyle: .alert) //두개 이상부터는 하단으로 내려간다.
        
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        let exec = UIAlertAction(title: "실행", style: .destructive, handler: nil)    //빨간색
        let stop = UIAlertAction(title: "중지", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

