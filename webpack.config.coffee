webpack = require "webpack"
path = require "path"
ExtractTextPlugin = require "extract-text-webpack-plugin"

MODE = 'development'

module.exports = {

  mode: MODE,

  # entryポイントを指定、複数指定できます
  entry:
    # index: "./src/index.coffee"
    style: "./src/style.coffee"

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
        use: ExtractTextPlugin.extract([
          { loader: "css-loader" },
          { loader: "sass-loader" }
        ])
      },
      {
        # 対象となるファイルの拡張子
        test: /\.(gif|png|jpg|eot|wof|woff|ttf|svg)$/,
        # 画像を埋め込まず任意のフォルダに保存する
        use: [
          {
            loader: 'file-loader',
            options: {
              name: '[path][name].[ext]',
              outputPath: 'assets/images/'
            }
          }
        ]
      },
    ]

  # webpack用の各プラグイン
  plugins: [
    new ExtractTextPlugin('style.css'),
  ]

  # target: 'node'
}
