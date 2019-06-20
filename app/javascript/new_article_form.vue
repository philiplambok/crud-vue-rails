<template>
  <div id="new-article-vue">
    <div v-show="anyErrors()" class="alert alert-danger">
      <ul>
        <li :key="error" v-for="error in errors">{{ error }}</li>
      </ul>
    </div>
    <div v-show="successMessage" class="alert alert-success">{{ successMessage }}</div>
    <div class="form-group row">
      <label for="article_title" class="col-form-label col-sm-2">Title</label>
      <div class="col-md-10">
        <input
          type="text"
          id="article_title"
          class="form-control"
          name="article[title]"
          v-model="title"
        >
      </div>
    </div>

    <div class="form-group row">
      <label for="article_body" class="col-form-label col-sm-2">Body</label>
      <div class="col-md-10">
        <textarea
          name="article[body]"
          id="article_body"
          class="form-control"
          cols="30"
          rows="10"
          v-model="body"
        ></textarea>
      </div>
    </div>

    <div class="form-group row">
      <div class="col-md-10 ml-auto">
        <button class="btn btn-primary px-4" @click="submitArticle()">Submit Article</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      title: "",
      body: "",
      successMessage: null,
      errors: []
    };
  },
  methods: {
    anyErrors() {
      if (this.errors.length > 0) {
        return true;
      } else {
        return false;
      }
    },

    checkErrors() {
      let errors = [];
      if (this.title == "") {
        errors.push("Title was blank");
      }

      if (this.body == "") {
        errors.push("Body was blank");
      }
      return errors;
    },

    submitArticle() {
      this.checkErrors();

      let url = "/api/articles";
      let reqData = {
        article: {
          title: this.title,
          body: this.body
        }
      };
      this.errors = this.checkErrors();

      if (this.errors.length > 0) {
        return false;
      }

      fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(reqData)
      })
        .then(response => response.json())
        .then(data => {
          console.log(data);
          this.title = "";
          this.body = "";
          this.successMessage = data.message;
        });
    }
  }
};
</script>

<style scoped>
</style>


