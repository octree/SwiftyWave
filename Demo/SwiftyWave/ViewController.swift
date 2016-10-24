//
//  ViewController.swift
//  SwiftyWave
//
//  Created by Octree on 2016/10/24.
//  Copyright © 2016年 Octree. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var waveView: SwiftyWaveView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func start(_ sender: AnyObject) {
        
        waveView.start()
    }
   
    @IBAction func stop(_ sender: AnyObject) {
        
        waveView.stop()
    }

}

