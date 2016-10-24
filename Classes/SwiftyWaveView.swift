//
//  SwiftyWaveView.swift
//  SwiftyWave
//
//  Created by Octree on 2016/10/24.
//  Copyright © 2016年 Octree. All rights reserved.
//

import UIKit
import QuartzCore

fileprivate func gfn(x: CGFloat) -> CGFloat {

    return pow((8 / (8 + pow(x, 4))), 8)
}

fileprivate func line(att: CGFloat, a: Int, b: CGFloat) -> (CGFloat) -> CGFloat {

    return {x in
    
        return gfn(x: x) * sin(CGFloat(a) * x - b) / att
    }
}

fileprivate struct Wave {

    var attenuation: CGFloat
    var lineWidth: CGFloat
    var opacity: CGFloat
    
    init(att: CGFloat, lineWidth: CGFloat, opacity: CGFloat) {
        
        self.attenuation = att
        self.lineWidth = lineWidth
        self.opacity = opacity
    }
}

@IBDesignable
open class SwiftyWaveView: UIView {
    
    fileprivate var phase: CGFloat = 0.0
    fileprivate var displayLink: CADisplayLink?
    @IBInspectable
    public var speed: CGFloat = 0.1
    @IBInspectable
    public var amplitude: CGFloat = 0.5
    @IBInspectable
    public var frequency: Int = 6
    @IBInspectable
    public var color: UIColor = .white

    fileprivate let waves = [Wave(att: 1, lineWidth: 1.5, opacity: 1.0),
                             Wave(att: 2, lineWidth: 1.0, opacity: 0.6),
                             Wave(att: 4, lineWidth: 1.0, opacity: 0.4),
                             Wave(att: -6, lineWidth: 1.0, opacity: 0.2),
                             Wave(att: -2, lineWidth: 1.0, opacity: 0.1)
                            ]
    fileprivate let shapeLayers = [CAShapeLayer(),
                                   CAShapeLayer(),
                                   CAShapeLayer(),
                                   CAShapeLayer(),
                                   CAShapeLayer()]
    
    // MARK: Life Cycle
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        shapeLayers.forEach(layer.addSublayer)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        shapeLayers.forEach(layer.addSublayer)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        drawLayers()
    }
    
    // MARK: Public Methods
    
    public func start() {
        
        stop()
        displayLink = CADisplayLink(target: self, selector: #selector(SwiftyWaveView.drawWaves))
        displayLink!.preferredFramesPerSecond = 60
        displayLink!.add(to: RunLoop.main, forMode: .commonModes)
    }
    
   public func stop() {
        
        displayLink?.isPaused = true
        displayLink?.remove(from: RunLoop.main, forMode: .commonModes)
        displayLink = nil
    }
    
    
    // MARK: Private Methods
    
    //
    @objc private func drawWaves() {
        
        phase = (phase + CGFloat(M_PI) * speed)
            .truncatingRemainder(dividingBy: CGFloat(2 * M_PI))
        
        let count = waves.count
        
        for i in 0 ..< count {
            
            let shapLayer = shapeLayers[i]
            let wave = waves[i]
            shapLayer.path = bezierPath(for: wave).cgPath
        }

    }
    
    
    private func drawLayers() {
    
        let count = waves.count
        
        for i in 0 ..< count {
        
            let shapLayer = shapeLayers[i]
            let wave = waves[i]
            shapLayer.fillColor = UIColor.clear.cgColor
            shapLayer.lineWidth = wave.lineWidth
            shapLayer.strokeColor = color.withAlphaComponent(wave.opacity).cgColor
            shapLayer.path = bezierPath(for: wave).cgPath
        }
    }
    
    
    private func bezierPath(for wave: Wave) -> UIBezierPath {
    
        let path = UIBezierPath()
        
        let width = frame.width
        let height = frame.height
        let centerY = height / 2
        let scale = width / 4
        let centerX = width / 2
        let f = line(att: wave.attenuation, a: frequency, b: phase)
        path.move(to: CGPoint(x: 0, y: centerY))
        for i in 0...Int(width) {
            
            let x = (CGFloat(i) - centerX) / scale
            let y = f(x) * scale * amplitude + centerY
            path.addLine(to: CGPoint(x: CGFloat(i), y: y))
        }
        
        return path
    }
}
