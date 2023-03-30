//
//  KeycapStyle.swift
//  eye-chat
//
//  Created by Guilherme Souza on 30/03/23.
//

import Foundation

enum KeycapStyle: String, CaseIterable, Hashable {
    case aeiou = "A, E, I, O, U"
    case srndm = "S, R, N, D, M"
    case tclpv = "T, C, L, P, V"
    case ghqbf = "G, H, Q, B, F"
    case zjxkw = "Z, J, X, K, W"
    case others = "., , , ?, !, Y"
}
