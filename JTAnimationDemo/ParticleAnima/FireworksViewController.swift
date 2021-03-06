//
//  FireworksViewController.swift
//  JTAnimationDemo
//
//  Created by jiangT on 2017/8/28.
//  Copyright © 2017年 jiangT. All rights reserved.
//

import UIKit

class FireworksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 44/255.0, green: 34/255.0, blue: 85/255.0, alpha: 1)
        
        fireworksAnimation()
    }
    
    /// 烟花粒子动画
    func fireworksAnimation() {
        
        //分为3种粒子，子弹粒子，爆炸粒子，散开粒子
        let fireworkEmitter = CAEmitterLayer()
        fireworkEmitter.emitterPosition = CGPoint(x: self.view.bounds.size.width/2.0, y: self.view.bounds.size.height)
        fireworkEmitter.emitterSize = CGSize(width: self.view.bounds.size.width/2.0, height: 0.0)
        fireworkEmitter.emitterMode = kCAEmitterLayerOutline
        fireworkEmitter.emitterShape = kCAEmitterLayerLine
        fireworkEmitter.renderMode = kCAEmitterLayerAdditive
        fireworkEmitter.seed = (arc4random()%100)+1
        
        // Create the rocket
        let rocket = CAEmitterCell()
        
        rocket.birthRate = 1.0
        rocket.velocity = 380
        rocket.velocityRange = 100
        rocket.yAcceleration = 75
        rocket.lifetime = 1.02
        
        //小圆球图片
        rocket.contents			= UIImage.init(named: "dot")?.cgImage
        rocket.scale			= 0.2;
        rocket.color			= UIColor.yellow.cgColor
        rocket.greenRange		= 1.0;		// different colors
        rocket.redRange			= 1.0;
        rocket.blueRange		= 1.0;
        rocket.spinRange		= CGFloat(M_PI);		// slow spin
        
        // the burst object cannot be seen, but will spawn the sparks
        // we change the color here, since the sparks inherit its value
        let burst = CAEmitterCell()
        
        burst.birthRate			= 1.0;		// at the end of travel
        burst.velocity			= 0;        //速度为0
        burst.scale				= 2.5;      //大小
        burst.redSpeed = -1.5// shifting
        burst.blueSpeed = +1.5
        burst.greenSpeed = +1.0
        burst.lifetime			= 0.35;     //存在时间
        
        // and finally, the sparks
        let spark = CAEmitterCell()
        
        spark.birthRate			= 400;
        spark.velocity			= 125;
        spark.emissionRange		= CGFloat(2 * M_PI);	// 360 度
        spark.yAcceleration		= 75;		// gravity
        spark.lifetime			= 3;
        //星星图片
        spark.contents			= UIImage.init(named: "star")?.cgImage
        spark.scaleSpeed		= -0.2;
        spark.greenSpeed = -0.1;
        spark.redSpeed = 0.4;
        spark.blueSpeed	= -0.1;
        spark.alphaSpeed = -0.25;
        spark.spin = CGFloat(2 * M_PI)
        spark.spinRange	= CGFloat(2 * M_PI)
        
        // 3种粒子组合，可以根据顺序，依次烟花弹－烟花弹粒子爆炸－爆炸散开粒子
        fireworkEmitter.emitterCells	= [rocket];
        rocket.emitterCells				= [burst];
        burst.emitterCells				= [spark];
        self.view.layer.addSublayer(fireworkEmitter)
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
