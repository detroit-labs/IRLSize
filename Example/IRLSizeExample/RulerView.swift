//
//  RulerView.swift
//  IRLSizeExample
//
//  Created by Jeff Kelley on 6/28/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

import Foundation
import UIKit

private class EigthInchConverter: UnitConverter, NSCopying {
    
    let inches = UnitLength.inches
    
    override func baseUnitValue(fromValue value: Double) -> Double {
        return inches.converter.baseUnitValue(fromValue: value) / 8
    }
    
    override func value(fromBaseUnitValue baseUnitValue: Double) -> Double {
        return inches.converter.value(fromBaseUnitValue: baseUnitValue) * 8
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
    
}

private class SixteenthInchConverter: UnitConverter, NSCopying {
    
    let inches = UnitLength.inches
    
    override func baseUnitValue(fromValue value: Double) -> Double {
        return inches.converter.baseUnitValue(fromValue: value) / 16
    }
    
    override func value(fromBaseUnitValue baseUnitValue: Double) -> Double {
        return inches.converter.value(fromBaseUnitValue: baseUnitValue) * 16
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
    
}

public class RulerView: UIView {
    
    let locale = Locale.autoupdatingCurrent
    
    @IBInspectable var hashColor: UIColor = .black
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        hashColor = .black
    }
    
    public override func draw(_ rect: CGRect) {
        let hashHeight = bounds.height / 3.0
        
        if locale.usesMetricSystem {
            drawHashes(for: .centimeters,
                       height: hashHeight,
                       lineWidth: 2.0)
            
            drawHashes(for: .millimeters,
                       height: hashHeight / 2.0,
                       lineWidth: 2.0)
        }
        else {
            drawHashes(for: .inches,
                       height: hashHeight,
                       lineWidth: 2.0)
            
            drawHashes(for: UnitLength(symbol: "1/8 in",
                                       converter: EigthInchConverter()),
                       height: hashHeight / 2.0,
                       lineWidth: 2.0)
            
            drawHashes(for: UnitLength(symbol: "1/16 in",
                                       converter: SixteenthInchConverter()),
                       height: hashHeight / 3.0,
                       lineWidth: 1.0)
        }
    }
    
    private func xOffsets(for unit: UnitLength) -> Set<CGFloat> {
        guard let physicalWidth = physicalWidth else { return [] }
        
        let totalUnits = physicalWidth.converted(to: unit)
        let singleUnit = Measurement(value: 1.0, unit: unit)
        
        let unitsWide = totalUnits.value / singleUnit.value
        let numberOfHashes = Int(floor(unitsWide)) + 1
        
        let hashSpacing = bounds.width / CGFloat(unitsWide)
        
        var xOffsets: Set<CGFloat> = Set()
        
        for i in 1 ... numberOfHashes {
            xOffsets.insert(CGFloat(i) * hashSpacing)
        }
        
        return xOffsets
    }
    
    private func drawHashes(for unit: UnitLength,
                            height: CGFloat,
                            lineWidth: CGFloat) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.saveGState()
        
        context.setLineWidth(lineWidth)
        context.setStrokeColor(hashColor.cgColor)
        context.setShouldAntialias(false)
        
        for offset in xOffsets(for: unit) {
            context.move(to: CGPoint(x: offset, y: 0))
            context.addLine(to: CGPoint(x: offset, y: height))
            
            context.move(to: CGPoint(x: offset, y: bounds.maxY))
            context.addLine(to: CGPoint(x: offset, y: bounds.maxY - height))
            
            context.strokePath()
        }
        
        context.restoreGState()
    }
    
}
