<template>
  <div class="container">
    <div class="row">
      <h2>Add a Book</h2>
    </div>
    <br />
    <v-form
      ref="myForm"
      v-model="valid"
      lazy-validation
      @submit.prevent
      autocomplete="off"
    >
      <div>
        <v-text-field
          name="bookTitle"
          v-model="name"
          :rules="nameBookRules"
          label="Book Title"
          placeholder="The Shining"
          required
        >
        </v-text-field>
        <v-text-field
          name="authorName"
          v-model="author"
          :rules="nameRules"
          label="Author of the book"
          placeholder="Stephen King"
          required
        >
        </v-text-field>
        <label>Genre:</label><br />
                  <v-radio-group v-model="genre" row class="ml-15"  :rules="[v => !!v || 'Genre is required']" required>
            <v-radio label="Thriller" value="Thriller" ></v-radio>
            <v-radio label="Romance" value="Romance" ></v-radio>
             <v-radio label="Fantasy" value="Fantasy" ></v-radio>
          </v-radio-group>
      </div>
      <v-btn
        class="mt-5"
        :disabled="!valid"
        @click="
          validate
        "
        >Create
      </v-btn>
    </v-form>
    <br />
    <div v-show='msg' class='container py-1'>
      <div class='alert alert-success' role='alert'>
        <p class="text-center">{{ msg }}</p>
      </div>
    </div>
    <div v-show='!msg && err' class='container py-1'>
      <div class='alert alert-danger' role='alert'>
        <p>{{ err }}</p>
      </div>
    </div>
  </div>
</template>

<script>
// export component
export default {
  name: "PersonsCreate",
  data: function () {
    return {
      dbapi: "http://localhost/vuex/apis.php",
      valid: true,
      err: "",
      msg: "",
      author: "",
      name: "",
      genre: "",
      nameRules: [
        (v) => !!v || "Author is required",
        (v) => /^[A-Za-z_ ]+$/.test(v) || "Letters only",
      ],
      nameBookRules: [
        (v) => !!v || "Book is required",
        (v) => /^[A-Za-z_ ]+$/.test(v) || "Letters only",
      ],
    };
  },
  methods: {
    validate() {
      if (this.$refs.myForm.validate()) {
        this.create(this.author, this.name, this.genre)
      }
    },
    // POST
    create: function (author, name, genre) {
      // POST request using fetch with error handling
      var url = this.dbapi;
      const requestOptions = {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          author: author,
          name: name,
          type: genre,
          avail: "Available",
        }),
      };
      fetch(url, requestOptions)
        .then((response) => {
          // TODO: add handling for response.ok
          //turning the response into the usable data
          return response.json();
        })
        .then((data) => {
          //This is the data you wanted to get from url
          this.msg = "You have successfully added the book!";
        })
        .catch((error) => {
          this.err = error;
        });
    },
  },
};
</script>

<style>
input {
  margin: 5px;
}
</style>
