<template>
  <div class="container">
    <div class="row">
      <h2>Search your Library</h2>
    </div>
    <br />
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-sm-4">
            <p>
              <label for="author" class="form-label">Search by Author</label
              ><br />
              <input
                class="form-control"
                type="text"
                id="author"
                v-model="bookObj.author"
              />
            </p>
          </div>
          <div class="col-sm-4">
            <p>
              <label for="desc" class="form-label">Search by Book Name</label
              ><br />
              <input
                class="form-control"
                type="text"
                id="desc"
                v-model="bookObj.name"
              />
            </p>
          </div>
          <div class="col-sm-4 form-check">
            <label class="px-1">Genre:</label><br />
            <input
              class="form-check-input px-4"
              type="radio"
              id="thrill"
              v-model="bookObj.type"
              value="Thriller"
            />
            <label class="form-check-label px-6" for="thrill">Thriller</label><br />
            <input
              class="form-check-input px-4"
              type="radio"
              id="romance"
              v-model="bookObj.type"
              value="Romance"
            />
            <label class="form-check-label px-6" for="romance">Romance</label><br />
            <input
              class="form-check-input px-4"
              type="radio"
              id="fantas"
              v-model="bookObj.type"
              value="Fantasy"
            />
            <label class="form-check-label px-6" for="fantas">Fantasy</label><br />
            <input
              class="form-check-input px-4"
              type="radio"
              id="all"
              v-model="bookObj.type"
              value=""
            />
            <label class="px-6" for="all">All</label><br />
          </div>
        </div>
      </div>
    </div>
    <br />
    <div class="row">
      <div class="table-responsive">
        <table class="table table-success table-striped table-hover">
          <thead>
            <tr>
              <th>Book No.</th>
              <th>Author</th>
              <th>Name</th>
              <th>Genres</th>
              <th>Availablity</th>
              <th>Delete</th>
            </tr>
          </thead>
          <tbody>
            <tr v-bind:key="m.id" v-for="m in filterBooks">
              <td>{{ m.id }}</td>
              <td>{{ m.author }}</td>
              <td>{{ m.name }}</td>
              <td>{{ m.type }}</td>
              <td>{{ m.avail }}</td>
              <td>
                <v-btn
                  @click="deleteData(m.id)"
                  flat
                  icon
                  color="grey lighten-1"
                  left="false"
                >
                  <v-icon>mdi-close-box</v-icon>
                </v-btn>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <p>{{ err }}</p>
    </div>
  </div>
</template>

<script>
// export component
export default {
  name: "books",
  data: function () {
    return {
      dbapi: "http://localhost/vuex/apis.php",
      books: [],
      err: "",
      msg: "",
      bookObj: { author: "", name: "", type: "" },
    };
  },
  methods: {
    // GET
    get: function (url) {
      // GET request using fetch with error handling
      fetch(url)
        .then((response) => {
          //turning the response into the usable data
          // return response.json( );
          if (!response.ok) {
            this.err = response.status;
            return response.ok;
          } else {
            return response.json();
          }
        })
        .then((data) => {
          //This is the data you wanted to get from url
          // console.log('data: ' + data);
          if (!data) {
            // !response.ok
            this.msg = "Unsuccessful!";
          } else {
            this.books = data;
            this.msg = "Successful!";
          }
        })
        .catch((error) => {
          // console.log("error" + error);
          this.err = error;
        });
    },
    deleteData: function (idx) {
      // POST request using fetch with error handling
      var url = this.dbapi + "/id/" + idx;
      const requestOptions = {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          id: idx,
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
          this.msg = "successful";
          this.get(this.dbapi);;
        })
        .catch((error) => {
          this.err = error;
        });
    },
  },
  created: function () {
    this.get(this.dbapi);
  },
  computed: {
    filterBooks: function () {
      return this.books.filter(
        (m) =>
          m.author.toLowerCase().match(this.bookObj.author.toLowerCase()) &&
          m.name.toLowerCase().match(this.bookObj.name.toLowerCase()) &&
          m.type.toLowerCase().match(this.bookObj.type.toLowerCase())
      );
    },
  },
};
</script>
<style>
</style>