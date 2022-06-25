;_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
;
;	「mod_CharStr」
;
;	文字列操作モジュール
;
;	by FunnyMaker
;	製作開始 : 2013/5/19
;	最終更新 : 2014/1/11
;
;	※CharStr は character string の略
;
;_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
#module N_M_CharStr1;「Name_Mod_CharStr1」の略

;	文字数を調べる。改行コードはカウントしない。
;
;	[書式]
;		val = MCS_CntChar(文字列)
#defcfunc MCS_CntChar str strings_tmp
	strings1 = strings_tmp
	notesel strings1
	result = 0;結果の保存先
	repeat notemax
		noteget strings2,cnt;1行取り出す
		count1 = 0;取り出した行において読み進めたバイト数
		repeat
			num1 = peek(strings2,count1) : count1 + 1
			if num1 = 0 : break;終了コード検出
			result + 1
			if ((129 <= num1)&(num1 <= 159))|((224 <= num1)&(num1 <= 252)) : count1 + 1;全角文字の場合は、読み出しバイト数に+1。
		loop
	loop
	return result
#global

#module N_M_CharStr2

;	複数行文字列において、最長の行の文字数を調べる。

;	[書式]
;		val = MCS_CntChar2(文字列)

#defcfunc MCS_CntChar2 str strings_tmp
	strings1 = strings_tmp
	notesel strings1
	result = 0;最長記録
	repeat notemax
		notesel strings1 : noteget strings2,cnt;1行取り出す
		num1 = MCS_CntChar(strings2) : if num1 > result : result = num1
	loop
	return result
#global

#module N_M_CharStr3

;	与えられた文字列が数字かどうか調べる

;	[書式]
;		flg = MCS_IsThisFigure(文字列)

;	戻り値 : (1,0) = (数字である,数字でない)

;	(例)
;		794 は数字
;		8W2 は数字でない

#defcfunc MCS_IsThisFigure str string_arg

	string1 = string_arg
	length_string1 = strlen(string1)
	if length_string1 = 0 : return
	
	;＜  - を除いた部分を用意する ＞
		if peek(string1,0) = '-' {
			string2 = strmid(string1,1,length_string1 - 1)
			length_string2 = length_string1 - 1
		} else {
			string2 = string1
			length_string2 = length_string1
		}
	
	if length_string2 = 0 : return 0		;この時点で空文字列の場合はアウト。
	if peek(string2,0) = '.' : return 0	;先頭に . があったらアウト。
	
	flg1 = 1
	count1 = 0	;発見した . の個数のカウンタ
	repeat length_string2
		k = peek(string2,cnt)
		if ((48 <= k)&(k <= 57))|(k = 46) {  } else { flg1 = 0 : break }	; 0～9 . のいずれかならOK。それ以外ならアウト。
		if k = 46 : count1 ++
		if count1 >= 2 : flg1 = 0 : break	; . が2個以上あったらアウト。
	loop
	
	return flg1
#global

#module N_M_CharStr4
;	64bit倍精度の実数値を文字列で正確に表現する

;	[書式]
;
;		str = MCS_DoubleToStr64(実数値)

#defcfunc MCS_DoubleToStr64 double x
	;k1 = strlen(str(abs(x)))
	;k2 = 16 - k1
	;str1 = "%."+k2+"f"
	;return strf(str1,x)
	
	;		↓(まとめると...)
	
	return strf("%."+str(16 - strlen(str(abs(x))))+"f",x)
#global

#module N_M_CharStr5
;	数字の小数位の末尾の、連続する0を省略する。

;	[書式]

;	buf = MCS_OmitZero("文字列")
;	または、
;	buf = MCS_OmitZero(変数名1)
;
;	変数名1	:	文字列が格納されている変数の名前

#defcfunc MCS_OmitZero str strings
	
	Buf = strings
	if instr(Buf,0,".") = -1 : return Buf	; . が無い場合は省略すべき0は無い
	k1 = strlen(strings)
	
	k2 = k1
	repeat k1
		;Str1 = strmid(Buf,k1-1-cnt,1)
		x = peek(Buf,k1-1-cnt)
		if x ! '0' {
			if x = '.' : k2 = k1-1-cnt : else : k2 = k1-cnt
			break
		}
	loop
	
	return strmid(Buf,0,k2)
#global

#module N_M_CharStr6
;	SJISコードで記述された文字列から指定された1文字を取り出す。
;	改行コード 13 10 はそれぞれ1つの半角文字として扱われるので注意。

;	[書式]
;
;		str = MCS_GetChar(文字列,p1,p2)
;
;	文字列	:	取り出し元の文字列(変数名も可)
;	p1		:	取り出し開始インデックス(>=0)
;	p2		:	取り出す文字数

