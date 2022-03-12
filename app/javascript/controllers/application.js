import { Application } from "@hotwired/stimulus"
import "custom/range_updater"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
