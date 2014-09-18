//
//  ViewController.swift
//  SwiftBenchmarks
//
//  Copyright (c) 2014 Yusuke Miyazaki.
//

import UIKit

class ViewController: UIViewController {
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