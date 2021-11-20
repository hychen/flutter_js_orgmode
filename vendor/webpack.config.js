var path = require('path')

module.exports = [{
  entry: ['./index'], // 在 index 檔案後的 .js 副檔名是可選的
  mode: 'production',
  output: {
    libraryTarget: "var",
    library: 'vendor',
    path: path.join(__dirname, '../assets/js/'),
    filename: 'bundle.js'
  },
}]
