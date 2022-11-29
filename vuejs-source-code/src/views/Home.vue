<template>
  <div>
    <v-carousel>
      <v-carousel-item
        v-for="(item, i) in items"
        :key="i"
        :src="item.src"
        reverse-transition="fade-transition"
        transition="fade-transition"
      >
        <v-row class="fill-height" align="center" justify="center">
          <div class="text-h2">Welcome to zkL Library</div>
        </v-row></v-carousel-item
      >
    </v-carousel>
    
    <v-container>
      <v-row>
        <div class='container'>
            <div class="row alert alert-warning">
            <div class="col-lg-4">
                    <div class="p py-1 text-center">Address</div>
                </div>
                <div class="col-lg-4">
                    <div class="p py-1 text-center">Copyright © 2021, ZKL, Inc. All rights reserved.</div>
                </div>
                <div class="col-lg-4">
                    <div class="p py-1 text-center">Contact Us: <a href="mailto:name@mail.com" style="color:orangered">name@mail.com</a></div>
              </div>
            </div>
        </div>
      </v-row>
      <v-row>
        <v-col :key="n"
          ><v-card
            class="mx-auto text-center"
            color="green"
            dark
            max-width="600"
          >
            <v-card-text>
              <v-sheet color="rgba(0, 0, 0, .12)">
                <v-sparkline
                  :value="value"
                  color="rgba(255, 255, 255, .7)"
                  height="100"
                  padding="24"
                  stroke-linecap="round"
                  smooth
                >
                  <template v-slot:label="item"> {{ item.value }} </template>
                </v-sparkline>
              </v-sheet>
            </v-card-text>
            <v-card-text>
              <div class="text-h4 font-weight-thin">Meaningful Book Chart</div>
            </v-card-text>
          </v-card>
          </v-col>
          <v-col :key="n"
          ><v-card
            class="mx-auto text-center"
            color="green"
            dark
            max-width="600"
          >
            <v-card-text>
              <v-sheet color="rgba(0, 0, 0, .12)">
                <v-sparkline
                  :value="value"
                  color="rgba(255, 255, 255, .7)"
                  height="100"
                  padding="24"
                  stroke-linecap="round"
                  smooth
                >
                  <template v-slot:label="item"> {{ item.value }} </template>
                </v-sparkline>
              </v-sheet>
            </v-card-text>
            <v-card-text>
              <div class="text-h4 font-weight-thin">Meaningful Author Chart</div>
            </v-card-text>
          </v-card>
          </v-col>
      </v-row>
      <br />
    </v-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        {
          src: "https://cdn.vuetifyjs.com/images/carousel/squirrel.jpg",
        },
        {
          src: "https://cdn.vuetifyjs.com/images/carousel/sky.jpg",
        },
        {
          src: "https://cdn.vuetifyjs.com/images/carousel/bird.jpg",
        },
        {
          src: "https://cdn.vuetifyjs.com/images/carousel/planet.jpg",
        },
      ],

      labels: ["12am", "3am", "6am", "9am", "12pm", "3pm", "6pm", "9pm"],
      value: [1, 3, 2, 2, 1, 3, 1, 1],
    };
  },
};
</script>
<style scoped>
.text-h2 {
  color: white;
  text-align: center;
}

.v-sheet--offset {
  top: -24px;
  position: relative;
}
</style>