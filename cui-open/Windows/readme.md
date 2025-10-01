### インストール方法
- ij.batとopen-imagej.ijmをImageJの実行ファイル（ImageJ.exe）があるフォルダにコピーする．
- ImageJの実行ファイル（ImageJ.exe）があるフォルダへのPATHを通す．(https://atmarkit.itmedia.co.jp/ait/articles/1805/11/news035.html)

### 使い方
- 画像一枚を表示
```
ij [画像ファイルパス]
例: ij rec00030.tif
例: ij rec¥rec00030.tif
```

- 画像フォルダ内の全ての画像をimport as image sequence（メモリ使用）
```
ij [画像フォルダパス]
例: ij rec
例: ij sample01¥ro
```

- 画像フォルダ内の全ての画像をimport as image sequence（メモリを使わずにvirtual stackとして読み込む）
```
ij [画像フォルダパス] v
例: ij rec v
例: ij sample01¥ro v
```

- 画像フォルダ内のstart枚目からend枚目をimport as image sequence（メモリ使用）
```
ij [画像フォルダパス] [start] [end]
例: ij rec 400 800
例: ij sample01¥ro 700 1000
```

- 画像フォルダ内のstart枚目からend枚目をimport as image sequence（メモリを使わずにvirtual stackとして読み込む）
```
ij 画像フォルダパス [start] [end] v
例: ij rec 400 800 v
例: ij sample01¥ro 700 1000 v
```
パスは相対パスと絶対パス両方使える（はず）．   
~~オプションを半角アットマークで区切って入力する要領．~~  
~~ImageJマクロの仕様上の都合でアットマークを使っている．（本当はカンマやスペースを使いたい...）~~ スペースかカンマで区切るように仕様変更．
