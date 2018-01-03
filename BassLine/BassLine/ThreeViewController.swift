//
//  ThreeViewController.swift
//  BassLine
//
//  Created by 林兴栋 on 2017/12/29.
//  Copyright © 2017年 林兴栋. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {
    @IBOutlet weak var clock: UIImageView!
    @IBOutlet weak var hour: UIImageView!
    @IBOutlet weak var min: UIImageView!
    @IBOutlet weak var second: UIImageView!
    lazy var topView: UIView = {
        var top = UIView.init();
        top.frame = CGRect.init(x: 100, y: 64, width: 200, height: 100);
        top.backgroundColor = UIColor.yellow;
        return top;
    }()
    lazy var blueLayer: CALayer = {
        let blue = CALayer.init();
        blue.frame = CGRect.init(x: 0, y: 25, width: 50, height: 50);
        blue.backgroundColor = UIColor.blue.cgColor;
        return blue;
    }()
    lazy var greenLayer:CALayer = {
        let green = CALayer.init();
        green.frame = CGRect.init(x: 50, y: 25, width: 50, height: 50);
        green.backgroundColor = UIColor.green.cgColor;
        return green;
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //得到当前点在self.view上的坐标
        let point = touches.first?.location(in: self.view);
        
//        let layer = self.view.layer.hitTest(point!);
//        if layer == blueLayer {
//            let alert = UIAlertController.init(title: "提示", message: "点了蓝色方块", preferredStyle: .alert);
//            let okbtn = UIAlertAction.init(title: "确认", style: .default, handler: { (action) in
//                print(action.title!);
//            })
//            alert.addAction(okbtn);
//            present(alert, animated: true, completion: {
//
//            });
//        }
//        return;
        
        //self.view中的坐标point转换到topView坐标
        let topPoint = topView.layer.convert(point!, from: self.view.layer);
        //判断一下这个点是不是在topview内
        if topView.layer.contains(topPoint) {
            //判断一下是不是在蓝色layer里
            let bluePoint = blueLayer.convert(topPoint, from: topView.layer);
            if blueLayer.contains(bluePoint) {
                let alert = UIAlertController.init(title: "提示", message: "点了蓝色方块", preferredStyle: .alert);
                let okbtn = UIAlertAction.init(title: "确认", style: .default, handler: { (action) in
                    print(action.title!);
                })
                alert.addAction(okbtn);
                present(alert, animated: true, completion: {
                    
                });

            }else{
                let greenPoint = greenLayer.convert(topPoint, from: topView.layer);
                if greenLayer.contains(greenPoint) {
                    let alert = UIAlertController.init(title: "提示", message: "点了绿色方块", preferredStyle: .alert);
                    present(alert, animated: true, completion: {
                        
                    });
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 2), execute: {
                        alert.dismiss(animated: true, completion: {
                            
                        });
                    })
                    
                }
            }
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(topView);
        self.topView.layer.addSublayer(blueLayer);
        self.topView.layer.addSublayer(greenLayer);
        
        hour.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.9);
        min.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.9);
        second.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.9);
        clock.layer.zPosition = 0.01;
        hour.layer.zPosition = 0.03;
        min.layer.zPosition = 0.07;
        second.layer.zPosition = 1.0;
//        let tem = min.layer.convert(CGPoint.init(x: 10, y: 10), from: hour.layer);//hour里的坐标，相当于min中的坐标为
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ThreeViewController.tick), userInfo: nil, repeats: true)
        tick();
    }
    func tick() {
        let calendar = NSCalendar.init(identifier: .gregorian);
        let units = UInt8(CFCalendarUnit.hour.rawValue) | UInt8(CFCalendarUnit.minute.rawValue) | UInt8(CFCalendarUnit.second.rawValue);
        let components = calendar?.components(NSCalendar.Unit(rawValue: NSCalendar.Unit.RawValue(units)), from: NSDate.init() as Date);
        let hoursAngle = (Double((components?.hour)!) / 12.0) * .pi * 2.0;
        let minsAngle = (Double((components?.minute)!) / 60.0) * .pi * 2.0;
        let secsAngle = (Double((components?.second)!) / 60.0) * .pi * 2.0;
        hour.transform = CGAffineTransform.init(rotationAngle: CGFloat(hoursAngle));
        min.transform = CGAffineTransform.init(rotationAngle: CGFloat(minsAngle));
        second.transform = CGAffineTransform.init(rotationAngle: CGFloat(secsAngle));
        
        
        
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
