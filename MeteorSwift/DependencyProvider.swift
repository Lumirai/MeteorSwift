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
        
        var request = withRequest
        
        request.setValue("LumiraiViewer+/1.0 (iOS; iPad)", forHTTPHeaderField: "User-Agent")
        return SRWebSocket(urlRequest: request)
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

