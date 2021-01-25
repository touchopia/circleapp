//
//  ViewController.swift
//  CircleApp
//
//  Created by Phil Wright on 1/25/21.
//

import UIKit

class ViewController: UIViewController {

    let shape = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        let label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.text = "Calorie Goal"
            label.font = .systemFont(ofSize: 36, weight: .light)
            return label
        }()

        let circlPath = UIBezierPath(arcCenter: view.center,
                                     radius: 150,
                                     startAngle: -(.pi / 2),
                                    endAngle: .pi * 2,
                                    clockwise: true)

        let trackPath = CAShapeLayer()
        trackPath.path = circlPath.cgPath
        trackPath.lineWidth = 15
        trackPath.fillColor = UIColor.clear.cgColor
        trackPath.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackPath)

        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center

        shape.path = circlPath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)

        let button = UIButton(frame: CGRect(x: 20,
                                            y: view.frame.size.height - 70,
                                            width: view.frame.size.width - 40,
                                            height: 50))
        view.addSubview(button)

        button.setTitle("Animate", for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

    }

    @objc func didTapButton() {
        // Animate
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey:"animation")

    }


}

