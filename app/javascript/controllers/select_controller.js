import { Controller } from "@hotwired/stimulus"
import _ from "lodash"
import { post } from "@rails/request.js"

export default class extends Controller {

  async change(e) {
    const user_id = (_.parseInt(e.target.selectedOptions[0].value))

    await post('/sessions', {
      body: JSON.stringify(
        {
          user_id: user_id
        }),
      responseKind: 'turbo-stream'
    })
  }
}
