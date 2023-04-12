//
//  ProfileViewController.swift
//  ZaniApp
//
//  Created by MacBook Pro on 07/04/23.
//

import UIKit

class ProfileViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  weak var playlistCollectionView: UICollectionView?

  @IBOutlet weak var labelName: UILabel!
  @IBOutlet weak var imageView: UIImageView!

  var profileImage: UIImage? {
    didSet {
      imageView.image = profileImage
    }
  }

  enum Section {
    case playlist
  }

  var sections: [Section] = [.playlist]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      setup()

      let user = UserDefaults.standard.user
      labelName.text = "Hi \(user?.name ?? "")"

    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // navigationController?.setNavigationBarHidden(true, animated: true)
  }

  func setup() {
    tableView.dataSource = self
    //tableView.delegate = self
  }

  @IBAction func signOutButtonTapped(_ sender: Any) {
    UserDefaults.standard.deleteToken()
    UserDefaults.standard.deleteUser()
    goToAuth()
  }

}

extension ProfileViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let value = sections[section]
    switch value {
    case .playlist:
      return 4
    }

  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let value = sections[indexPath.section]
    switch value {
    case .playlist:
      return tableView.dequeueReusableCell(withIdentifier: "playlist_table", for: indexPath)

    }
  }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true)
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[.originalImage] as? UIImage
    profileImage = image
    dismiss(animated: true)
  }
}