#defcfunc MCS_GetChar str strings_given ,int Index_start ,int CharNum_get
	if (Index_start < 0)|(CharNum_get <= 0) : return ""
	result = ""
	strings1 = strings_given
	;＜ 1文字ずつ区切る ＞
		;1文字ずつ区切って、情報を「Cell1_strings1」整数型配列変数に保存する。
		;要素(n,0)にn+1文字目の文字のステータス(0=null ,1=半角 ,2=全角)
		;要素(n,1),(n,2)にn+1文字目の文字の1,2バイト目(※半角の場合は2バイト目は0とする)の値が格納される
		dim Cell1_strings1,strlen(strings_given),3
		count1_read = 0	;読み進めたバイト数
		count2_read = 0	;読み進めた文字数
		repeat strlen(strings_given)
			num1(0) = peek(strings1,count1_read)
			if num1(0) = 0 : break
			if num1(0) <= 128 {;半角の場合
				count1_read ++
				Cell1_strings1(count2_read,0) = 1
				Cell1_strings1(count2_read,1) = num1(0)
			} else {;全角の場合
				num1(1) = peek(strings1,count1_read + 1)
				count1_read + 2
				Cell1_strings1(count2_read,0) = 2
				Cell1_strings1(count2_read,1) = num1(0)
				Cell1_strings1(count2_read,2) = num1(1)
			}
			count2_read ++
		loop
		CharNum_strings1 = count2_read
	;＜ 取り出す ＞
		if Index_start >= CharNum_strings1 : return ""
		count1_written = 0	;「result」変数に書き込んだバイト数
		sdim result,CharNum_get*2
		repeat limit(CharNum_get,0,CharNum_strings1 - Index_start)
			if Cell1_strings1(Index_start + cnt,0) = 0 : break
			if Cell1_strings1(Index_start + cnt,0) = 1 {;半角の場合
				poke result,count1_written,Cell1_strings1(Index_start + cnt,1)
				count1_written ++
			} else {;全角の場合
				poke result,count1_written,Cell1_strings1(Index_start + cnt,1)
				poke result,count1_written+1,Cell1_strings1(Index_start + cnt,2)
				count1_written + 2
			}
		loop
	return result
#global

#module N_M_CharStr7
	;秒で与えられた数値から0:00:00 (時間:分:秒) を作り出す。「分」,「秒」は十の位を必ず表示するが、「時」は桁が変動する。
	
	;[書式]
	;
	;	buf = CnvSec2HMS(P1)
	;
	;	P1	:	秒。整数値。
	
	;戻り値は文字列型。例えば、3682 を渡したら、"1:01:22"が戻る。
	
#defcfunc CnvSec2HMS int t
	t1 = t/3600	;時
	t2 = t\3600
	t3 = t2/60	;分
	t4 = t\60	;秒
	if t3 >= 10 : buf1 = ""+t3+"" : else : buf1 = "0"+t3+""
	if t4 >= 10 : buf2 = ""+t4+"" : else : buf2 = "0"+t4+""
	return ""+t1+":"+buf1+":"+buf2+""
#global

#module N_M_CharStr8
;	strrep命令のhsp3dish用代替。書式・振舞はstrrepと同じ。
#deffunc DishStrrep var TEXT ,str target ,str rookie
	strlen_target = strlen(target)
	strlen_rookie = strlen(rookie)
	strlen_TEXT = strlen(TEXT)
	Δstrlen = strlen_rookie-strlen_target
	;＜ ターゲットのアドレス表を作る ＞
		cnt_replaced = 0
		frontier = 0
		repeat
			k = instr(TEXT,frontier,target)
			if k = -1 : break
			address(cnt_replaced) = frontier+k
			frontier += k+strlen_target
			cnt_replaced ++
		loop
	if cnt_replaced = 0 : return 0
	;＜ 置き換え ＞
		address(cnt_replaced) = strlen_TEXT
		TEXT2 = TEXT
		sdim TEXT,strlen_TEXT + Δstrlen*cnt_replaced
		TEXT += strmid(TEXT2,0,address(0))
		repeat cnt_replaced
			TEXT += rookie + strmid(TEXT2,address(cnt)+strlen_target,address(cnt+1)-address(cnt)-strlen_target)
		loop
	return cnt_replaced
#global

#module N_M_CharStr9
;	大文字・小文字を区別せずに文字列が一致するかどうか調べる。

;[書式]
;
;	val = IsEqualStrings(A,B)
;
;	A,B : 比較する文字列が格納された文字列(or文字列型変数)

