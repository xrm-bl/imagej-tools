### インストール方法
- ij.batとopen-imagej.ijmをImageJの実行ファイル（ImageJ.exe）があるフォルダにコピーする．
- ImageJの実行ファイル（ImageJ.exe）があるフォルダへのPATHを通す．(https://atmarkit.itmedia.co.jp/ait/articles/1805/11/news035.html)

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
ij 画像フォルダパス@v
```

- 画像フォルダ内のstart枚目からend枚目をimport as image sequence（メモリ使用）
```
ij 画像フォルダパス@start@end
```

- 画像フォルダ内のstart枚目からend枚目をimport as image sequence（メモリを使わずにvirtual stackとして読み込む）
```
ij 画像フォルダパス@start@end@v
```
パスは相対パスと絶対パス両方使える（はず）．   
オプションを半角アットマークで区切って入力する要領．     
ImageJマクロの仕様上の都合でアットマークを使っている．（本当はカンマやスペースを使いたい...）
