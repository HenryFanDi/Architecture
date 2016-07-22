//
//  ArchitectureTests.swift
//  ArchitectureTests
//
//  Created by HenryFan on 17/7/2016.
//  Copyright © 2016 HenryFanDi. All rights reserved.
//

import XCTest
@testable import Architecture

class ArchitectureTests: XCTestCase {
  
  var viewController: MainViewController!
  
  override func setUp() {
    super.setUp()
    viewController = MainViewController()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testExample() {
  }
  
  func testModel() {
    let person = Person.init(firstName: "Henry", lastName: "Fan")
    XCTAssert(person.firstName == "Henry", "Person firstName should be the same")
    XCTAssert(person.lastName == "Fan", "Person lastName should be the same")
  }
  
  func testPerformanceExample() {
    self.measureBlock {
    }
  }
  
}
