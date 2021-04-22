//
//  main.swift
//  SubSequenceProblemsUsingDP
//
//  Created by Ankita Kalangutkar on 08/04/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation


var x = "abcdgh"
var y = "abcdfr"
var n = x.count
var m = y.count
print(lcs(x, y, n, m))
print(lcsMemoization(x, y, n, m))
print(lcsString())

let xx = "abcdgh"
let yy = "abedfh"
var tt = Array(repeating: Array(repeating: -1, count: xx.count + 1), count: yy.count + 1)
var ans = Int.min
lcSubstring(xx, yy, xx.index(before: xx.endIndex), yy.index(before: yy.endIndex), tt: &tt, ans: &ans)
print(ans)
//print(lcSubstring(xx, yy, xx.endIndex, yy.endIndex))


print(lcSubstringUsingDp(xx, yy, xx.count, yy.count))
