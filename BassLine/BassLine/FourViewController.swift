//
//  FourViewController.swift
//  BassLine
//
//  Created by 林兴栋 on 2018/1/2.
//  Copyright © 2018年 林兴栋. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {
    lazy var layerView1: UIView = {
        var view = UIView.init();
        view.backgroundColor = UIColor.yellow;
        view.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100);
        return view;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(layerView1);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
