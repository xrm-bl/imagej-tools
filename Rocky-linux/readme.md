### インストール方法
- ijとopen-imagej.ijmを適当なディレクトリを作ってその中にコピーする．
- ijの中のdir-to-imagejを実際のパスに書き換える．
- ディレクトリへのPATHを通す．

### 使い方
- 画像一枚を表示
```
ij 画像ファイルパス
```

- 画像フォルダ内の全ての画像をimport as image sequence（メモリ使用）
```
ij 画像フォルダパス
```

- 画像フォルダ内の全ての画像をimport as image sequence（メモリを使わずにvirtual stackとして読み込む）
```
ij 画像フォルダパス v
```

- 画像フォルダ内のstart枚目からend枚目をimport as image sequence（メモリ使用）
```
ij 画像フォルダパス start End
```

- 画像フォルダ内のstart枚目からend枚目をimport as image sequence（メモリを使わずにvirtual stackとして読み込む）
```
ij 画像フォルダパス start end v
```
パスは相対パスと絶対パス両方使える（はず）．   
オプションを半角スペースで区切って入力する要領．
