//
//  HomeViewController.swift
//  CodeBaseUI
//
//  Created by Elena on 2022/01/21.
//

import Foundation
import UIKit

class HomeViewController : UIViewController {
    
    private var titleLabel: UILabel = UILabel()
    private var testTextField: UITextField = UITextField()
    private var testButton: UIButton = UIButton()
    private var indigoView: UIScrollView = UIScrollView()
    private var indigoViewTextLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    private func setupLayout() {
        
        // constraint를 추가하기 전에 SubView에 추가
        view.addSubview(titleLabel)
        view.addSubview(testTextField)
        view.addSubview(testButton)
        view.addSubview(indigoView)
        
        // translatesAutoresizingMaskIntoConstraints 를 false로 돌리기
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        testTextField.translatesAutoresizingMaskIntoConstraints = false
        testButton.translatesAutoresizingMaskIntoConstraints = false
        indigoView.translatesAutoresizingMaskIntoConstraints = false
        
        // 제약조건
        titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        // titleLabel 디자인 요소 추가
        titleLabel.backgroundColor = .systemIndigo
        titleLabel.text = "Title Label!"
        titleLabel.font = .systemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        
        
        // testTextField
        testTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        testTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        testTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        testTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        testTextField.placeholder = "testTextField.placeholder"
        
        // testButton
        testButton.setTitle("Test Button", for: .normal)
        testButton.setTitleColor(.white, for: .normal)
        testButton.backgroundColor = .systemBlue
        testButton.layer.cornerRadius = 10
      
        // 제약조건 배열로 추가하기
        let testButtonConstraints = [
                                        testButton.topAnchor.constraint(equalTo: testTextField.bottomAnchor, constant: 16),
                                        testButton.leadingAnchor.constraint(equalTo: testTextField.leadingAnchor),
                                        testButton.trailingAnchor.constraint(equalTo: testTextField.trailingAnchor),
                                        testButton.heightAnchor.constraint(equalToConstant: 44)
                                    ]
        
        NSLayoutConstraint.activate(testButtonConstraints)

        
        indigoView.backgroundColor = .black

        let indigoViewConstrainrs = [
                                        indigoView.topAnchor.constraint(equalTo: testButton.bottomAnchor, constant: 10),
                                        indigoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                                        indigoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                                        indigoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                                    ]
        
        NSLayoutConstraint.activate(indigoViewConstrainrs)
        
        indigoView.addSubview(indigoViewTextLabel)
        
        indigoViewTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let innerTextConstraints = [
                                        indigoViewTextLabel.topAnchor.constraint(equalTo: indigoView.topAnchor, constant: 30),
                                        indigoViewTextLabel.leadingAnchor.constraint(equalTo: indigoView.leadingAnchor, constant: 30),
                                        indigoViewTextLabel.trailingAnchor.constraint(equalTo: indigoView.trailingAnchor, constant: -30),
//                                        indigoViewTextLabel.heightAnchor.constraint(equalToConstant: 30)
                                        indigoViewTextLabel.bottomAnchor.constraint(equalTo: indigoView.bottomAnchor, constant: -10),
                                        indigoViewTextLabel.centerXAnchor.constraint(equalTo: indigoView.centerXAnchor)
                                    ]
        
        NSLayoutConstraint.activate(innerTextConstraints)
        
        indigoViewTextLabel.text = "this is Text!"
        indigoViewTextLabel.textColor = .white
        indigoViewTextLabel.backgroundColor = .red
        indigoViewTextLabel.font = .systemFont(ofSize: 28)
        
    }
    
}

// MARK: Canvas 설정
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context){
        
    }
    // makeui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        HomeViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View{
        ViewControllerRepresentable()
    }
}
#endif
