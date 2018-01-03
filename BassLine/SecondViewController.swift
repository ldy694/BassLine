//
//  SecondViewController.swift
//  BassLine
//
//  Created by 林兴栋 on 2017/12/25.
//  Copyright © 2017年 林兴栋. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,CALayerDelegate {
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    
    @IBAction func instantBackHome(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let miniLayer:CALayer = CALayer.init();
//        miniLayer.frame = CGRect.init(x: 50, y: 50, width: 100, height: 100);
//        miniLayer.backgroundColor = UIColor.red.cgColor;
//        bgView.backgroundColor = UIColor.orange;
//        bgView.layer.addSublayer(miniLayer);
        let image:UIImage = UIImage.init(named: "icon-答题-绿色")!;
        
        //set igloo sprite

        self.addSprite(image: image, rect: CGRect.init(x: 0, y: 0, width: 1, height: 1), layer: bgView.layer);
        //set cone sprite
        self.addSprite(image: image, rect: CGRect.init(x: 0, y: 0, width: 1, height: 1), layer: secondView.layer);
        secondView.layer.contentsCenter = CGRect.init(x: 0.5, y: 0.5, width: 0, height: 0)
        secondView.layer.contentsGravity = kCAGravityResize;
//        secondView.layer.delegate = self;
//        secondView.layer.display();
        
        let blueLayer:CALayer = CALayer.init();
        let imageB:UIImage = UIImage.init(named: "icon-寻宝-绿色")!;
        blueLayer.contents = imageB.cgImage;
        blueLayer.frame = CGRect.init(x: 10, y: 10, width: 50, height: 50);
        blueLayer.backgroundColor = UIColor.blue.cgColor;
        blueLayer.delegate = self;
        blueLayer.contentsScale = UIScreen.main.scale;
        secondView.layer.addSublayer(blueLayer);
        blueLayer.display();
        blueLayer.removeFromSuperlayer();
        
        let bigImage = UIImage.init(named: "moreimage");
        view1.layer.contents = bigImage?.cgImage;
        view1.layer.contentsCenter = CGRect.init(x: 0, y: 0, width: 0.5, height: 0.5);
        view2.layer.contents = bigImage?.cgImage;
        view2.layer.contentsCenter = CGRect.init(x: 0.5, y: 0.5, width: 0.5, height: 0.5);
        view3.layer.contents = bigImage?.cgImage;
        view3.layer.contentsCenter = CGRect.init(x: 0.5, y: 0, width: 0.5, height: 0.5);
        view4.layer.contents = bigImage?.cgImage;
        view4.layer.contentsCenter = CGRect.init(x: 0, y: 0.5, width: 0.5, height: 0.5);
        
        
    }

    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setStrokeColor(UIColor.red.cgColor);
        ctx.setLineWidth(10);

        ctx.strokeEllipse(in: layer.bounds);
    }
    
    func addSprite(image:UIImage,rect:CGRect,layer:CALayer) -> Void {
        layer.contents = image.cgImage;
        
        //scale contents to fit
        layer.contentsGravity = kCAGravityResizeAspect;
        
        //set contentsRect
        layer.contentsRect = rect;
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
