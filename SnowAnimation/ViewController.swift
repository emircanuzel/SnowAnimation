//
//  ViewController.swift
//  SnowAnimation
//
//  Created by Emircan UZEL on 22.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchButton: UISwitch!
    var isAnimationStart : Bool = false
    let snowFlakeLayer = CAEmitterLayer()
    let snowFlakeItem = CAEmitterCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchButtonTapped(_ sender: Any) {
        if !self.isAnimationStart{
            self.isAnimationStart = true
            snowFlakeItem.contents = UIImage(named: "snowFlake")?.cgImage
            snowFlakeItem.scale = 0.10  // Her kar tanesinin büyüklüğü
            snowFlakeItem.scaleRange = 0.3 // Her kar tanesinin büyüklüğü
            snowFlakeItem.emissionRange = .pi
            snowFlakeItem.lifetime = 30 // Her kar tanesinin ekranda kalacağı süreyi belirler
            snowFlakeItem.birthRate = 40 // Her saniyede kaç adet kar tanesinin oluturulacağını belirler. Kar yağışının sıklığıda diyebiliriz.
            snowFlakeItem.velocity = -50 // Hücrenin başlangıç hızı
            snowFlakeItem.velocityRange = -40 // Hücrenin hızı, velocityRange ile belirtilen aralık içinde rastgele bir miktarda değişecektir.
            snowFlakeItem.yAcceleration = 30
            snowFlakeItem.xAcceleration = 0
            snowFlakeItem.spin = -0.5 // Kar tanelerinin dönme hızı
            snowFlakeItem.spinRange = 1.0  // Kar tanelerinin dönme hızının aralığı
            snowFlakeLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
            snowFlakeLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
            snowFlakeLayer.emitterShape = CAEmitterLayerEmitterShape.line
            snowFlakeLayer.beginTime = CACurrentMediaTime()
            snowFlakeLayer.timeOffset = 10
            snowFlakeLayer.emitterCells = [snowFlakeItem]
            
            view.layer.addSublayer(snowFlakeLayer)
        }else{
            self.isAnimationStart = false
            self.snowFlakeLayer.removeFromSuperlayer()
        }
    }
    
}

