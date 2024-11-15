### インストール方法
- ij.batとopen-imagej.ijmをImageJの実行ファイル（ImageJ.exe）があるフォルダにコピーする．
- ImageJの実行ファイル（ImageJ.exe）があるフォルダへのPATHを通す．

### 使い方
- 画像一枚を表示
```
ij 画像ファイルパス
```

- 画像フォルダ内をimport as image sequence（メモリ使用）
```
ij 画像フォルダパス
```

- 画像フォルダ内をimport as image sequence（メモリを使わずにvirtual stackとして読み込む）
```
ij 画像フォルダパス@v
```

- 画像フォルダ内のstart枚目からend枚目をimport as image sequence（メモリ使用）
```
ij 画像フォルダパス@start@End
```

- 画像フォルダ内のstart枚目からend枚目をimport as image sequence（メモリを使わずにvirtual stackとして読み込む）
```
ij 画像フォルダパス@start@End@v
```
