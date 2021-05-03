//
//  Calculator.swift
//  Calculator midtern
//
//  Created by Lab1422 on 2021/4/23.
//

import Foundation

struct Calculator{
    
    func convert(str:String) -> Float{
        var result:Double = 0
        let expression = NSExpression(format: str)
        result = expression.expressionValue(with: nil, context: nil) as! Double
        let final = Float(result)
        return final
    }
    
    func percent(str:String) -> Float{
        var final:Float = 0
        final = Float(str) ?? 0 / 100
        return final
    }
    
}
