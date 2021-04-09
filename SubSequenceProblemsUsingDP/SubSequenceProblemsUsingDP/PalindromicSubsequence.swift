//
//  PalindromicSubsequence.swift
//  SequenceProblemsUsingDP
//
//  Created by Ankita Kalangutkar on 09/04/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation


// Longest Palindromic Subsequence length
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
