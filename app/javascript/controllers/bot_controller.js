import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", 'answer' ]

  connect() {
  }

  send(){
    console.log(this.inputTarget.value)
    this.answerTarget.insertAdjacentHTML( "beforeend" ,this.inputTarget.value)

    fetch(`/message?message=${this.inputTarget.value}`,
      { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        this.answerTarget.insertAdjacentHTML( "beforeend" ,data.message)
      });
  }
}
