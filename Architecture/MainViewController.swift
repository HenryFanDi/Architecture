//
//  MainViewController.swift
//  Architecture
//
//  Created by HenryFan on 18/7/2016.
//  Copyright © 2016 HenryFanDi. All rights reserved.
//

import UIKit

struct Person { // Model
  let firstName: String
  let lastName: String
}

protocol GreetingViewModelProtocol: class {
  var greeting: String? { get }
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set }
  init(person: Person)
  func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
  let person: Person
  var greeting: String? {
    didSet {
      self.greetingDidChange?(self)
    }
  }
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
  required init(person: Person) {
    self.person = person
  }
  func showGreeting() {
    self.greeting = "Hello!" + " " + self.person.firstName + " " + self.person.lastName
  }
}

class MainViewController: UIViewController {
  
  var viewModel: GreetingViewModelProtocol! {
    didSet {
      self.viewModel.greetingDidChange = { viewModel in // Block return from GreetingViewModel
        print(viewModel.greeting)
      }
    }
  }
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let model = Person(firstName: "Henry", lastName: "Fan") // Model
    let viewModel = GreetingViewModel.init(person: model) // ViewModel
    self.viewModel = viewModel // View
    self.viewModel.showGreeting()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
