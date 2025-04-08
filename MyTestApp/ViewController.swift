
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(100)
            $0.top.equalToSuperview().inset(200)
        }
        
        
        func createButton(title: String) -> UIButton {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.layer.cornerRadius = 40
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            
            return button
        }
        
        //        @objc buttonTapped(_ sender: UIButton) {
        //            guard let title = sender.currentTitle else { return }
        //            print("clickedButton: \(title) ")
        //        }
        
        // 7, 8, 9, +
        let button7 = createButton(title: "7")
        let button8 = createButton(title: "8")
        let button9 = createButton(title: "9")
        let buttonPlus = createButton(title: "+")
        buttonPlus.backgroundColor = .orange
        
        let buttonStackView = makeHorizontalStackview([button7, button8, button9, buttonPlus])
        view.addSubview(buttonStackView)
        
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(80)
            $0.top.equalTo(label.snp.bottom).offset(20) //레이블 아래로
        }
        
        
        // 4, 5, 6, -
        let button4 = createButton(title: "4")
        let button5 = createButton(title: "5")
        let button6 = createButton(title: "6")
        let buttonMinus = createButton(title: "-")
        buttonMinus.backgroundColor = .orange
        
        let buttonStackView2 = makeHorizontalStackview([button4, button5, button6, buttonMinus])
        view.addSubview(buttonStackView2)
        buttonStackView2.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(80)
            $0.top.equalTo(buttonStackView.snp.bottom).offset(20) // buttonStackView 아래로
        }
        
        // 1, 2, 3,*
        let button1 = createButton(title: "1")
        let button2 = createButton(title: "2")
        let button3 = createButton(title: "3")
        let buttonMultiply = createButton(title: "*")
        buttonMultiply.backgroundColor = .orange
        let buttonStackView3 = makeHorizontalStackview([button1, button2, button3, buttonMultiply])
        view.addSubview(buttonStackView3)
        buttonStackView3.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(80)
            $0.top.equalTo(buttonStackView2.snp.bottom).offset(20) // buttonStackView2 아래로
        }
        
        // AC, 0, Equal, Divide
        let buttonAC = createButton(title: "AC")
        let button0 = createButton(title: "0")
        let buttonEqual = createButton(title: "=")
        let buttonDivide = createButton(title: "/")
        buttonAC.backgroundColor = .orange
        
        buttonEqual.backgroundColor = .orange
        buttonDivide.backgroundColor = .orange
        let buttonStackView4 = makeHorizontalStackview([buttonAC, button0, buttonEqual, buttonDivide])
        view.addSubview(buttonStackView4)
        buttonStackView4.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(80)
            $0.top.equalTo(buttonStackView3.snp.bottom).offset(20) // buttonStackView3 아래로
        }
        
        func makeHorizontalStackview(_ views: [UIView]) -> UIStackView {
            let stackview = UIStackView(arrangedSubviews: views)
            stackview.axis = .horizontal
            stackview.spacing = 10
            stackview.distribution = .fillEqually
            return stackview
        }
        
        func makeVerticalStackView(_ views: [UIView]) -> UIStackView {
            let verticalStackVIew =  UIStackView(arrangedSubviews: views)
            verticalStackVIew.axis = .vertical
            verticalStackVIew.backgroundColor = .black
            verticalStackVIew.spacing = 10
            verticalStackVIew.distribution = .fillEqually
            
            return verticalStackVIew
        }
    }
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    @objc func buttonTapped(_ sender: UIButton) {
       /* guard*/ let title = sender.currentTitle ?? ""
        
        if title == "AC" {
            label.text = "0"
            return
        }
        
        if title == "=" {
            let expression = label.text ?? ""
            if let result = calculate(expression: expression) {
                label.text = "\(result)"
            }
            return
        }
        
        if label.text == "0" {
            label.text = title
        } else {
            label.text?.append(title)
        }
        
    }
    
}
