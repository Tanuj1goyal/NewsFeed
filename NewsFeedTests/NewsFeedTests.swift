//
//  NewsFeedTests.swift
//  NewsFeedTests
//
//  Created by Tanuj on 18/02/21.
//

import XCTest
@testable import NewsFeed

/*
 
 This class has Test cases.
 Application has only one main feature - Get the response from the network and Test the same

 */

class NewsFeedTests: XCTestCase, Requestable {
    
    /* Test if we are getting any response from the server */
    func testRequestResponse() {
        // Request url
        let url = Domain.baseUrl + APIEndpoint.period(period: .seven)
        var response: Data?
        var errorResponse: String?
        let expectation = self.expectation(description: "GET request should succeed: \(url)")
        
        // Make request
        request(method: .get, url: Domain.baseUrl + APIEndpoint.period(period: .seven)) { (result) in
            switch result {
            case .success(let data):
                response = data
            case .failure(let error):
                errorResponse = error
            }
            expectation.fulfill()
        }
        // Wait for response
        waitForExpectations(timeout: 60)
        
        // Check for test to pass/fail
        XCTAssertNotNil(response)
        XCTAssertNil(errorResponse)
    }
}
