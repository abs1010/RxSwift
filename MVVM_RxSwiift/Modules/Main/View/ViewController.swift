//
//  ViewController.swift
//  MVVM_RxSwiift
//
//  Created by Alan Silva on 03/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let _disposeBag = DisposeBag()
    private var viewModel: RestaurantListViewModel!
    
    static func instantiate(viewModel: RestaurantListViewModel) -> UIViewController {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        
        viewModel.fetchRestaurantViewModels().observeOn(MainScheduler.instance) .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.nameExt
            cell.detailTextLabel?.text = viewModel.categoryCuisine
        }.disposed(by: _disposeBag)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

