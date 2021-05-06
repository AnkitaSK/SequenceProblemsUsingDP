//
//  PalindromicSubString.swift
//  SequenceProblemsUsingDP
//
//  Created by Ankita Kalangutkar on 05/05/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation


func longestPalindrome(_ s: String) -> String {
    let x = s
    let y = String(s.reversed())
    
    initMatrix()
    // calculate values in matrix
    findLCSubstring(s, y, s.count, y.count)
    
    // as both the strings are derived from a single string
    var i = s.count
    var j = y.count
    var outPutString = ""
    
    print(ans)
    while i > 0 && j > 0 {
        let iIndex = x.index(x.startIndex, offsetBy: i - 1)
        let jIndex = y.index(y.startIndex, offsetBy: j - 1)
        
        if x[iIndex] == y[jIndex] {
            outPutString += String(x[iIndex])
            i -= 1
            j -= 1
        } else if ttt[i - 1][j] > ttt[i][j - 1] {
            i -= 1
        } else {
            j -= 1
        }
    }
    
    return String(outPutString.reversed())
}

// var t[1001][1001]
private let nnn = 15
private let mmm = 15
private var ttt = Array(repeating: Array(repeating: -1, count: mmm + 1), count: nnn + 1)

func initMatrix() {
    for i in 0..<nnn + 1 {
        for j in 0..<mmm + 1 {
            if i == 0 || j == 0 {
                ttt[i][j] = 0
            }
        }
    }
}

var ans = 0
func findLCSubstring(_ x: String, _ y: String, _ n: Int, _ m: Int) {
    // base condition
    if n == 0 || m == 0 {
        ttt[n][m] = 0
        ans = max(ans, ttt[n][m])
    }
    if ttt[n][m] != -1 {
        ans = max(ans, ttt[n][m])
        return
    }
    
    let nIndex = x.index(x.startIndex, offsetBy: n - 1)
    let mIndex = y.index(y.startIndex, offsetBy: m - 1)
    if x[nIndex] == y[mIndex] {
        findLCSubstring(x, y, n - 1, m - 1)
        ttt[n][m] = 1 + ttt[n - 1][m - 1]
        ans = max(ans, ttt[n][m])
    } else {
        ttt[n][m] = 0
        findLCSubstring(x, y, n - 1, m - 1)
        findLCSubstring(x, y, n - 1, m - 1)
        ans = max(ans, ttt[n][m])
    }
}

/*
 // with return value
 func findLCSubstringLength(_ x: String, _ y: String, _ n: Int, _ m: Int) -> Int {
    // base condition
    if n == 0 || m == 0 {
        return 0
    }
    if ttt[n][m] != -1 {
        return ttt[n][m]
    }
    
    let nIndex = x.index(x.startIndex, offsetBy: n - 1)
    let mIndex = y.index(y.startIndex, offsetBy: m - 1)
    if x[nIndex] == y[mIndex] {
         ttt[n][m] = findLCSubstringLength(x, y, n - 1, m - 1) + 1
         return ttt[n][m]
    } else {
        t[n][m] = 0// max(findLCSLength(x, y, n - 1, m), findLCSLength(x, y, n, m - 1))
        findLCSubstringLength(x, y, n, m - 1)
        findLCSubstringLength(x, y, n - 1, m)
        return ttt[n][m]
    }
}
*/
