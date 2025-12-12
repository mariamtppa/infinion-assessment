//
//  HomeViewViewController.swift
//  infinion-assessment
//
//  Created by USER on 11/12/2025.
//

import UIKit

final class HomeViewController: UIViewController {

    let viewModel: HomeViewModel
    
    @IBOutlet weak var getDataButton: UIButton!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var saveFavoriteCityButton: UIButton!
    
    @IBAction func getDataButtonAction(_ sender: UIButton) {
        if let city = cityTextField.text, !city.isEmpty {
            navigateToDetailsScreen(city: city)
        } else {
            errorLabel.text = "Field cannot be blank. Please enter the city you want to get weather information of."
            errorLabel.isHidden = false
        }
    }
    
    @IBAction func saveFavouriteCityButtonAction(_ sender: UIButton) {
        guard let favoriteCity = cityTextField.text, !favoriteCity.isEmpty else { return }
        viewModel.saveFavouriteCity(city: favoriteCity)
    }
    
    init?(coder: NSCoder, viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = HomeViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        prepopulateFavouriteCity()
    }
    
    private func prepopulateFavouriteCity() {
        cityTextField.text = viewModel.getFavouriteCity()
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
