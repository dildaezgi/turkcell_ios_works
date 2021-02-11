//
//  Util.swift
//  3-Days
//
//  Created by Dilda Ezgi Metincan on 7.01.2021.
//

import Foundation
class Util
{
    
    var name = "ali"
    
    func noParameter ()
    {
        let num1 = 40
        let num2 = 80
        let sum = num1 + num2
        print("Sum : ", sum)
    }
    
    func parameter(num1:Int, num2:Int)
    {
        let sum = num1 + num2
        print("Sum : ", sum)
    }
    
    func parameterReturn(num1:Int, num2:Int) -> Int
    {
        let sum = num1 + num2
        return sum // -> karşısında yazan tür return eder yani burda int döner
    }
    
    func parameterReturns(num1:Int, num2:Int) -> (Int,String)
    {
        let sum = num1 + num2
        return (sum, "Ali")
    }
    
    //ad soyad birleştirme
    
    func stringConcat(name: String, surname:String) -> String
    {
        let st = "\(name) \(surname)"
        return st
        
    }
}
