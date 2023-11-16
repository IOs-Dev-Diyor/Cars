//
//  ViewController.swift
//  Cars
//
//  Created by Diyorbek Xikmatullayev on 10/11/23.
//


import UIKit
import KDCircularProgress
import SnapKit

class QuizViewController: BaseViewController {
    
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)
    
    var timer: Timer = Timer()
    var count: Int = 0
    var timeCounting: Bool = false
    
    var carArr = [Car]()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.cornerRadius = 120
        return imageView
    }()

    let optionButtons: [UIButton] = {
        var buttons: [UIButton] = []
        for _ in 0..<3 {
            let button = UIButton()
            button.backgroundColor = .Rang.zodiaclight
            button.titleLabel?.numberOfLines = 0
            button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: 20)
            button.titleLabel?.adjustsFontSizeToFitWidth = true

            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.red.cgColor
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.layer.masksToBounds = true
            buttons.append(button)
        }
        return buttons
    }()

    let progressView: KDCircularProgress = {
        let progressView = KDCircularProgress()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressColors = [.green, .yellow, .orange, .red]
        progressView.trackColor = .magenta
        progressView.progressThickness = 0.3
        return progressView
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.textAlignment = .center
        label.font = UIFont(name: "Rockwell-BoldItalic", size: 16)
        label.layer.masksToBounds = true
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.textAlignment = .center
        label.font = UIFont(name: "Rockwell-BoldItalic", size: 16)
        label.layer.masksToBounds = true
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        return label
    }()

    let playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(UIImage(named: "play"), for: .normal)
        return button
    }()
    
    let restartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "restart"), for: .normal)
        return button
    }()
    
    
    var questions: [(image: UIImage, correctAnswer: String, options: [String])] = [
        (UIImage(named: "Mercedes-Benz 300 SL") ?? UIImage(), "Mercedes-Benz 300 SL", ["Mercedes-Benz 300 SL", "Porsche Cayenne", "Pontiac Sunfire"]),
        (UIImage(named: "Audi A2") ?? UIImage(), "Audi A2", ["Mercedes-Benz 300 S", "Audi A2", "Jaguar X-Type"]),
        (UIImage(named: "Vauxhall Chevette") ?? UIImage(), "Vauxhall Chevette", ["Jaguar X-Type", "Ford Five Hundred", "Vauxhall Chevette"]),
        (UIImage(named: "Audi 80") ?? UIImage(), "Audi 80", ["Audi 80", "Oldsmobile Toronado", "Pontiac Solstice"]),
        (UIImage(named: "Plymouth Superbird") ?? UIImage(), "Plymouth Superbird", ["Mercedes-Benz 300 S", "Plymouth Superbird", "Audi A2"]),
        (UIImage(named: "Toyota Avensis") ?? UIImage(), "Toyota Avensis", ["Chrysler Cirrus", "Pontiac Sunfire", "Toyota Avensis"]),
        (UIImage(named: "Oldsmobile Toronado") ?? UIImage(), "Oldsmobile Toronado", ["Oldsmobile Toronado", "Saab 9000", "Pontiac Solstice"]),
        (UIImage(named: "Mazda MX-5") ?? UIImage(), "Mazda MX-5", ["Mazda MX-5", "Oldsmobile Toronado", "Ford Five Hundred"]),
        (UIImage(named: "Porsche Cayenne") ?? UIImage(), "Porsche Cayenne", ["Porsche Cayenne", "Audi A2", "Toyota Avensis"]),
        (UIImage(named: "Saab 9000") ?? UIImage(), "Saab 9000", ["Mercedes-Benz 300 S", "Plymouth Superbird", "Saab 9000"]),
        (UIImage(named: "Pontiac Sunfire") ?? UIImage(), "Pontiac Sunfire", ["Chrysler Cirrus", "Pontiac Sunfire", "Oldsmobile Toronado"]),
        (UIImage(named: "Jaguar X-Type") ?? UIImage(), "Jaguar X-Type", ["Mercedes-Benz 300 S", "Mazda MX-5", "Jaguar X-Type"]),
        (UIImage(named: "Pontiac G6") ?? UIImage(), "Pontiac G6", ["Mercedes-Benz 300 S", "Pontiac G6", "Audi 80"]),
        (UIImage(named: "Ford Five Hundred") ?? UIImage(), "Ford Five Hundred", ["Ford Five Hundred", "Audi A2", "Mazda MX-5"]),
        (UIImage(named: "Pontiac Solstice") ?? UIImage(), "Pontiac Solstice", ["Pontiac Solstice", "Plymouth Superbird", "Saab 9000"]),
        (UIImage(named: "TVR Tuscan Speed Six") ?? UIImage(), "TVR Tuscan Speed Six", ["TVR Tuscan Speed Six", "Audi 80", "Plymouth Superbird"]),
    ]

    var currentQuestionIndex = 0
    var correctAnswer = 0
    var progressValue: CGFloat {
       
        return CGFloat(currentQuestionIndex + 1) / CGFloat(questions.count)
    }
    
    override func initSubViews() {
        view.backgroundColor = .white
        playButton.addTarget(self, action: #selector(startStopTapped), for: .touchUpInside)
        restartButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
       
        scoreLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.8) //

           scoreLabel.layer.shadowColor = UIColor.black.cgColor
           scoreLabel.layer.shadowOffset
       = CGSize(width: 0, height: 2)
           scoreLabel.layer.shadowOpacity = 0.5
           scoreLabel.layer.shadowRadius = 9

        
    
        setupUI()
        showQuestion()
    }
    
    override func setConstraints() {
        scoreLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(110)
            make.height.equalTo(40)
            make.bottom.equalTo(progressView.snp.top).offset(18)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.right.equalTo(scoreLabel.snp.left).offset(-30)
            make.left.equalTo(10)
            make.height.equalTo(40)
            make.bottom.equalTo(progressView.snp.top).offset(30)
        }
        
        playButton.snp.makeConstraints { make in
            make.left.equalTo(scoreLabel.snp.right).offset(30)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalTo(progressView.snp.top).offset(30)
        }
        
        restartButton.snp.makeConstraints { make in
            make.left.equalTo(playButton.snp.right).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalTo(progressView.snp.top).offset(30)
        }
        
    }
    
    override func addedSubViews() {
        view.addSubview(scoreLabel)
        view.addSubview(timeLabel)
        view.addSubview(playButton)
        view.addSubview(restartButton)
    }
    
    @objc func startStopTapped(_ sender: Any) {
        if timeCounting {
            timeCounting = false
            timer.invalidate()
            playButton.setImage(UIImage(named: "play"), for: .normal)
        } else {
            timeCounting = true
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: .common)
        }

    }
    
    
    @objc func resetTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Reset Timer?", message: "Are you sure you would like to reset the Timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (_) in
            // do nothing
        }))

        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
            if self.timeCounting {
                self.timeCounting = false
                self.timer.invalidate()
                self.playButton.setImage(UIImage(named: "play"), for: .normal)
            }
            self.resetQuiz()
            self.count = 0
            self.timer.invalidate()
            self.timeLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.playButton.setImage(UIImage(named: "play"), for: .normal)
        }))
        
        self.present(alert, animated: true)
    }

    
    
    @objc func timerCounter() -> Void {
        count += 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timeLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
            timeString += String(format: "%02d", hours)
            timeString += ":"
            timeString += String(format: "%02d", minutes)
            timeString += ":"
            timeString += String(format: "%02d", seconds)
            return timeString
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: Const.isDark) {
            view.backgroundColor = .Rang.darkBack
            scoreLabel.textColor = .Rang.zodiaclight
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Rang.zodiaclight]
        } else {
            view.backgroundColor = .Rang.zodiaclight
            scoreLabel.textColor = .Rang.darkBack
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Rang.darkBack]
        }
    }
    
    func setupUI() {
        progressView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(240)
            make.height.equalTo(240)
        }
        view.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.top.equalTo(80)
            make.centerX.equalToSuperview()
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(progressView.snp.width)
        }

        for (index, button) in optionButtons.enumerated() {
            view.addSubview(button)
            button.snp.makeConstraints { make in
                if index == 0 {
                    make.top.equalTo(progressView.snp.bottom).offset(0)
                } else if index == 1 {
                    make.top.equalTo(progressView.snp.bottom).offset(60)
                } else if index == 2 {
                    make.top.equalTo(progressView.snp.bottom).offset(120)
                }

                make.height.equalTo(50)

                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
            }

            button.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
        }
    }


    func showQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        imageView.image = currentQuestion.image

        for (index, button) in optionButtons.enumerated() {
            button.setTitle(currentQuestion.options[index], for: .normal)
            
            
            scoreLabel.text = "score: \(currentQuestionIndex + 1)/ \(correctAnswer)"
            
        }

        progressView.animate(toAngle: 360 * progressValue, duration: 1, completion: nil)
    }

    @objc func optionSelected(_ sender: UIButton) {
       
        guard timeCounting else {
            
            return
        }

        guard currentQuestionIndex < questions.count else {
            showAlert(title: "Quiz Completed", message: "Well done!")
            resetQuiz()
           
            return
        }

        let currentQuestion = questions[currentQuestionIndex]

        if sender.currentTitle == currentQuestion.correctAnswer {
            correctAnswer += 1
        } else {
          
        }

        currentQuestionIndex += 1

        if currentQuestionIndex < questions.count {
            showQuestion()
        } else {
            showAlert(title: "Quiz Completed", message: "Well done!")
            resetQuiz()
        }
    }

    


    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func resetQuiz() {
        count = 0
        timer.invalidate()
        timeLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
        playButton.setImage(UIImage(named: "play"), for: .normal)
        correctAnswer = 0
        currentQuestionIndex = 0
        showQuestion()
    }
    
}
