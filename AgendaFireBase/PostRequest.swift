import SwiftUI

func postRequest(name: String, date: Date) {
  
  // declare the parameter as a dictionary that contains string as key and value combination. considering inputs are valid
  
  let parameters: [String: Any] = [
    "name": name,
    "date": Int(date.timeIntervalSince1970) * 1000
  ]
  
  // create the url with URL
  let url = URL(string: "https://superapi.netlify.app/api/db/eventos")!
  
  // now create the URLRequest object using the url object
  var request = URLRequest(url: url)
  request.httpMethod = "POST" //set http method as POST
  
  // add headers for the request
  request.addValue("application/json", forHTTPHeaderField: "Content-Type") //para que sepa el server que es un json
  request.addValue("application/json", forHTTPHeaderField: "Accept")
  
  do {
    // convert parameters to Data and assign dictionary to httpBody of request
    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
  } catch let error {
    print(error.localizedDescription)
    return
  }
  
  // create dataTask using the session object to send data to the server
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
    
    if let error = error {
      print("Post Request Error: \(error.localizedDescription)")
      return
    }
    
    // ensure there is valid response code returned from this HTTP response
    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode)
    else {
      print("Invalid Response received from the server")
      return
    }
  }
  // perform the task
  task.resume()
}
