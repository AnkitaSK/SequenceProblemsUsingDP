//
//  PalindromicSubsequence.swift
//  SequenceProblemsUsingDP
//
//  Created by Ankita Kalangutkar on 09/04/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation


// 1. Longest Palindromic Subsequence length
/*
 Given string s: agbcba, return the LPS length
 
 Remember, LCS problem is a parent problem to any subsequence problems including this one
 But we need 2 strings.
 
 Suppose, s: agbcba
          s`: abcbga (reverse of s)
 now, find LCS = abcba (which is a palindrome string)

 */

func lps(_ s: String) -> Int {
    return lcsMemoization(s, String(s.reversed()), s.count, s.count)
}

// 2. minimum deletion(count) needed to make a string palindrome
/* LPS gives the longest palindromic subsequence
 therefore, we substract a given string count by LPS count to get min number of deletion count.
 
 **** this is same as no of inertion
 
 */
func minDeletion(_ s: String) -> Int {
    return s.count - lps(s)
}