;	AとBが一致するなら1が、一致しないなら0が返る。
#defcfunc IsEqualStrings str A_org,str B_org
	A = A_org : B = B_org
	strlen_A = strlen(A)
	strlen_B = strlen(B)
	if strlen_A ! strlen_B : return 0
	result = 1
	repeat strlen_A
		x = peek(A,cnt) : y = peek(B,cnt)
		if x ! y {
			if abs(x-y) ! 32 : result = 0 : break
			if (((65<=x)&(x<=90))|((97<=x)&(x<=122))) & (((65<=y)&(y<=90))|((97<=y)&(y<=122))) : else : result = 0 : break
		}
	loop
	return result
#global

#module N_M_CharStr10
;	文字列中の分割された要素について、それぞれの両端の連続する半角スペースを除去する。
;	例えば「apple juice ,ball , a cup of tea」という文字列を「apple juice,ball,a cup of tea」にしたりできる。
;	コマンドのパラメータ処理の前準備などに。

;	[書式]
;
;		MCS_OmitSpaceBetweenElements var,str
;
;		var : 操作対象の文字列が格納された変数
;		str : 区切り用文字列

#deffunc MCS_OmitSpaceBetweenElements var TEXT ,str char_division
	TEXT2 = TEXT + char_division
	sdim TEXT,strlen(TEXT)
	len = strlen(char_division)
	index_frontier = 0
	repeat
		k = instr(TEXT2,index_frontier,char_division)
		if k = -1 : break
		str1 = strmid(TEXT2,index_frontier,k)
		;＜ 前と後のスペースを除去 ＞
			k = strlen(str1)
			repeat k
				if peek(str1,cnt) ! ' ' : x = cnt : break
			loop
			repeat k,1
				if peek(str1,k-cnt) ! ' ' : y = k-cnt : break
			loop
		TEXT += strmid(str1,x,y-x+1) + char_division
		index_frontier += k+len
	loop
	memset TEXT,0,len,strlen(TEXT)-len	;最後の余分な区切り文字を削除
	return
#global


#module N_M_CharStr11
;	文字列から分割された要素を代入
;	区切り用文字列で分割された部分を順に一次元配列変数に代入していく。

;	[書式]
;
;		MCS_SplitChar var ,str ,array ,int
;
;		var		:	元の文字列が代入された変数
;		str		:	区切り用文字列
;		array	:	分割された要素が代入される変数 (※然るべき要素分をあらかじめ確保しておくと高速で処理できる)
;		int		:	代入を始める配列の要素番号(≧0)

;	分割された数がstatに格納される

#deffunc MCS_SplitChar var TEXT ,str char_division ,array POUCH ,int idx_start_POUCH
	TEXT += char_division	;処理の都合上、1つ付ける。
	L1 = strlen(char_division)
	frontier_TEXT = 0
	frontier_POUCH = idx_start_POUCH
	divnum = 0
	repeat
		k1 = instr(TEXT,frontier_TEXT,char_division) : if k1 = -1 : break
		POUCH(frontier_POUCH) = strmid(TEXT,frontier_TEXT,k1) : frontier_POUCH ++
		frontier_TEXT += k1+L1
		divnum ++
	loop
	memset TEXT,0,L1,strlen(TEXT)-L1
	return divnum
#global

#module N_M_CharStr12
;	文字列中のキーワードの個数を調べる

;	[書式]
;
;		val = MCS_NumStrKwd(var,str,opt)
;
;		var	:	検索される文字列が格納されている文字列型変数名
;		str	:	キーワード
;		opt	:	オプション。(0,1)=(モード0,モード1)
;					＜ モード0 ＞	:	潜んでいる文字列も数える。この場合、例えば「AAA」の中に「AA」は2個あると見なされる。
;					＜ モード1 ＞	:	潜んでいる文字列を数えない。
#defcfunc MCS_NumStrKwd var target ,str kwd ,int opt
	L1 = strlen(kwd)
	frontier = 0
	cnt_found = 0
	repeat
		x = instr(target,frontier,kwd)
		if x = -1 : break
		if opt = 0 {
			frontier += x+1
		} else {
			frontier += x+L1
		}
		cnt_found ++
	loop
	return cnt_found
#global

#module N_M_CharStr13
;	コメントの削除
;	コメント開始記号から行末までを削除する

;	[書式]
;
;		MCS_DelComment var,str
;
;		var	:	操作対象の文字列が格納された文字列型変数名
;		str	:	コメント開始記号(文字列)

;	削除されたコメントの数がstatに保存される。

#deffunc MCS_DelComment var TEXT,str Sign_Comment
	cnt_del = 0
	notesel TEXT
	repeat notemax
		noteget str1,cnt
		k = instr(str1,0,Sign_Comment)
		if k ! -1 : noteadd strmid(str1,0,k),cnt,1 : cnt_del ++
	loop
	return cnt_del
#global