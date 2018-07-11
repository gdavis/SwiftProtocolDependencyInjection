//
//  HasDataStore.swift
//  SwiftProtocolInjection
//
//  Created by Grant Davis on 7/10/18.
//  Copyright © 2018 Grant Davis Interactive, LLC. All rights reserved.
//

import Foundation

protocol HasDataStore {
    var dataStore: DataStoreService { get }
}
