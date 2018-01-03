//
//  MainViewController.swift
//  BassLine
//
//  Created by 林兴栋 on 2017/12/29.
//  Copyright © 2017年 林兴栋. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    let list = ["图层树","寄宿图","图层几何学","视觉效果","变换","专有图层","隐式动画","显示动画","图层时间","缓冲","基于定时器的动画","性能调优","高效绘图","图像IO","图层性能",];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch list[indexPath.row] {
        case "寄宿图":
            let sbVC:UIViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondViewController");
            self.navigationController?.pushViewController(sbVC, animated: true);
            break
        case "图层几何学":
            let threeVC:UIViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ThreeViewController");
            self.navigationController?.pushViewController(threeVC, animated: true);
            break
        case "视觉效果":
            let fourVC:UIViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FourViewController");
            self.navigationController?.pushViewController(fourVC, animated: true);
            break
        default:break
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell");
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "UITableViewCell");
        }
        cell?.textLabel?.text = list[indexPath.row];
        return cell!;
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
