//
//  RepeatingSubsequence.swift
//  SequenceProblemsUsingDP
//
//  Created by Ankita Kalangutkar on 09/04/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation

// 1. Longest repeating subsequence length
/*
 Given str = AABEBCDD o\p = 3
 LRS string = AABBDD => ABD
    EC are not repeating
 
 check if we can apply varient of LCS
 for this, we need 2 strings
 suppose, s1 = AABEBCDD
          s2 = AABEBCDD
        now, LCS = AABEBCDD, all are common :D
 E and C are at the same indices in the 2 strings, and we do not want these 2 letters.
 Therefore if we put condition to ignore such strings then? like if i == j, ignore letters, then we get
 one set of repeating letters i. e ABD
 */
var mR: Int = 0
var nR: Int = 0
func lrs(_ s: String) -> Int {
    mR = s.count
    nR = s.count
    return _lrsMemoization(s, s, s.count, s.count)
}

var tR = Array(repeating: Array(repeating: -1, count: mR + 1), count: nR + 1)
func _lrsMemoization(_ s1: String, _ s2: String, _ s1Count: Int, _ s2Count: Int) -> Int {
    if s1Count == 0 || s2Count == 0 {
        return 0
    }
    if tR[nR][mR] != -1 {
        return tR[nR][mR]
    }
    
    let _s1Index = s1.index(s1.startIndex, offsetBy: s1Count - 1)
    let _s2Index = s2.index(s2.startIndex, offsetBy: s2Count - 1)
    if s1[_s1Index] == s2[_s2Index] && s1Count != s2Count { // for lrs
        tR[nR][mR] = _lrsMemoization(s1, s2, s1Count - 1, s2Count - 1) + 1
        return tR[nR][mR]
    } else {
        tR[nR][mR] = max(_lrsMemoization(s1, s2, s1Count - 1, s2Count), _lrsMemoization(s1, s2, s1Count, s2Count - 1))
        return tR[nR][mR]
    }
    
}
