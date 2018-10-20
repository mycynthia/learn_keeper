import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue/dist/vue.esm"
import VueSelect from "vue-select";
import axios from "axios";
// import {
//   DEFAULT
// } from "constants";

Vue.use(TurbolinksAdapter);

// axios.interceptors.request.use(
//   config => {
//     config.data = JSON.stringify(config.data);
//     config.headers = {
//       'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
//     };
//     return config;
//   },
//   err => {
//     return Promise.reject(err);
//   }
// );


document.addEventListener("turbolinks:load", () => {
  const app = new Vue({
    el: "#app",
    data: {
      locations: ["Taipei", "Hsinchu", "Kaohsiung"],
      selectedLocation: null,
      labels: [],
      selectedLabels: [],
      groupName: "",
      groupDescription: "",
      fileLocation: "",
      newGroupMsg: ""
    },
    methods: {
      getLabels() {
        return this.labels.length <= 0 ? this.loadLabels() : null;
      },
      loadLabels() {
        self = this;
        axios
          .get("/api/v1/labels")
          .then(function (response) {
            self.labels = response.data.labels;
          })
          .catch(function (error) {
            console.log(error);
          });
      },
      createGroup(event) {
        let self = this;
        let createUrl = "/api/v1/groups";
        let btnCreate = event.target;
        btnCreate.innerText = "Creating..."
        btnCreate.disabled = true
        // pack params using FormData
        var params = new FormData();
        params.append("name", self.groupName);
        params.append("description", self.groupDescription);
        params.append("location", self.selectedLocation);
        params.append("image", self.fileLocation);
        params.append("selectedLabels", JSON.stringify(self.selectedLabels));
        // get data from api
        axios
          .post(createUrl, params, {
            headers: {
              "Content-Type": "multipart/form-data",
              "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            }
          })
          .then(function (res) {
            let group = res.data.group;
            location.href = "/groups/" + group.id
            btnCreate.innerText = "Created"

          })
          .catch(function (err) {
            console.error(err.response.data);
          });
      },
      selectedFile(event) {
        this.fileLocation = event.target.files[0];
      }
    },
    components: {
      "v-select": VueSelect
    }
  });
});