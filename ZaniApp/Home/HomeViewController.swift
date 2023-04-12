//
//  HomeViewController.swift
//  ZaniApp
//
//  Created by MacBook Pro on 04/04/23.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
 

  @IBOutlet weak var tableView: UITableView!

  @IBOutlet weak var nameLabelHome: UILabel!
  var musicOne: [Tracks] = []
  var musicTwo: [Tracks] = []
  var musicThree: [Tracks] = []

  weak var musicOneCollectionView: UICollectionView?
  weak var musicTwoCollectionView: UICollectionView?
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    setup()
    loadData()
    loadRecentPodcasts()

    let user = UserDefaults.standard.user
    nameLabelHome.text = "Hi \(user?.name ?? "")"
  }

  func setup() {
    tableView.dataSource = self
    tableView.delegate = self
  }


  func handleGetYoasobi(_ musicOne: [Tracks]) {
    self.musicOne = musicOne
    self.tableView.reloadData()
  }

  func handleGetRadwimps(_ musicTwo: [Tracks]) {
    self.musicTwo = musicTwo
    self.tableView.reloadData()
  }

  func handleGetGhibli(_ musicThree: [Tracks]) {
    self.musicThree = musicThree
    self.tableView.reloadData()
  }

  func loadData() {
    ApiService.shared.loadYoasobiSong(completion: handleGetYoasobi)
    ApiService.shared.loadRadwimpsSong(completion: handleGetRadwimps(_:))
    ApiService.shared.loadGhibliSong(completion: handleGetGhibli(_:))
  }

  func loadRecentPodcasts() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.viewContext

    //musicThree = ApiService.shared.loadGhibliSong(completion: handleGetGhibli(_:))
  }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "music_one", for: indexPath) as! MusicOneTableViewCell

      cell.musicOneCollectionView.dataSource = self
        cell.musicOneCollectionView.delegate = self
        cell.musicOneCollectionView.reloadData()
      self.musicOneCollectionView = cell.musicOneCollectionView

        let screenWidth = UIScreen.main.bounds.width
        let colounm: CGFloat = 4
        let totalMargin: CGFloat = 16 * 2
        let totalSpacing: CGFloat = 12 * (colounm - 1)
        let line: CGFloat  = 2
        let width = floor((screenWidth - totalMargin - totalSpacing) / colounm)
        let height = (line * (width + 0)) + ((line - 1) * 12) + (2 * 16)

        cell.heightConstraint.constant = CGFloat(height)
        cell.layoutIfNeeded()

        return cell

    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "music_two", for: indexPath) as! MusicTwoTableViewCell

    cell.musicTwoCollectionView.dataSource = self
      cell.musicTwoCollectionView.delegate = self
      cell.musicTwoCollectionView.reloadData()
      self.musicTwoCollectionView = cell.musicTwoCollectionView

      let screenWidth = UIScreen.main.bounds.width
      let colounm: CGFloat = 4
      let totalMargin: CGFloat = 16 * 2
      let totalSpacing: CGFloat = 12 * (colounm - 1)
      let line: CGFloat  = 2
      let width = floor((screenWidth - totalMargin - totalSpacing) / colounm)
      let height = (line * (width + 0)) + ((line - 1) * 12) + (2 * 16)

      cell.heightConstraint.constant = CGFloat(height)
      cell.layoutIfNeeded()

      return cell

    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "music_three", for: indexPath) as! MusicThreeTableViewCell

      let ghibli: Tracks = musicThree[indexPath.row]

      cell.imageSongView.kf.setImage(with: URL(string: ghibli.artworkUrl100 ?? ""))
      cell.titleLabel.text = ghibli.trackName
      cell.subtitleLabel.text = ghibli.artistName

      return cell
    }
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
        return 1
    case 1:
        return 1
    default:
      return musicThree.count
    }
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
        return "Yoasobi Song"
    case 1:
      return "Radwimps"
    default:
        return "Recent Song"
    }
  }


}


extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == self.musicOneCollectionView {
      return musicOne.count
    } else {
      return musicTwo.count
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == self.musicOneCollectionView {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "music_one_view_cell", for: indexPath) as! YoasobiCollectionViewCell

      let yoasobi = musicOne[indexPath.item]
      cell.imageView.kf.setImage(with: URL(string: yoasobi.artworkUrl100 ?? "" ))

      cell.titleLabel.text = yoasobi.collectionName
      cell.subtitleLabel.text = yoasobi.artistName

      return cell
    } else {

      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "music_two_view_cell", for: indexPath) as! MusicTwoCollectionViewCell

      let radwimps = musicTwo[indexPath.item]
      cell.imageView.kf.setImage(with: URL(string: radwimps.artworkUrl100 ?? "" ))

      cell.titleLabel.text = radwimps.collectionName
      cell.subtitleLabel.text = radwimps.artistName

      return cell
    }

  }

}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard indexPath.section == 1 else {
        tableView.deselectRow(at: indexPath, animated: true)
        return
    }


    let ghibli = self.musicThree[indexPath.row]
    let alert = UIAlertController(title: "Row Selected", message: "\(ghibli.trackName) is selected", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Oke", style: UIAlertAction.Style.default, handler: { (alertAction) in

        print("\(ghibli.trackName) is selected")
        tableView.deselectRow(at: indexPath, animated: true)
    }))
    present(alert, animated: true)
  }

}


extension HomeViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if collectionView == self.musicOneCollectionView {
      let yoasobi = musicOne[indexPath.item]
    } else {
      let radwimps = musicTwo[indexPath.item] 
    }
  }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 12
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 12
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let screenWidth = UIScreen.main.bounds.width
    let colounm: CGFloat = 3
    let totalMargin: CGFloat = 16 * 2
    let totalSpacing: CGFloat = 12 * (colounm - 1)
    let width = floor((screenWidth - totalMargin - totalSpacing) / colounm)
    let height = (width + 0)

    return CGSize(width: width, height: height)
  }
}
