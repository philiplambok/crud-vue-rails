<template>
  <div id="article-list">
    <table class="table">
      <thead>
        <tr>
          <th>
            <div class="d-flex justify-content-between align-items-center">
              <span>Title</span>
              <a href="#" @click="sortByTitle()">
                <i class="fa fa-sort"></i>
              </a>
            </div>
          </th>
          <th>
            <div class="d-flex justify-content-between align-items-center">
              <span>Body</span>
              <a href="#" @click="sortByBody()">
                <i class="fa fa-sort"></i>
              </a>
            </div>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr :key="article.id" v-for="article in articles">
          <td>{{ article.title }}</td>
          <td>{{ article.body }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      articles: [],
      titleAsc: true,
      bodyAsc: true
    };
  },
  methods: {
    sortByTitle() {
      this.articles = this.articles.sort((a, b) => {
        if (a.title > b.title) {
          if (this.titleAsc) {
            return 1;
          } else {
            return -1;
          }
        }

        if (a.title < b.title) {
          if (this.titleAsc) {
            return -1;
          } else {
            return 1;
          }
        }

        return 0;
      });
      this.titleAsc = !this.titleAsc;
    },

    sortByBody() {
      this.articles = this.articles.sort((a, b) => {
        if (a.body > b.body) {
          if (this.bodyAsc) {
            return 1;
          } else {
            return -1;
          }
        }

        if (a.body < b.body) {
          if (this.bodyAsc) {
            return -1;
          } else {
            return 1;
          }
        }

        return 0;
      });
      this.bodyAsc = !this.bodyAsc;
    }
  },
  mounted() {
    fetch("/api/articles")
      .then(response => response.json())
      .then(data => {
        this.articles = data;
      });
  }
};
</script>

<style scoped>
a {
  color: black;
}
</style>


