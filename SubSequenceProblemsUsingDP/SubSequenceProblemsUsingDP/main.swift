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
print(lcs(x, y, n, m))
print(lcsMemoization(x, y, n, m))
print(lcsString())
