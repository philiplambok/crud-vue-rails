<template>
  <div id="new-article-vue">
    <div v-show="message" class="alert">{{ message }}</div>
    <div class="form-group row">
      <label for="article_title" class="col-form-label col-sm-2">Title</label>
      <div class="col-md-10">
        <input type="text" id="article_title" class="form-control" name="article[title]">
      </div>
    </div>

    <div class="form-group row">
      <label for="article_body" class="col-form-label col-sm-2">Body</label>
      <div class="col-md-10">
        <textarea name="article[body]" id="article_body" class="form-control" cols="30" rows="10"></textarea>
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
      message: null
    };
  },
  methods: {
    submitArticle() {
      this.message = "Article has been published";
    }
  }
};
</script>

<style scoped>
</style>


