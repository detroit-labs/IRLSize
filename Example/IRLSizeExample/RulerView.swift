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
    
    private override func copy() -> AnyObject {
        return self
    }
    
    private func copy(with zone: NSZone? = nil) -> AnyObject {
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
    
    private override func copy() -> AnyObject {
        return self
    }
    
    private func copy(with zone: NSZone? = nil) -> AnyObject {
        return self
    }
    
}

public class RulerView: UIView {
    
    let locale = Locale.autoupdatingCurrent()
    
    @IBInspectable var hashColor: UIColor = .black()
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        hashColor = .black()
    }
    
    var rulerUnit: UnitLength {
        if locale.usesMetricSystem {
            return UnitLength.centimeters
        }
        else {
            return UnitLength.inches
        }
    }
    
    var mediumRulerUnit: UnitLength {
        if locale.usesMetricSystem {
            return UnitLength.millimeters
        }
        else {
            return UnitLength(symbol: "1/8 in", converter: EigthInchConverter())
        }
    }
    
    var smallRulerUnit: UnitLength? {
        if locale.usesMetricSystem {
            return nil
        }
        else {
            return UnitLength(symbol: "1/16 in", converter: SixteenthInchConverter())
        }
    }
    
    public override func draw(_ rect: CGRect) {
        let hashHeight = bounds.height / 3.0
        
        drawHashes(for: rulerUnit,
                   height: hashHeight,
                   lineWidth: 2)
        
        drawHashes(for: mediumRulerUnit,
                   skipping: [rulerUnit],
                   height: hashHeight / 2,
                   lineWidth: 1)
        
        if let smallUnit = smallRulerUnit {
            drawHashes(for: smallUnit,
                       skipping: [rulerUnit, mediumRulerUnit],
                       height: hashHeight / 3,
                       lineWidth: 1)
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
                            skipping unitsToSkip: [UnitLength] = [],
                            height: CGFloat,
                            lineWidth: CGFloat) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.saveGState()
        
        context?.setLineWidth(lineWidth)
        context?.setStrokeColor(hashColor.cgColor)
        context?.setShouldAntialias(false)
        
        var offsets: Set<CGFloat> = xOffsets(for: unit)
        
        for skippedUnit in unitsToSkip {
            offsets.subtract(xOffsets(for: skippedUnit))
        }
        
        for offset in offsets {
            context?.moveTo(x: offset, y: 0)
            context?.addLineTo(x: offset, y: height)
            
            context?.moveTo(x: offset, y: bounds.maxY)
            context?.addLineTo(x: offset, y: bounds.maxY - height)
            
            context?.strokePath()
        }
        
        context?.restoreGState()
    }
    
}
