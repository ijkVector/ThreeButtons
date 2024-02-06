//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Иван Дроботов on 04.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    private lazy var firstButton = CustomButton(text: "First Button")
    private lazy var secondButton = CustomButton(text: "Second Medium Button")
    private lazy var thirdButton = CustomButton(text: "Third") { [weak self] in self?.getModelVC() }
    
    private lazy var stack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    private func style() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
    }
    
    private func layout() {
        stack.addArrangedSubview(firstButton)
        stack.addArrangedSubview(secondButton)
        stack.addArrangedSubview(thirdButton)
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
    private func getModelVC() {
        let VC  = UIViewController()
        VC.view.backgroundColor = .systemBackground
        present(VC, animated: true)
    }
}
