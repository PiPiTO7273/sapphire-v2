
# Sapphire v2の追加機能・変更点

by puoro. Games (piyapipitox)

Sapphire v1.xx系（以下、v1系）を旧バージョンとし、現在開発中であるSapphire v2.xx系（以下、v2系）を新バージョンとした新機能や改善点などの仕様を紹介します。

## UI設計の効率化
v1系では、UIパーツの位置、アニメーションなどはすべてプログラム内に静的に実装されていました。
これにより自由度の高い演出やデータの改ざんが防止できるといった利点もありましたが、大規模な開発を行う場面ではやや非効率で不具合の起きやすい実装と言えます。

そこで、v2系ではDynamic UI Input-Output（以下、DUIO）という外部スクリプトを読み込んで画像やボタン、テキストなどといったUIの要素を動的に実装できるシステムを開発しました。
これにより、ゲーム本体を更新することなく通知やダイアログなどの更新頻度の高い情報を組み込むことが可能になりました。

## 60hz以外のリフレッシュレートへの対応
近年のゲームプレイ環境では、60hzだけでなく144hz、240hzといった高いリフレッシュレートの環境も増加しています。
また、処理に追いつかずフレームレートが低下する場合も想定しなければなりません。

v1系ではアニメーションやゲームプレイは60hz環境でのフレームベース（16.66ms単位）で行っていましたが、v2系ではタイマーを使用したミリ秒ベース（1ms単位）で動作するようになりました。

## 疑似マルチスレッドへの対応
v1系ではメインループ内で描画やカウンタなどの処理を行い、垂直同期信号を待つことで画面のちらつきを抑えていました。
v2系では垂直同期信号を待機している時間に、負荷の軽い判定処理など（以下、サブスレッド）を限界まで繰り返し行うことで、無駄のない処理が可能になりました。

図＞<br>
v1系　　　　　【開始】・・・描画・判定・カウンタ処理・・・・垂直同期信号を待機・・・【終了】<br>
v2系　　　　　【開始】・・・描画・・・【＊】判定・カウンタ処理・垂直同期信号を確認・【＊へ戻る】・【垂直同期信号を待機】・【終了】

## 譜面形式の変更
v1系ではINIフォーマットをベースにした譜面ファイルを使用していましたが、v2系では独自設計のバイナリベースの譜面形式を使用しています。
これによりファイルサイズを平均50%まで抑えることに成功しました。

## IR登録時のスコアグラフの保存形式の変更
v1系ではすべての判定タイミングでのスコアをDWORD（4byte）で並べたものを文字列のみで表せるようにエンコードしていましたが、
v2系では判定（Excellent,Greatなど）のみをCHAR（1byte）で記録することでデータ転送量を約25%に抑えることに成功しました。

また、v2系でのクライアントでは従来のv1系のスコアグラフを使用できますが、ハイスコアを更新した場合はv2系のスコアグラフに上書きして転送されるためv1系ではスコアグラフを利用できなくなります。

※保存形式の識別のために先頭1byteを使用するため、データ長は【v1系のスコアグラフ*0.25+1 byte】となります。

## 選曲画面の利便性向上
従来のカテゴリ・フォルダ分けの機能に加え、ソートやキーワード検索機能を追加しました。

## 通貨単位の変更
通貨単位の名称をLillyからLepusに変更しました。
v2系クライアントの起動時にLillyをLepusに変換する処理が行われます。

※通貨価値の変化は基本的にはありません。

## ゲームプレイ画面の3D化
v1系のシンプルな2Dのレーンをv2系では3Dの立体的で臨場感のあるレーンに変更しました。
後々のアップデートでオプションから2Dのレーンに変更することも可能にする予定です。
予定なだけでやるとは言ってません。めんどくさいので。

## システムフォントの変更
UIで使用されるデフォルトの日本語フォントを、
Noto Sans CJK JPから自家製 Rounded M+に変更しました。

## ランチャーとクライアントを統合
puoroのサーバーから常に最新のHSPオブジェクトファイルをダウンロードして、
run命令で実行することで本体更新が不要になりました。

## プレイオプションの変更
以下のプレイオプションを廃止しました。
- N-MIRROR
- H-MIRROR
- A-RANDOM
- S-AUTO

また、以下のプレイオプションを新たに追加しました。

- HALF-HALF
- SINGLE

## 素材

https://icons8.jp/license

https://icons8.com/icon/V9u2S9AhOCBt/combi-ticket

https://icons8.com/icon/EHyUO6ZGSRkX/lock

https://icons8.com/icon/17333/diamond

https://icons8.com/icon/kLORTzuNOM2d/wrapped-gift

[Star Avenue](https://www.1001freefonts.com/star-avenue.font) - [Dirt2](https://www.1001freefonts.com/designer-dirt2-fontlisting.php)

[Earth Orbiter](https://www.1001freefonts.com/earth-orbiter.font) - [Iconian Fonts](https://www.1001freefonts.com/designer-iconian-fonts-fontlisting.php)

[Pier Sans](https://befonts.com/pier-sans-font-family.html) - [Hamilton](https://befonts.com/author/hamilton)

[自家製 Rounded M+](http://jikasei.me/font/rounded-mplus/about.html) - [自家製フォント工房](http://jikasei.me/) , [M+ OUTLINE FONTS](http://mplus-fonts.osdn.jp/)

https://booth.pm/ja/items/935237