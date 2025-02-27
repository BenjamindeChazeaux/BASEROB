import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["loginModal", "signupModal"]

  connect() {
    console.log("Modal controller connected");
  }

  openLoginModal(event) {
    event.preventDefault();
    this.loginModalTarget.style.display = "block";
    this.signupModalTarget.style.display = "none";
  }

  openSignupModal(event) {
    event.preventDefault();
    this.signupModalTarget.style.display = "block";
    this.loginModalTarget.style.display = "none";
  }

  closeModals() {
    this.loginModalTarget.style.display = "none";
    this.signupModalTarget.style.display = "none";
  }

  switchModals(event) {
    event.preventDefault();
    if (this.loginModalTarget.style.display === "block") {
      this.loginModalTarget.style.display = "none";
      this.signupModalTarget.style.display = "block";
    } else {
      this.signupModalTarget.style.display = "none";
      this.loginModalTarget.style.display = "block";
    }
  }
} 