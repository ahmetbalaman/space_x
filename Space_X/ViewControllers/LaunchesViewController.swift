//
//  LaunchesViewController.swift
//  Space_X
//
//  Created by Ahmet Balaman on 14.08.2023.
//

import UIKit
import Kingfisher

// MARK: Protocols
protocol LaunchesViewProtocol {

    func getLaunches(whichOne: String)
}

//some öğren

class LaunchesViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var LaunchesTableView: UITableView!
    @IBOutlet weak var segmentedControlNumber: UISegmentedControl!
    var Launches: [LaunchesModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getLaunches(whichOne: "upcoming")
        initTable()
    }
    @IBAction func segmentsChange(_ sender: Any) {
        Launches = [];
        if(segmentedControlNumber.selectedSegmentIndex == 0) {
            getLaunches(whichOne: "upcoming")
        } else {
            getLaunches(whichOne: "past")
        }
        LaunchesTableView.reloadData()
    }

}

extension LaunchesViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: - Functions
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.bounds.height - 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(Launches.count)
        return Launches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LaunchesTableView.dequeueReusableCell(withIdentifier: LaunchesTableViewCell.identifier, for: indexPath) as! LaunchesTableViewCell;
        makeCell(cell, indexPath.row)
//        cell.layer.borderColor = UIColor.label.cgColor
//        cell.layer.borderWidth = 10
//        cell.layer.cornerRadius = 5
        cell.layer.shadowOffset = CGSize(width: 50, height: 50)
        return cell
    }

}
//MARK: Functions:
extension LaunchesViewController: LaunchesViewProtocol {
    func initTable() {
        LaunchesTableView.register(LaunchesTableViewCell.nib(), forCellReuseIdentifier: LaunchesTableViewCell.identifier)
        LaunchesTableView.dataSource = self
        LaunchesTableView.delegate = self
    }
    func getLaunches(whichOne: String) {
        NetworkManager.shared.LaunchesAPI(whichOne: whichOne) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let launchData):
                guard let launchData else { return }
                launchData.forEach { LaunchesRequestData in

                    self.Launches.append(LaunchesRequestData)
                }
            case .failure(let error):
                print(error)
            }
            LaunchesTableView.reloadData()
        }
    }
    func makeCell(_ cell: LaunchesTableViewCell, _ indexPath: Int) {
        cell.flightNumber.text = String(Launches[indexPath].flightNumber ?? 0)
        cell.launchYear.text = Launches[indexPath].launchYear
        cell.missionPatchImage.kf.setImage(with: URL(string: Launches[indexPath].links?.missionPatchSmall ?? noImage)!)
        cell.missionName.text = Launches[indexPath].missionName
        cell.rocketName.text = Launches[indexPath].rocket?.rocketName;
        cell.rocketType.text = Launches[indexPath].rocket?.rocketType;
        cell.launchDetail.text = Launches[indexPath].details;
        cell.coreSerial.text = Launches[indexPath].rocket?.firstStage?.cores?.first?.coreSerial;
    }
}
