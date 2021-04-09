//
//  CommonSupersequence.swift
//  SubSequenceProblemsUsingDP
//
//  Created by Ankita Kalangutkar on 08/04/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation

// Shortest Common Supersequence length
/* Given 2 strings find a supersequence which is shortest.
 Suppose,
 m: geek
 n: eke
 possible o/p: geekeke, geeke
 'geeke' is SCS ===> 5
 
 Now, LCS = ek
 
 Suppose we do, m.count + n.count - lcs.count = answer
 
 print the SCS
 1. traverse throught the LCS matrix
 2. save common appearing character once, same not common characters too.
 3. also, when one of the string is over, traverse over the unfinished string and save characters.
 4. Finally, reverse the saved string and return.
 */
