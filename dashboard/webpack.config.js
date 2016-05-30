var ExtractTextPlugin = require("extract-text-webpack-plugin");
module.exports = {
  context: __dirname + "/src",
  entry: {
    javascript: "./app.jsx",
    html: "./index.html"
  },

  output: {
    filename: "app.js",
    path: __dirname + "/dist",
  },
  resolve: {
    extensions: ['', '.js', '.jsx']
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel-loader',
        query: {
          presets: ['react', 'es2015']
        }
      },
      {
        test: /\.html$/,
        loader: "file?name=[name].[ext]",
      },
      {
        test: /\.png$/,
        loader: "file?name=[name].[ext]",
      },
      {
        test: /\.(scss|css)$/,
        loader: ExtractTextPlugin.extract("style-loader", "css-loader!sass-loader"),
      },
    ],
  },
  plugins: [
    new ExtractTextPlugin("style.css")
  ]

}
