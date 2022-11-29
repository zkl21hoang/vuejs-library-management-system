<template>
  <div class="container">
    <div class="row">
      <h2>Borrow your books here</h2>
    </div>
    <br />
    <div class="row mt-5">
      <h4>Available books that you can borrow</h4>
      <v-simple-table height="300px">
        <template v-slot:default>

          <thead>
            <tr>
              <th class="col-3 text-center">Book No.</th>
              <th class="col-3 text-center">Author</th>
              <th class="col-3 text-center">Name</th>
              <th class="col-3 text-center">Genres</th>
            </tr>
          </thead>
          <tbody>
            <tr v-bind:key="m.id" v-for="m in filterAvailable">
              <td class="text-center">{{ m.id }}</td>
              <td class="text-center">{{ m.author }}</td>
              <td class="text-center">{{ m.name }}</td>
              <td class="text-center">{{ m.type }}</td>
              <td>
                <v-btn
                  @click="borrowBook(m.id, 'Unavailable')"
                  color="success"
                  left="false"
                  small
                  >Borrow
                </v-btn>
              </td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </div>
    <div class="row">
          <h4>Borrowed books that are no longer available</h4>
      <v-simple-table height="300px">
        <template v-slot:default>
          <thead>
            <tr>
              <th class="col-3 text-center">Book No.</th>
              <th class="col-3 text-center">Author</th>
              <th class="col-3 text-center">Name</th>
              <th class="col-3 text-center">Genres</th>
            </tr>
          </thead>
          <tbody>
            <tr v-bind:key="m.id" v-for="m in filterUnavailable">
              <td class="text-center">{{ m.id }}</td>
              <td class="text-center">{{ m.author }}</td>
              <td class="text-center">{{ m.name }}</td>
              <td class="text-center">{{ m.type }}</td>
              <td>
                <v-btn
                  @click="borrowBook(m.id, 'Available')"
                  small
                  color="success"
                  left="false"
                  >Return
                </v-btn>
              </td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </div>
    <p>{{ err }}</p>
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
    borrowBook: function (idx, borrow) {
      // POST request using fetch with error handling
      var url = this.dbapi + "/id/" + idx;
      const requestOptions = {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          id: idx,
          avail: borrow,
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
          this.get(this.dbapi);
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
    filterAvailable: function () {
      return this.books.filter((m) => m.avail.toLowerCase() == "available");
    },
    filterUnavailable: function () {
      return this.books.filter((m) => m.avail.toLowerCase().match("unavailable"));
    },
  },
};
</script>
<style>
</style>