import UIKit

let m = 5
let n = 6

let c = [1, 2, 3]
let d = type(of: c)
let e = c


var wrongAnswers = Array(Set([m*n+1, m*n-1, m*n+2, m*n+3, m*n+n, m*n-n, m*n-m, m*n+m].shuffled()))
let f = wrongAnswers

let answerChoices = wrongAnswers.prefix(3)
type(of: answerChoices)

let ans = type(of: wrongAnswers)


