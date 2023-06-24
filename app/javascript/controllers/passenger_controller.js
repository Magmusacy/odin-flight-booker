import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static values = { passengerNumber: Number, dynamicPassengers: Number }
  static targets = [ "passengerNumber", "template", "globalLabel", "passengerList", "emailField", "emailLabel", "textField", "textLabel", "passenger" ]

  connect() {
  }

  add() {
    if (this.passengerNumberValue > 3) {
      return
    }
    const content = this.templateTarget.content.cloneNode(true)
    this.passengerListTarget.append(content)
    console.log(this.dynamicPassengersValue)
    console.log()
    // Add correct attributes to new passengers (I think if I used turbo streams this would be much simpler)
    this.textLabelTargets[this.dynamicPassengersValue].for=`booking_passengers_attributes_${this.passengerNumberValue}_name`
    this.textFieldTargets[this.dynamicPassengersValue].name=`booking[passengers_attributes][${this.passengerNumberValue}][name]`
    this.emailLabelTargets[this.dynamicPassengersValue].for=`booking_passengers_attributes_${this.passengerNumberValue}_email`
    this.emailFieldTargets[this.dynamicPassengersValue].name=`booking[passengers_attributes][${this.passengerNumberValue}][email]`
    // Change the label above the last passenger
    this.passengerNumberValue++
    this.globalLabelTargets[this.dynamicPassengersValue].textContent =  `Passenger ${this.passengerNumberValue}` 
    this.dynamicPassengersValue++
  }

  remove() {
    console.log(this.passengerNumberValue)
    if (this.passengerNumberValue < 2) {
      return
    } 

    let lastPassenger = this.passengerTargets[this.passengerTargets.length - 1]
    lastPassenger.remove()
    this.passengerNumberValue--
    // ensure dynamicPassengersValue can't be negative
    if (this.dynamicPassengersValue > 0) {
      this.dynamicPassengersValue-- 
    } 
  }
}
