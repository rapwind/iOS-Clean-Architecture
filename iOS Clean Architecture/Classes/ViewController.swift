//
//  ViewController.swift
//  iOS Clean Architecture
//
//  Created by hayamin on 11/25/16.
//  Copyright © 2016 in.hayam. All rights reserved.
//

import UIKit

// MARK: SampleViewControllerInput
protocol SampleViewControllerInput: class {
    func setViewModel(_: SampleViewModel) -> Void
    func changedStatus(_: SampleStatus) -> Void
    func onError(_: Error) -> Void
}

class ViewController: UIViewController, SampleViewControllerInput {

    var presenter = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.input = self
        self.presenter.load(id: "hoge")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: SampleViewControllerInput
    internal func setViewModel(_ viewModel: SampleViewModel) {
        print("\(viewModel)")
    }
    
    internal func changedStatus(_ status: SampleStatus) -> Void {
        switch status {
        case .loading:
            print("loading...")
            break
        case .error:
            print("error")
        case .timeout:
            print("oops! request timeout ;(")
        default:
            break
        }
    }

    internal func onError(_ error: Error) {
        print("error: \(error)")
    }
    
}

