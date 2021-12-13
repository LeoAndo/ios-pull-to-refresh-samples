//
//  Todo.swift
//  Sample01
//
//  Created by LeoAndo on 2021/12/14.
//

import Foundation

struct Todo: Identifiable, Decodable {
    var id: Int
    var title: String
    var completed: Bool
}
