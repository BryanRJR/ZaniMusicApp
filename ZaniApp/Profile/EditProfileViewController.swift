//
//  EditProfileViewController.swift
//  ZaniApp
//
//  Created by MacBook Pro on 10/04/23.
//

import UIKit

class EditProfileViewController: UIViewController {
  @IBOutlet weak var profileImageView: UIImageView!
  var profileImage: UIImage? {
    didSet {
      profileImageView.image = profileImage
    }
  }

  @IBOutlet weak var addressTextField: UIButton!
  @IBOutlet weak var emailTextField: InputTextField!
  @IBOutlet weak var nameTextField: InputTextField!
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    let user = UserDefaults.standard.user

    nameTextField.text = user?.name
    emailTextField.text = user?.email

    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }

  @IBAction func saveButtonTapped(_ sender: Any) {

  }
  
  @IBAction func cameraButtonTapped(_ sender: Any) {
    pickImage()
  }

  func pickImage() {
    let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
      self.showImagePicker(source: .camera)
    }))
    actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
      self.showImagePicker(source: .photoLibrary)
    }))
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default))
    present(actionSheet, animated: true)
  }

  func showImagePicker(source: UIImagePickerController.SourceType) {
    let viewController = UIImagePickerController()
    viewController.sourceType = source
    viewController.delegate = self

    present(viewController, animated: true)
  }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true)
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[.originalImage] as? UIImage
    profileImage = image
    dismiss(animated: true)
  }
}
