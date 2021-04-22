//
//  LargestCommonSubstring.swift
//  SequenceProblemsUsingDP
//
//  Created by Ankita on 21.04.21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation

// using dp - memoization

// works only when the condition is met 1st time, if any time else is hit the recurssion ends. This can not be achieved with recurssion
func lcSubstring(_ x: String, _ y: String, _ n: String.Index, _ m: String.Index) -> Int {
    // base condition
    // (smallest valid input)
    if n == x.startIndex || m == y.startIndex {
        return 0
    }
    
    // choice diagram, reducing the number of steps
//    if x[x.index(before: n)] == y[y.index(before: m)]{
    if x[xx.index(before: n)] == y[yy.index(before: m)]{
        print(x[xx.index(before: n)])
        return lcSubstring(x, y, x.index(before: n), y.index(before: m)) + 1
        
    } else {
        return 0
    }
}

// top down approach -> O(n2) if m == n
func lcSubstringUsingDp(_ x: String, _ y: String, _ n: Int, _ m: Int) -> Int {
   var maxLength = Int.min
    var outPutString = ""
    var t = Array(repeating: Array(repeating: -1, count: n + 1), count: m + 1) // tnxm matrix
    
    // initialize using top-down
   for i in 0..<n + 1 {
       for j in 0..<m + 1 {
           if i == 0 || j == 0 {
             t[i][j] = 0
           }
       }
   }
   
   // choice diagram code
   for i in 1..<n + 1 {
       for j in 1..<m + 1 {
           let iIndex = x.index(x.startIndex, offsetBy: i - 1)
           let jIndex = y.index(y.startIndex, offsetBy: j - 1)
           if x[iIndex] == y[jIndex] {
               t[i][j] = 1 + t[i - 1][j - 1]
           } else {
               t[i][j] = 0
           }
       }
   }
   
   // find length and substring of max substring
   //
   for i in 1..<n + 1 {
       for j in 1..<m + 1 {
        if t[i][j] != 0 {
            if maxLength < t[i][j] {
                maxLength = t[i][j]
                // either string
                let iIndex = y.index(y.startIndex, offsetBy: j - 1) // because n starts from x.count
                outPutString += String(y[iIndex])
//                // either string
//                let iIndex = x.index(x.startIndex, offsetBy: i - 1) // because n starts from x.count
//                outPutString += String(x[iIndex])
            }
        }
       }
   }
   print(outPutString)
   return maxLength
}

