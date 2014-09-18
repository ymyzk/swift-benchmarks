//
//  ViewController.swift
//  SwiftBenchmarks
//
//  Copyright (c) 2014 Yusuke Miyazaki.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func runDowncastBenchmark(sender: AnyObject) {
        var start: NSDate
        var sum: Int = 0
        var error: NSError?
        
        let resourceFilePath = NSBundle.mainBundle().pathForResource("sample", ofType: "json")
        let data = NSData(contentsOfFile: resourceFilePath!)
        
        start = NSDate()
        
        let list1 = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error) as [[String: Int]]
        sum = list1.reduce(0, combine: { $0 + reduce($1.values, 0, +) })
        let result1 = -start.timeIntervalSinceNow
        
        start = NSDate()
        
        let list2 = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error) as [AnyObject]
        sum = list2.reduce(sum, combine: { $0 + reduce(($1 as [String: Int]).values, 0, +) })
        let result2 = -start.timeIntervalSinceNow
        
        let result = String(
            format: "%@: %.3f [sec]\n%@: %.3f [sec]\n%d",
            "AnyObject? -> [[String: Int]]", result1,
            "AnyObject? -> [AnyObject], AnyObject -> [String: Int]", result2, sum)
        println(result)
        UIAlertView(
            title: "Result",
            message: result,
            delegate: nil,
            cancelButtonTitle: "OK").show()
    }
    
    @IBAction func runArrayBenchmark(sender: AnyObject) {
        var start: NSDate
        
        start = NSDate()
        let mutableArray = NSMutableArray()
        for i in 0...1000000 {
            mutableArray.addObject(i)
        }
        let mutableArrayResult = -start.timeIntervalSinceNow
        
        start = NSDate()
        var swiftArray = [Int]()
        for i in 0...1000000 {
            swiftArray.append(i)
        }
        let swiftArrayResult = -start.timeIntervalSinceNow
        
        let result = String(
            format: "%@: %.3f [sec]\n%@: %.3f [sec]",
            "NSMutableArray", mutableArrayResult,
            "Swift Array", swiftArrayResult)
        println(result)
        UIAlertView(
            title: "Result",
            message: result,
            delegate: nil,
            cancelButtonTitle: "OK").show()
    }
    
    @IBAction func runDictionaryBenchmark(sender: AnyObject) {
        var start: NSDate
        
        start = NSDate()
        let mutableDictionary = NSMutableDictionary()
        for i in 0...100000 {
            mutableDictionary[i] = i
        }
        let mutableDictionaryResult = -start.timeIntervalSinceNow
        
        start = NSDate()
        var swiftDictionary = [Int: Int]()
        for i in 0...100000 {
            swiftDictionary[i] = i
        }
        let swiftDictionaryResult = -start.timeIntervalSinceNow
        
        let result = String(
            format: "%@: %.3f [sec]\n%@: %.3f [sec]",
            "NSMutableDictionary", mutableDictionaryResult,
            "Swift Dictionary", swiftDictionaryResult)
        println(result)
        UIAlertView(
            title: "Result",
            message: result,
            delegate: nil,
            cancelButtonTitle: "OK").show()
    }
}