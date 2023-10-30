//
//  BootCampsTableView.swift
//  TutoriaRepasoMVVM
//
//  Created by Pedro on 30/10/23.
//

import UIKit

class BootCampsTableViewController: UITableViewController {

    //el view Model e inicalizador
    private var viewModel: ViewModelBootCamps
    
    init(viewModel: ViewModelBootCamps = ViewModelBootCamps()) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register the cell with the table view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        //binding con los dtaos de boocamps
        viewModel.modelChange = { [weak self] boots in
            //reaload tableviewController
            print("reload table")
            self?.tableView.reloadData()
        }
        
        //Binding con VM the status .para poner spinners etc etc
        viewModel.modelStatusload = {status in
            switch status {
            case .loading:
                print("Loading")
            case .loaded:
                print("Loaded")
            case .error:
                print("Error")
            case .none:
                print("None")
            }
        }
        
        //llamamos a la carga
        viewModel.loadBoocamps()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataBoots.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "HOLa sdfkjss "+viewModel.dataBoots[indexPath.row].name

        return cell
    }
    

}


#Preview{
//    let vm = ViewModelBootCamps(caseUse: CaseUseBootCampFakeSuccess())
    
    BootCampsTableViewController(viewModel: ViewModelBootCamps(caseUse: CaseUseBootCampFakeSuccess()))
}
