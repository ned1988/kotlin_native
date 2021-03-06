//
//  ViewController.swift
//  Shared
//
//  Created by Denys Meloshyn on 30/11/2018.
//  Copyright © 2018 Denys Meloshyn. All rights reserved.
//

import UIKit
import SharedCode
import HTTPNetworking

@objc class HTTPNetworkObjc: NSObject, LoaderI {
    func get(url: String, completion: @escaping (String) -> KotlinUnit) {
        let request = URLRequest(url: URL(string: url)!)
        HTTPNetwork.instance.load(request) { (data, response, error) in
            _ = completion(String(data: data!, encoding: String.Encoding.utf8)!)
        }
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let m = Manager(loader: HTTPNetworkObjc())
        m.loadData { (data) in
            print("\(data)")
            return KotlinUnit()
        }
        print(CommonKt.createApplicationScreenMessage())
        // Do any additional setup after loading the view, typically from a nib.
    }
}

