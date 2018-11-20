//
//  ViewController.swift
//  NodeMCUApp
//
//  Created by Mohammed Afsul Mohammed Hussain on 19/11/18.
//  Copyright © 2018 RBT. All rights reserved.
//

import UIKit
import SwiftSocket

class ViewController: UIViewController {
    
    let client = UDPClient(address: "192.168.1.108", port: 4210)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func htons(value: CUnsignedShort) -> CUnsignedShort {
        return (value << 8) + (value >> 8);
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let data = "\(sender.value)"
        DispatchQueue.global(qos: .background).async {
            let result = self.client.send(string: data)
            if let error = result.error {
                print(error.localizedDescription)
            }
        }
    }


}

