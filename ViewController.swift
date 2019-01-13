//
//  ViewController.swift
//  hello-push
//
//  Created by kiyohiro kawamura on 2019/01/13.
//  Copyright © 2019 kiyohiro kawamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel()
        label.frame.size = CGSize(width: 100.0, height: 200.0)
        label.text = "Hello Push Notification"
        self.view.addSubview(label)
    }


}

