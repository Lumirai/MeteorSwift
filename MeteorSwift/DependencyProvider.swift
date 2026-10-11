//
//  DependencyProvider.swift
//  LiveScores
//
//  Created by Stephen Orr on 2018-06-24.
//  Copyright © 2018 Stephen Orr. All rights reserved.
//

import Foundation
import SocketRocket

struct DependencyProvider                                                   {
    static func provideSRWebSocket(withRequest: URLRequest) -> SRWebSocket  {
        return SRWebSocket(urlRequest: withRequest)
    }
}

struct DDPIdGenerator                          {
    static var methodCallCount = 0
    
    static var nextId:String                    {
        get {
            methodCallCount += 1
            return String(methodCallCount)
        }
    }
}


// Shadows Swift.print for the whole module so console logging only happens in
// debug builds. Release builds must never write DDP messages or documents to
// the device console.
func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    Swift.print(items.map { "\($0)" }.joined(separator: separator), terminator: terminator)
    #endif
}
