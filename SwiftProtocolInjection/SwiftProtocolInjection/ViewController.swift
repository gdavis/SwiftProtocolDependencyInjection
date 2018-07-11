//
//  ViewController.swift
//  SwiftProtocolInjection
//
//  Created by Grant Davis on 7/10/18.
//  Copyright © 2018 Grant Davis Interactive, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HasDataStore, AlertPresenter {

    var dataStore: UITextView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let data = dataStore.fetchData()
        showAlert(for: data)
    }
}
