import UIKit

class DetailViewController: UIViewController {
    
    var city = String()

    @IBOutlet weak var weathe: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.text = city
        getTodayResult(cityName: city)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    let apiKey = "5750b3466e4a4a36b38174733231408"

    func getTodayResult(cityName: String) {
        if let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(cityName)") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    if let jsonObject = json as? [String: Any],
                       let current = jsonObject["current"] as? [String: Any],
                       let tempC = current["temp_c"] as? Double {
                        
                        let state = Int(tempC)
                        
                        DispatchQueue.main.async {
                            self.weathe.text = "\(state)°C"
                        }
                    }
                } catch {
                    print("JSON parsing error: \(error)")
                }
            }
            task.resume()
        }
    }
}
