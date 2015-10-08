//: Playground - noun: a place where people can play

import UIKit

let string = "Metro Atom Plaza Lt.2 Blok BKS no.38-39, Jl. K.H. Samanhudi, Pasar Baru, DKI Jakarta 10710"
let newString = string.stringByReplacingOccurrencesOfString(",", withString: "\n")
newString