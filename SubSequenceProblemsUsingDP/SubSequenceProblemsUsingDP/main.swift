//
//  main.swift
//  SubSequenceProblemsUsingDP
//
//  Created by Ankita Kalangutkar on 08/04/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation


var x = "abcdgh"
var y = "abcdfhr"
var n = x.count
var m = y.count
print("Given 2 strings, find longest common subsequence count")
print("x: \(x) y: \(y)")
print(lcs(x, y, n, m))
print(lcsMemoization(x, y, n, m))

print("Given 2 strings, find longest common subsequence string")
print(lcsString())

print("Longest Palindromic Subsequence length")
print(lps("agbcba"))
print("minimum deletion(count) needed to make a string palindrom")
print(minDeletion("agbcba"))

print("Longest repeating subsequence length")
print(lrs("AABEBCDD")) // produces wrong answer


print(longestPalindrome("aacabdkacaa"))

// aacabdkacaa
// aacakdbacaa
