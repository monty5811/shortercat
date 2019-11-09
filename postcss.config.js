var process = require("process");
const purgecss = require("@fullhuman/postcss-purgecss")({
  // Specify the paths to all of the template files in your project
  content: [
    "../dist/*.html",
    "../dist/*.js",
    "../src/Main.elm"
  ],

  // Include any special characters you're using in this regular expression
  defaultExtractor: content => content.match(/[A-Za-z0-9-_:/]+/g) || []
});

module.exports = {
  plugins: [
    require("tailwindcss"),
    require("autoprefixer"),
    require("postcss-elm-tailwind")({ elmFile: "src/TW.elm" }),
    ...(process.env.NODE_ENV === "production" ? [purgecss] : [])
  ]
};