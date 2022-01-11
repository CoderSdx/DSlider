//
//  DSlider.swift
//  Pods
//
//  Created by dexiong on 2022/1/11.
//

import UIKit

public protocol DSliderDelegate : NSObjectProtocol {
    func slider(_ slider: DSlider, value: Float)
}

public class DSlider : UISlider {
    public enum SliderType {
        case `default`
        case marks
    }
    
    var type: SliderType
    // type == .marks 分段数
    public var marks: Int = 5
    
    /// value changed
    public weak var delegate: DSliderDelegate?
    
    /// slider 高度和frame.height 有区别
    public var barHeight: CGFloat = 8.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// type == .marks 选中的刻度颜色
    public var minimumMarkColor: UIColor = .white {
        didSet {
            setNeedsDisplay()
        }
    }
    /// type == .marks 未选中的刻度颜色
    public var maximumMarkColor: UIColor = .darkGray {
        didSet {
            setNeedsDisplay()
        }
    }
     
    public init(_ type: SliderType) {
        self.type = type
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        setMinimumTrackImage(trackImage(rect: rect, color: minimumTrackTintColor ?? .blue, markColor: minimumMarkColor), for: .normal)
        setMaximumTrackImage(trackImage(rect: rect, color: maximumTrackTintColor ?? .lightGray, markColor: maximumMarkColor), for: .normal)
    }
    
    func trackImage(rect: CGRect, color: UIColor, markColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()!
        context.setLineCap(.round)
        context.setLineWidth(barHeight)
        context.move(to: CGPoint(x: barHeight * 0.5, y: rect.height * 0.5))
        context.addLine(to: CGPoint(x: rect.width - barHeight * 0.5, y: rect.height * 0.5))
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        switch type {
        case .default:
            break
        case .marks:
            for i in 0...marks {
                context.setLineWidth(barHeight)
                context.setLineCap(.round)
                var position: CGFloat = CGFloat(i) * (rect.width / CGFloat(marks))
                if i == 0 { position += barHeight * 0.5 } else if i == marks { position -= barHeight * 0.5 }
                context.move(to: CGPoint(x:position, y: rect.height * 0.5))
                context.addLine(to: CGPoint(x:position, y:rect.height * 0.5))
                context.setStrokeColor(markColor.cgColor)
                context.strokePath()
            }
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    public override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        switch type {
        case .default:
            delegate?.slider(self, value: value)
        case .marks:
            guard marks != 0 else { delegate?.slider(self, value: value); return }
            let average = maximumValue / Float(marks)
            let round = round(value / average)
            if value - average * round > average * 0.5 {
                value = (round + 1) * average
            } else {
                value = round * average
            }
            delegate?.slider(self, value: value)
        }
        
    }
}
