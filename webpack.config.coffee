webpack = require "webpack"
path = require "path"


module.exports = {

  # entryポイントを指定、複数指定できます
  entry:
    index: "./src/index.coffee"
    sytle: "./src/scss/style.scss"

  # 出力先の設定
  output:
    filename: "[name].js"
    libraryTarget: "commonjs2"

  # ファイル名の解決を設定
  resolve:
    extensions: [".js", ".coffee"]

  # .coffeeをcoffee-loaderに渡すように
  # 他にもhtmlやcssを読み込む必要がある場合はここへ追記
  module:
    rules: [
      { test: /\.coffee$/, use: "coffee-loader" },
      { test: /\.scss$/,
        use: ["sytle-loader",
              "sass-loader",
              "css-loader",
             ]
      }
    ]

  # webpack用の各プラグイン
  plugins: [
  ]

  target: 'node'
}
