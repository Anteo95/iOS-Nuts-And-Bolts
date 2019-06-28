//
//  RequestAdapterTests.swift
//
//  Created by Filip Gulan on 24/04/2019.
//  Copyright © 2019 Infinum. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Alamofire
@testable import Catalog

class RequestAdapterTests: QuickSpec {

    override func spec() {

        describe("token-based request adapter") {

            it("should append Authorization header with token") {
                let token = "1234567889"
                let adapter = TokenAdapter(token: token)
                let request = try! URLRequest(url: "www.api.com", method: .get)

                let adaptedRequest = try! adapter.adapt(request)
                let authHeader = adaptedRequest.allHTTPHeaderFields?["Authorization"]
                expect(authHeader).to(equal(token))
            }

        }

        describe("Basic auth request adapter") {

            it("should append Authorization header with token") {
                let adapter = BasicAuthAdapter(username: "infinum", password: "catalog")
                let request = try! URLRequest(url: "www.api.com", method: .get)

                let adaptedRequest = try! adapter.adapt(request)
                let authHeader = adaptedRequest.allHTTPHeaderFields?["Authorization"]
                expect(authHeader).to(equal("Basic aW5maW51bTpjYXRhbG9n"))
            }

        }

    }

}
