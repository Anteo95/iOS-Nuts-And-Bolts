//
//  Array+SafeGetTests.swift
//  Tests
//
//  Created by Mario Galijot on 21/03/2019.
//  Copyright © 2019 Infinum. All rights reserved.
//

import Quick
import Nimble
@testable import Catalog

class Array_SafeGetTests: QuickSpec {
    
    override func spec() {
        
        describe("testing array extension for save object fetching") {
            
            let arr = [4]
         
            it("should have non-nil object at first index", closure: {
                expect(arr[safe: 0]).toNot(beNil())
            })
            
            it("should have nil object at any index except first index", closure: {
                expect(arr[safe: 1]).to(beNil())
            })
        }
    }
}
