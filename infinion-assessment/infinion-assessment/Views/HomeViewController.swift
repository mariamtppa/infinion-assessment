//
//  HomeViewViewController.swift
//  infinion-assessment
//
//  Created by USER on 11/12/2025.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var getDataButton: UIButton!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func getDataButtonAction(_ sender: UIButton) {
        if let city = cityTextField.text, !city.isEmpty {
            navigateToDetailsScreen(city: city)
        } else {
            errorLabel.text = "Field cannot be blank. Please enter the city you want to get weather information of."
            errorLabel.isHidden = false
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("init home view controller ????????")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }
    
    private func navigateToDetailsScreen(city: String) {
        let storyBoard: UIStoryboard =  UIStoryboard(name: "DetailsViewController", bundle: nil)
        let viewModel = DetailsViewModel(city: city)
        let viewController = storyBoard.instantiateViewController(identifier: "DetailsView", creator: { coder in
            return DetailsViewController(coder: coder, viewModel: viewModel)
        })
        viewModel.detailsViewModelDelegate = viewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
