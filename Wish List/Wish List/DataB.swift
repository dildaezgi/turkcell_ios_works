//
//  DataB.swift
//  Wish List
//
//  Created by Dilda Ezgi Metincan on 25.01.2021.
//

import Foundation
import SQLite
import SCLAlertView

struct ListSt
{
    var number: Int64 = 0
    var product:String = ""
    var amount:String = ""
}

class DataB
{
    var datab:Connection!
    var tableProduct = Table("wishList")
    
    let number = Expression<Int64>("number")
    let product = Expression<String?>("product")
    let amount = Expression<String>("amount")
    
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    func fncConnection()
    {
        let  dbPath = path + "/db.sqlite3"
        print("Full Path : \(dbPath)")
        datab = try! Connection(dbPath)
        
        do
        {
            try datab.scalar(tableProduct.exists)
        }
        catch
        {
           try! datab.run(tableProduct.create
           { t in
                t.column(number, primaryKey: true)
                t.column(product, unique: true)
                t.column(amount)
            })
            
        }
   
        
    }
    
    func ProductInsert(product: String, amount: String) -> Int64
    {
        do
    {
        let insert = tableProduct.insert(self.product <- product, self.amount <- amount)
        return try datab.run(insert)
    }
        catch
    {
        return -1
    }
    }
   
    func ProductList() -> [ListSt]
    {
        var arr:[ListSt] = []
        let products = try! datab.prepare(tableProduct)
        for item in products
        {
            print(item[product]!)
            let us = ListSt(number: item[number], product: item[product]!, amount: item[amount])
            arr.append(us)
        }
        return arr
    }
    
    func userDelete(uid:Int64) -> Int
    {
        
        let alice = tableProduct.filter(number == number)
        return try! datab.run(alice.delete())
    }
}
