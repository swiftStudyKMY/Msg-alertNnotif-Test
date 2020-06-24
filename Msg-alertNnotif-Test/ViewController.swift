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
        
        let alert = UIAlertController(title: "제목", message: "항목을 선택해주세요.", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

