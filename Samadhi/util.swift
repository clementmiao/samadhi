//
//  util.swift
//  Samadhi
//
//  Created by Clement Miao on 3/12/18.
//  Copyright © 2018 Clement Miao. All rights reserved.
//

import Cocoa

extension Bool {
    mutating func toggle() {
        self = !self
    }
}

struct CLI {
    final class StandardErrorTextStream: TextOutputStream {
        func write(_ string: String) {
            FileHandle.standardError.write(string.data(using: .utf8)!)
        }
    }
    
    static let stdout = FileHandle.standardOutput
    static let stderr = FileHandle.standardError
    
    private static var _stderr = StandardErrorTextStream()
    static func printErr<T>(_ item: T) {
        Swift.print(item, to: &_stderr)
    }
    
    static let arguments = Array(CommandLine.arguments.dropFirst(1))
}
