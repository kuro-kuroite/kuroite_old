webpack = require "webpack"
path = require "path"


# MODE = 'development'

module.exports = {

  # mode: MODE,

  # entryポイントを指定、複数指定できます
  entry:
    # index: "./src/index.coffee"
    sytle: "./src/style.coffee"

  # 出力先の設定
  output:
    filename: "[name].js"
    # libraryTarget: "commonjs2"

  # ファイル名の解決を設定
  resolve:
    extensions: [".js", ".coffee", ".sass", ".css"]

  # .coffeeをcoffee-loaderに渡すように
  # 他にもhtmlやcssを読み込む必要がある場合はここへ追記
  module:
    rules: [
      {
        test: /\.coffee$/,
        use: [
          { loader: "coffee-loader" }
        ]
      },
      {
        test: /\.scss$/,
        use: [
          { loader: "style-loader" },
          { loader: "css-loader" },
          { loader: "sass-loader" }
        ]
      },
    ]

  # webpack用の各プラグイン
  plugins: [
  ]

  # target: 'node'
}
