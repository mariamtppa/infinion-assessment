//
//  DetailsViewController.swift
//  infinion-assessment
//
//  Created by USER on 11/12/2025.
//

import UIKit

final class DetailsViewController: UIViewController {
    private let viewModel: DetailsViewModel
     
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    init?(coder: NSCoder, viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = DetailsViewModel(city: "")
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getWeatherData()
    }
    
    private func makeAlert(errorMessage: String) -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { [weak self] _ in
            guard let self else { return }
            navigationController?.popViewController(animated: true)
        }))
        return alert
    }
}

extension DetailsViewController: DetailsViewModelDelegate {
    func showError(errorMessage: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            navigationController?.present(makeAlert(errorMessage: errorMessage), animated: true)
        }
    }
    
    func updateUI(weatherData: WeatherDataResponse) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            weatherDescriptionLabel.text = weatherData.weather?[0].description?.capitalized ?? ""
            temperatureLabel.text = "\(weatherData.main?.temp ?? 0) K"
        }
    }
}
