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
  
  func testViewModel() {
    let model = Person.init(firstName: "Henry", lastName: "Fan")
    let viewModel = GreetingViewModel.init(person: model)
    viewModel.showGreeting()
    XCTAssert(viewModel.greeting == "Hello! \(model.firstName) \(model.lastName)", "viewModel greeting should be the \"Hello! firstName lastName\"")
  }
  
  func testView() {
    let _ = viewController.view
    let model = Person.init(firstName: "Henry", lastName: "Fan")
    viewController.setupLabels(model)
    XCTAssert(viewController.firstNameLabel.text == model.firstName, "firstNameLabel text should be model's firstName")
    XCTAssert(viewController.lastNameLabel.text == model.lastName, "lastNameLabel text should be model's lastName")
  }
  
  func testPerformanceExample() {
    self.measureBlock {
    }
  }
  
}
