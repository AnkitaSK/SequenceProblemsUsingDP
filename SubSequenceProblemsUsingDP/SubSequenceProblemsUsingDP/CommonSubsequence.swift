//
//  CommonSubsequence.swift
//  SubSequenceProblemsUsingDP
//
//  Created by Ankita Kalangutkar on 08/04/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation

// 1. Given 2 strings, find longest common subsequence count
/*
 x: abcdgh   count = n = 6
 y: abcdfhr  count = m = 7
 o/p: abdh ==> 4
 
 identify the problem (is it DP or not)
 1. check if there is choice involved.
    here, start at n - 1 and m - 1 --> are the elements equal? if YES do something else do something else
    so, yes choice are involved ==> recurssion
 2. is there, low, high, small, big to find?
    yes, the longest CS
 
 therefore this is a DP problem
 
 3. In DP we minimise the given inputs. We start traversing from the end of inputs are exclude the last one from
    next calculation
 */


// this is simple recurssion
func lcs(_ x: String, _ y: String, _ n: Int, _ m: Int) -> Int {
    // base condition
    if n == 0 || m == 0 {
        return 0
    }
    // choice diagram
    let _xIndex = x.index(x.startIndex, offsetBy: n - 1)
    let _yIndex = y.index(y.startIndex, offsetBy: m - 1)
    if x[_xIndex] == y[_yIndex] {
        return lcs(x, y, n - 1, m - 1) + 1 // + 1 because one match is found
    } else {
        return max(lcs(x, y, n - 1, m), lcs(x, y, n, m - 1)) // max because longest
    }
}


/* now when there are more than one branches in recurrssion, think about storing values somewhere.
    When we use precalculated values this becomes the problem of DP.
    When we see the choice diagram, it traverses from left subtrees 1st and then goes for the right subtrees.
    Therefore we can use precalculated values in the right subtree.
 
 
 Memoization
 1. here we are going to use a matrix to store values and use when needed. Thus reducing the time complexity significantly.
 */
// t[n + 1][m + 1], initialized with -1
// as n and m are the changing parameters
var t = Array(repeating: Array(repeating: -1, count: m + 1), count: n + 1)

func lcsMemoization(_ x: String, _ y: String, _ n: Int, _ m: Int) -> Int {
    // base condition
    if n == 0 || m == 0 {
        return 0
    }
    
    if t[n][m] != -1 {
        return t[n][m]
    }
    
    // choice diagram
    let _xIndex = x.index(x.startIndex, offsetBy: n - 1)
    let _yIndex = y.index(y.startIndex, offsetBy: m - 1)
    if x[_xIndex] == y[_yIndex] {
        t[n][m] = lcsMemoization(x, y, n - 1, m - 1) + 1 // + 1 because one match is found
        return t[n][m]
    } else {
        t[n][m] = max(lcsMemoization(x, y, n - 1, m), lcsMemoization(x, y, n, m - 1)) // max because longest
        return t[n][m]
    }
}

/*
 Here, we have to traverse in the previously created matrix. Starting from the end of the matrix.
 When someone says return Longest Common Subsequence we have to implement lcsMemoization + lcsString
 */
func lcsString() -> String { // not working -- need to debug again 
    var i = n - 1
    var j = m - 1
    var outPutString = ""
    while i > 0 && j > 0 {
        let iIndex = x.index(x.startIndex, offsetBy: i - 1)
        let jIndex = y.index(y.startIndex, offsetBy: j - 1)
        if x[iIndex] == y[jIndex] {
            outPutString += String(x[iIndex])
            i -= 1
            j -= 1
        } else if t[i - 1][j] > t[i][j - 1] {
            i -= 1
        } else {
            j -= 1
        }
    }

//    print(String(outPutString.reversed()))
    
    return String(outPutString.reversed()) // O(1)
}
