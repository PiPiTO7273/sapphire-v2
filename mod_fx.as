#module mv_mfx_VarPkg var,name,isArray,dimension,len	// "moduleVariable_mfx_VariablePackage" 変数パッケージ
	/*
		var			: 変数本体
		name		: 変数名
		isArray		: 配列かどうか。(0,1)=(でない,である)
		dimension	: 次元数
		len			: 長さ。int[4]。要素0～3には各次元方向の長さを格納。
	*/
	#deffunc local modDetect
		return
	
	#modinit str name_, int isArray_, int dimension_, array len_
		/*
			変数初期化
			エラーチェック無し
		*/
		name = name_
		isArray = isArray_
		dimension = dimension_
		dim len,4 : memcpy len,len_,16
		if isArray {
			switch dimension
				case 1
					ddim var,len
					swbreak
				case 2
					ddim var,len,len(1)
					swbreak
				case 3
					ddim var,len,len(1),len(2)
					swbreak
				case 4
					ddim var,len,len(1),len(2),len(3)
			swend
		} else {
			var = 0.0
		}
		return
	
	#modcfunc local get_name	//名前読み出し
		return name
	
	#modcfunc local get_isArray	//配列かどうか
		return isArray
	
	#modcfunc local get_dimension	//次元数
		return dimension
	
	#modcfunc local getVal array idx, var errCode	//読み出し
		/*
			内容読み出し
			
			idx			: 指定インデックス。int[4]。例えば要素(1,2)が欲しければ、idx = 1,2
			errCode		: エラーコードを受け取るint型変数。
			       		  エラーコードの内容 : (0,1) = (正常,配列要素が無効)
	
			< 戻り値 >
			
				正常終了	→ 所望の値
				エラー		→ 0.0
		*/
		errCode = 0
		if isArray {	//配列なら
			/* 要素チェック */
			repeat dimension
				if len(cnt) <= idx(cnt) : errCode = 1 : break
			loop
			if errCode : return 0.0
		
			switch dimension
				case 1
					return var(idx(0))
					swbreak
				case 2
					return var(idx(0),idx(1))
					swbreak
				case 3
					return var(idx(0),idx(1),idx(2))
					swbreak
				case 4
					return var(idx(0),idx(1),idx(2),idx(3))
					swbreak
			swend
		} else {
			return var
		}
	
	#modfunc local setVal double val, array idx	// 代入
		/*
			代入
	
			val			: 値
			idx			: 代入先インデックス。int[4]。例えば要素(1,2)に代入したければ、idx = 1,2
	
			< 実行後のstatの値 >
	
				(0,1) = (正常終了,配列要素が無効)
		*/
		flg_err = 0
		if isArray {	//配列なら
			/* 要素チェック */
			repeat dimension
				if (idx(cnt) < 0)|(len(cnt) <= idx(cnt)) : flg_err = 1 : break
			loop
			if flg_err : return 1
		
			switch dimension
				case 1
					var(idx(0)) = val
					swbreak
				case 2
					var(idx(0),idx(1)) = val
					swbreak
				case 3
					rvar(idx(0),idx(1),idx(2)) = val
					swbreak
				case 4
					var(idx(0),idx(1),idx(2),idx(3)) = val
			swend
		} else {
			var = val
		}
		return 0
#global

#module mv_mfx_FmlPkg RPNTIVC,RPNCC,len	// "moduleVariable_mfx_FormulaPackage" 数式パッケージ
	/*
		RPNTIVC	: 逆ポーランド記法トークン識別値コード
		RPNCC	: 逆ポーランド記法定数コード
		len		: 計算コードの長さ
	*/
	#modinit array RPNTIVC_, array RPNCC_, int len_	//数式パッケージ作成
		/*
			数式パッケージ作成
			エラーチェック無し
		*/
		len = len_
		dim RPNTIVC,len : memcpy RPNTIVC,RPNTIVC_,4*len
		ddim RPNCC,len : memcpy RPNCC,RPNCC_,8*len
		return
	
	#modfunc local getCALCODE array RPNTIVC_, array RPNCC_, var len_	// 計算コード取得
		len_ = len
		dup RPNTIVC_,RPNTIVC : dup RPNCC_,RPNCC
		return
#global

#module mod_fx_share	//共有名前空間

	#define MAX_LEN_TOKEN	127
	#define MAX_NUM_VARS	9000

	#deffunc mfx_init	//モジュール初期化
		modinit@mod_fx_calc
		
		dimtype varReg,vartype("struct"),1	// "variableRegistry" 変数レジストリ
		num_vars = 0	//登録されている変数の数
		dimtype fmlReg,vartype("struct"),1	// "formulaRegistry" 数式レジストリ
		num_fmls = 0	//登録されている数式の数
		/* 演算子名表,演算子トークン識別値表 */
			#define num_nameVartn_oprtr	26	//演算子名の数
			sdim ONTBL,num_nameVartn_oprtr	// "operatorNameTable"
			dim OTIVTBL,num_nameVartn_oprtr	// "operatorTokenIdentifierValueTable"
			ONTBL(0) = "("		: OTIVTBL(0) = 100
			ONTBL(1) = "["		: OTIVTBL(1) = 100
			ONTBL(2) = "{"		: OTIVTBL(2) = 100
			ONTBL(3) = ")"		: OTIVTBL(3) = 101
			ONTBL(4) = "]"		: OTIVTBL(4) = 101
			ONTBL(5) = "}"		: OTIVTBL(5) = 101
			ONTBL(6) = ","		: OTIVTBL(6) = 120
			ONTBL(7) = "|"		: OTIVTBL(7) = 140
			ONTBL(8) = "^"		: OTIVTBL(8) = 160
			ONTBL(9) = "&"		: OTIVTBL(9) = 180
			ONTBL(10) = "="		: OTIVTBL(10) = 200
			ONTBL(11) = "=="	: OTIVTBL(11) = 200
			ONTBL(12) = "!"		: OTIVTBL(12) = 201
			ONTBL(13) = "!="	: OTIVTBL(13) = 201
			ONTBL(14) = "<"		: OTIVTBL(14) = 220
			ONTBL(15) = "<="	: OTIVTBL(15) = 221
			ONTBL(16) = ">"		: OTIVTBL(16) = 222
			ONTBL(17) = ">="	: OTIVTBL(17) = 223
			ONTBL(18) = "<<"	: OTIVTBL(18) = 240
			ONTBL(19) = ">>"	: OTIVTBL(19) = 241
			ONTBL(20) = "+"		: OTIVTBL(20) = 280
			ONTBL(21) = "-"		: OTIVTBL(21) = 281
			ONTBL(22) = "*"		: OTIVTBL(22) = 300
			ONTBL(23) = "/"		: OTIVTBL(23) = 301
			ONTBL(24) = "%"		: OTIVTBL(24) = 302
			ONTBL(25) = "\\"	: OTIVTBL(25) = 302
		/* 数学定数名表,数学定数値表,数学定数トークン識別値表 */
			#define num_nameVartn_mthCnst	2	//数学定数名の数
			sdim MCNTBL,num_nameVartn_mthCnst	// "mathConstantNameTable"
			dim MCTIVTBL,num_nameVartn_mthCnst	// "mathConstantTokenIdentifierValueTable"
			ddim MCVTBL,num_nameVartn_mthCnst	// "mathConstantValueTable"
			MCNTBL(0) = "m_pi"	: MCTIVTBL(0) = 20000	: MCVTBL(0) = 3.141592653589793
			MCNTBL(1) = "m_e"	: MCTIVTBL(1) = 20001	: MCVTBL(1) = 2.718281828459045
		/* 数学関数名表,数学関数トークン識別値表,数学関数パラメータ個数表 */
			#define num_nameVartn_mthFnc	28	//数学関数名の数
			sdim MFNTBL,num_nameVartn_mthFnc	// "mathFunctionNameTable"
			dim MFTIVTBL,num_nameVartn_mthFnc	// "mathFunctionTokenIdentifierValueTable"
			dim MFPRMNTBL,num_nameVartn_mthFnc	// "mathFunctionParameterNumberTable"
			MFNTBL(0) = "sin"			: MFTIVTBL(0) = 10000	: MFPRMNTBL(0) = 1
			MFNTBL(1) = "cos"			: MFTIVTBL(1) = 10001	: MFPRMNTBL(1) = 1
			MFNTBL(2) = "tan"			: MFTIVTBL(2) = 10002	: MFPRMNTBL(2) = 1
			MFNTBL(3) = "asin"			: MFTIVTBL(3) = 10010	: MFPRMNTBL(3) = 1
			MFNTBL(4) = "acos"			: MFTIVTBL(4) = 10011	: MFPRMNTBL(4) = 1
			MFNTBL(5) = "atan"			: MFTIVTBL(5) = 10012	: MFPRMNTBL(5) = 2
			MFNTBL(6) = "sinh"			: MFTIVTBL(6) = 10020	: MFPRMNTBL(6) = 1
			MFNTBL(7) = "cosh"			: MFTIVTBL(7) = 10021	: MFPRMNTBL(7) = 1
			MFNTBL(8) = "tanh"			: MFTIVTBL(8) = 10022	: MFPRMNTBL(8) = 1
			MFNTBL(9) = "asinh"			: MFTIVTBL(9) = 10030	: MFPRMNTBL(9) = 1
			MFNTBL(10) = "acosh"		: MFTIVTBL(10) = 10031	: MFPRMNTBL(10) = 1
			MFNTBL(11) = "atanh"		: MFTIVTBL(11) = 10032	: MFPRMNTBL(11) = 1
			MFNTBL(12) = "sqrt"			: MFTIVTBL(12) = 10100	: MFPRMNTBL(12) = 1
			MFNTBL(13) = "exp"			: MFTIVTBL(13) = 10200	: MFPRMNTBL(13) = 1
			MFNTBL(14) = "pow"			: MFTIVTBL(14) = 10220	: MFPRMNTBL(14) = 2
			MFNTBL(15) = "log"			: MFTIVTBL(15) = 10300	: MFPRMNTBL(15) = 2
			MFNTBL(16) = "ln"			: MFTIVTBL(16) = 10320	: MFPRMNTBL(16) = 1
			MFNTBL(17) = "log10"		: MFTIVTBL(17) = 10330	: MFPRMNTBL(17) = 1
			MFNTBL(18) = "limit"		: MFTIVTBL(18) = 10400	: MFPRMNTBL(18) = 3
			MFNTBL(19) = "abs"			: MFTIVTBL(19) = 10600	: MFPRMNTBL(19) = 1
			MFNTBL(20) = "floor"		: MFTIVTBL(20) = 10700	: MFPRMNTBL(20) = 1
			MFNTBL(21) = "round"		: MFTIVTBL(21) = 10720	: MFPRMNTBL(21) = 1
			MFNTBL(22) = "ceil"			: MFTIVTBL(22) = 10740	: MFPRMNTBL(22) = 1
			MFNTBL(23) = "int"			: MFTIVTBL(23) = 10760	: MFPRMNTBL(23) = 1
			MFNTBL(24) = "sgn"			: MFTIVTBL(24) = 10800	: MFPRMNTBL(24) = 1
			MFNTBL(25) = "factorical"	: MFTIVTBL(25) = 10900	: MFPRMNTBL(25) = 1
			MFNTBL(26) = "deg2rad"		: MFTIVTBL(26) = 11000	: MFPRMNTBL(26) = 1
			MFNTBL(27) = "rad2deg"		: MFTIVTBL(27) = 11001	: MFPRMNTBL(27) = 1
	
		/* 選択されている変数の情報 */
			id_selVar = -1	//ID。(-1なら未選択)
		
		/* 選択されている数式の情報 */
			id_selFml = -1	//ID。(-1なら未選択)
			RPNTIVC_sel = 0 : RPNCC_sel = 0.0	//計算コード
			len_CALCODE_sel = 0	//長さ
			
		return
	
	#deffunc mfx_newVar str name_, int isArray, int dimension, array len	// "mfx_newVariable" 変数作成
		/*
			変数作成
	
			name		: 名前
			isArray		: 配列かどうか。(0,1)=(でない,である)
			dimension	: 次元数。例えば2次元配列を定義したいなら2とする。
			len			: 長さ。int[4]。要素0～3には各次元方向の長さを格納。例えば [3,4] 確保したいなら len = 3,4,0.0 とする。
	
			< 実行後のstatの値 >
	
				(-4,-3,-2,-1,other) = (引数不正,変数名不正,既存変数名と衝突,登録数限界超過,登録先ID)
		*/
		RC = 0
		name = name_
		if num_vars = MAX_NUM_VARS : return -1	//登録数限界超過
		if name = "" | strlen(name) > MAX_LEN_TOKEN : return -3
		if (isArray != 0)&(isArray != 1) : return -4
		if isArray {	//配列なら
			if (dimension < 1)|(dimension > 4) : return -4
			if length(len) < 4 : return -4
			repeat dimension
				if len(cnt) < 1 : RC = -4 : break
			loop
			if RC : return -4
		}
		
		/* 変数名チェック */
			if name = "" : return -3
			/* 先頭が半角数字でないか確認 */
				if int(name) : return -3
				if peek(name,0) = 48 : return -3	//先頭が0なら
			/* 括弧,2項演算子と同じ名前が含まれていないか確認 */
				if instr(name,0,"(") != -1 : return -3
				if instr(name,0,")") != -1 : return -3
				if instr(name,0,"[") != -1 : return -3
				if instr(name,0,"]") != -1 : return -3
				if instr(name,0,"{") != -1 : return -3
				if instr(name,0,"}") != -1 : return -3
				if instr(name,0,"*") != -1 : return -3
				if instr(name,0,"/") != -1 : return -3
				if instr(name,0,"%") != -1 : return -3
				if instr(name,0,"\\") != -1 : return -3
				if instr(name,0,"+") != -1 : return -3
				if instr(name,0,"-") != -1 : return -3
				if instr(name,0,"<") != -1 : return -3
				if instr(name,0,">") != -1 : return -3
				if instr(name,0,"=") != -1 : return -3
				if instr(name,0,"!") != -1 : return -3
				if instr(name,0,"&") != -1 : return -3
				if instr(name,0,"^") != -1 : return -3
				if instr(name,0,"|") != -1 : return -3
				if instr(name,0,",") != -1 : return -3
			/* 予約語と一致していないか確認 */
				/* 数学定数名 */
					repeat num_nameVartn_mthCnst
						if name = MCNTBL(cnt) : RC = -3 : break
					loop
					if RC : return -3
				/* 数学関数名 */
					repeat num_nameVartn_mthFnc
						if name = MFNTBL(cnt) : RC = -3 : break
					loop
					if RC : return -3
			/* 既存の変数と同名でないか確認 */
				foreach varReg
					if name = get_name@mv_mfx_VarPkg(varReg(cnt)) : RC = -2 : break
				loop
				if RC : return -2
		/* 登録先IDを算出 */
			repeat
				if varuse(varReg(cnt)) = 0 : id = cnt : break
			loop
		
		newmod varReg,mv_mfx_VarPkg, name,isArray,dimension,len
		num_vars ++
		return id
	
	#deffunc mfx_selVar_name str name_	// "mfx_selectVar" 操作対象変数の選択
		/*
			操作対象変数を名前で指定する
			
			name_	: 変数名
	
			< 実行後のstatの値 >
	
				(-1,other) : (指定された変数が存在しない,選択された変数のID)
		*/
		RC = -1
		foreach varReg
			if name_ = get_name@mv_mfx_VarPkg(varReg(cnt)) {
				id_selVar = cnt
				RC = cnt
				break
			}
		loop
		return RC
	
	#deffunc mfx_selVar_id int id_	// "mod_fx_selectVar_id" 操作対象変数の選択
		/*
			操作対象変数をIDで指定する。
			mfx_selVar_name よりも高速。
			
			id	: ID
	
			< 実行後のstatの値 >
	
				(0,1) : (正常終了,指定された変数が存在しない)
		*/
		if id_ < 0 : return 1
		if varuse(varReg(id_)) {
			id_selVar = id_
			return 0
		} else : return 1
	
	#defcfunc mfx_getSelVarName	// "mod_fx_getSelectedVariableName" 選択されている変数の名前を取得
		/*
			< 戻り値 >
	
				(空文字列,other) = (変数未選択,変数名)
		*/
		if id_selVar = -1 : return ""
		return get_name@mv_mfx_VarPkg(varReg(id_selVar))
	
	#defcfunc mfx_getSelVarID	// "mod_fx_getSelectedVariableID" 選択されている変数のIDを取得
		/*
			< 戻り値 >
	
				(-1,other) = (変数未選択,変数のID)
		*/
		return id_selVar
	
	#deffunc mfx_delVar	// "mfx_deleteVariable" 変数削除
		/*
			操作対象として選択されている変数を削除する
	
			< 実行後のstatの値 >
	
				(0,1) = (正常終了,変数未選択)
		*/
		if id_selVar = -1 : return 1
		delmod varReg(id_selVar)
		id_selVar = -1
		num_vars --
		return 0
		
	#deffunc mfx_subst double val, array idx	// "mfx_substitute" 変数への代入
		/*
			操作対象として選択されている変数に値を代入する
	
			val		: 値
			idx		: 代入先インデックス。int[4]。例えば要素(1,2)に代入したければ、idx = 1,2,0,0 とする。
	
			< 実行後のstatの値 >
	
				(0,1,2,3) = (正常終了,変数未選択,配列要素が無効,引数不正)
		*/
		if id_selVar = -1 : return 1
		if length(idx) < 4 : return 3
		setVal@mv_mfx_VarPkg varReg(id_selVar), val,idx
		if stat : return 2 : else : return 0
	
	#deffunc mfx_newFml str strFml_, array errCode	// "mod_fx_newFormula" 数式登録
		/*
			数式登録を登録する
	
			strFml	: 文字列数式
			errCode	: エラーコードを受け取るint型変数。errCode = 0,0 で初期化しておくべき。
			       	  詳細は design.txt を参照。
	
			< 実行後のstatの値 >
	
				(-1,other) : (エラー,登録先ID)
		*/
		strFml = strFml_
		RPNTIVC = 0 : RPNCC = 0.0	//未初期化変数警告回避
		mfx_cmp@mod_fx_cmp strFml,RPNTIVC,RPNCC,errCode
		if stat = -1 : return -1
		len = stat
		/* 登録先IDを算出 */
			repeat
				if varuse(fmlReg(cnt)) = 0 : id = cnt : break
			loop
	
		newmod fmlReg,mv_mfx_FmlPkg,RPNTIVC,RPNCC,len	//登録
		return id
	
	#deffunc mfx_selFml int id_	// "mod_fx_selectFormula" 数式を選択
		/*
			数式を選択する
	
			id_ : ID
	
			< 実行後のstatの値 >
	
				(0,1) : (正常終了,指定された数式が存在しない)
		*/
		if id_ < 0 : return 1
		if varuse(fmlReg(id_)) {
			id_selFml = id_
			getCALCODE@mv_mfx_FmlPkg fmlReg(id_), RPNTIVC_sel,RPNCC_sel,len_CALCODE_sel
			return 0
		} else {
			return 1
		}
	
	#defcfunc mfx_get_id_selFml	//選択されている数式のIDの取得
		/*
			選択されている数式のIDを返す
	
			< 戻り値 >
	
				(-1,other) = (数式未選択,数式のID)
		*/
		return id_selFml
	
	#deffunc mfx_delFml	// "mod_fx_deleteFormula" 数式削除
		/*
			選択されている数式を削除する
	
			< 実行後のstatの値 >
	
				(0,1) = (正常終了,数式未選択)
		*/
		if id_selFml = -1 : return 1
		delmod(fmlReg(id_selFml))
		id_selFml = -1
		return 0
#global

#module mod_fx_cmp	// "mod_fx_compile" コンパイル

	#define MAX_LEN_TOKEN	MAX_LEN_TOKEN@mod_fx_share
	#define varReg			varReg@mod_fx_share
	#define num_nameVartn_oprtr	num_nameVartn_oprtr@mod_fx_share
	#define ONTBL				ONTBL@mod_fx_share
	#define OTIVTBL				OTIVTBL@mod_fx_share
	#define num_nameVartn_mthCnst	num_nameVartn_mthCnst@mod_fx_share
	#define MCNTBL					MCNTBL@mod_fx_share
	#define MCVTBL					MCVTBL@mod_fx_share
	#define num_nameVartn_mthFnc	num_nameVartn_mthFnc@mod_fx_share
	#define MFNTBL					MFNTBL@mod_fx_share
	#define MFTIVTBL				MFTIVTBL@mod_fx_share
	#define MFPRMNTBL				MFPRMNTBL@mod_fx_share

	#deffunc local mfx_cmp str strFml_, array RPNTIVC, array RPNCC, array errCode
		/*
			コンパイル
	
			strFml	: 文字列数式
			RPNTIVC	: RPNTIVC
			RPNCC	: RPNCC
			errCode	: エラーコードを受け取るint型変数。errCode = 0,0 で初期化しておくべき。
			       	  詳細は design.txt を参照。
	
			< 実行後のstatの値 >
	
				(-1,other) = (エラー,計算コードの長さ)
		*/
		strFml = strFml_
		strrep strFml," ",""	//半角スペース削除
		len_strFml = strlen(strFml)
		if len_strFml = 0 {
			errCode = 0,0
			return -1
		}
		flg_error = 0
		/* phase1 : TCC生成 */
			/*
				< 方針 >
					( ) * / % \ + - << >> < <= > >= = == ! != & ^ | , で区切る。
					これらを「区切りキーワード」と呼ぶ。
			*/
			sdim TCC,MAX_LEN_TOKEN,len_strFml
			TCCStkCnt = 0	//TCCスタックカウンタ
			frontier = 0	//strFmlを読み進めたバイト数。フロンティア。
			repeat
				/* 次の区切りキーワードのインデックスと長さを調べる */
					idx_nxtDivKwd = -1	//次の区切りキーワードのインデックス
					frontier_prev = frontier
					repeat
						char = peek(strFml,frontier) : frontier ++
						if (char = '(')|(char = ')')|(char = '*')|(char = '/')|(char = '%')|(char = '\\')|(char = '+')|(char = '-')|(char = '&')|(char = '^')|(char = '|')|(char = ',') {	//区切りキーワードが確定
							idx_nxtDivKwd = frontier-1
							len_nxtDivKwd = 1
							break
						}
						if (char = '<')|(char = '>')|(char = '=')|(char = '!') {	//<,>,=,!の場合はまだ確定しない
							char2 = peek(strFml,frontier) : frontier ++	//もう1文字読めば確定する
							if ((char = '<')&(char2 = '<'))|((char = '<')&(char2 = '='))|((char = '>')&(char2 = '>'))|((char = '>')&(char2 = '='))|((char = '=')&(char2 = '='))|((char = '!')&(char2 = '=')) {	//2文字のキーワードなら
								idx_nxtDivKwd = frontier-2
								len_nxtDivKwd = 2
								break
							} else {	//1文字のキーワードなら
								frontier --	//読み過ぎた分だけ戻る
								idx_nxtDivKwd = frontier-1
								len_nxtDivKwd = 1
								break
							}
						}
						if frontier = len_strFml : break
					loop
				/* 切り出し */
					if idx_nxtDivKwd >= 0 {	//区切りキーワードが見つかったなら
						if idx_nxtDivKwd > frontier_prev {	//区切りキーワードと前世代のフロンティアの間に別のトークンがあるなら
							TCC(TCCStkCnt) = strmid(strFml,frontier_prev,idx_nxtDivKwd-frontier_prev) : TCCStkCnt ++
						}
						TCC(TCCStkCnt) = strmid(strFml,idx_nxtDivKwd,len_nxtDivKwd) : TCCStkCnt ++
					} else {	//区切りキーワードが見つからなかったなら
						TCC(TCCStkCnt) = strmid(strFml,frontier_prev,frontier-frontier_prev) : TCCStkCnt ++
					}
				
				if frontier = len_strFml : break	//読み尽くしたら終了
			loop
	
		
		/* phase2 : INTIVC,INCC生成 */
		/*
			数学定数はここで数値に置き換えられる。
		*/
			dim INTIVC,TCCStkCnt
			ddim INCC,TCCStkCnt
			repeat TCCStkCnt
				cnt0 = cnt
				token = TCC(cnt)
				flg_identified = 0
				/* 演算子か? */
					repeat num_nameVartn_oprtr
						if token = ONTBL(cnt) {
							INTIVC(cnt0) = OTIVTBL(cnt)
							flg_identified = 1 : break
						}
					loop
					if flg_identified : continue
				/* 数学定数か? */
					repeat num_nameVartn_mthCnst
						if token = MCNTBL(cnt) {
							INTIVC(cnt0) = 10
							INCC(cnt0) = MCVTBL(cnt)
							flg_identified = 1 : break
						}
					loop
					if flg_identified : continue
				/* 数学関数か? */
					repeat num_nameVartn_mthFnc
						if token = MFNTBL(cnt) {
							INTIVC(cnt0) = MFTIVTBL(cnt)
							flg_identified = 1 : break
						}
					loop
					if flg_identified : continue
				/* 変数か? */
					foreach varReg
						if token = get_name@mv_mfx_VarPkg(varReg(cnt)) {
							INTIVC(cnt0) = 1000+cnt
							flg_identified = 1 : break
						}
					loop
					if flg_identified : continue
				/* 数値か? */
					//+ -は含まれていないから先頭が0～9のいずれかであるかどうかが判断の鍵。
					char = peek(token,0)
					if (48 <= char)&(char <= 57) {	//先頭が0～9
						if strlen(token) = 1 {	//1文字
							flg_identified = 1
						} else {	//2文字以上
							/* .が1個以下であるかどうか調べる */
							token2 = token
							strrep token2,".",""
							if stat <= 1 : flg_identified = 1
						}
						if flg_identified {
							INTIVC(cnt) = 10
							INCC(cnt) = double(token)
							continue
						}
					}
				/* 既知でない */
					flg_error = 1
					errCode = cnt,10
					break
			loop
			if flg_error : return -1
	
		
		/* phase3 : INTIVC検査I */
			/*
				< チェック項目 >
					・深さ
					・隣接トークン間の整合性。あるトークンがその右隣のトークンと矛盾しないか調べる。
			*/
			depth = 0
			/* 最初にあってはならないトークン */
				tiv = INTIVC(0)
				if 101<=tiv & tiv<=241 | 300<=tiv & tiv<=302 : errCode = 0,15 : return -1	// ) , | ^ & == = != ! < <= > >= << >> + - * / % \ があってはならない
			/* 右隣のトークンとの整合性チェック */
				tiv_next = INTIVC(0)
				repeat TCCStkCnt-1
					tiv = tiv_next
					tiv_next = INTIVC(cnt+1)
					if tiv=10 {	//数値なら
						if tiv_next<101 | 302<tiv_next : errCode = cnt+1,15 : flg_error = 1 : break	//右隣は ) , | ^ & == != < <= > >= << >> + - * / % でなければならない
						continue
					}
					if tiv=100 {	// ( なら
						depth ++
						if 101<=tiv_next & tiv_next<=241 | 300<=tiv_next & tiv_next<=302 : errCode = cnt+1,15 : flg_error = 1 : break	//右隣が ) , | ^ & == != < <= > >= << >> * / % であってはならない
						continue
					}
					if tiv=101 {	// ) なら
						depth --
						if depth < 0 : errCode = cnt,21 : flg_error = 1 : break	//深さが負であってはならない
						if tiv_next<101 | 302<tiv_next : errCode = cnt+1,15 : flg_error = 1 : break	//右隣は ) , | ^ & == != < <= > >= << >> + - * / % でなければならない
						continue
					}
					if 120<=tiv & tiv<=241 | 300<=tiv & tiv<=302 {	// , | ^ & == != < <= > >= << >> * / % なら
						if 101<=tiv_next & tiv_next<=241 | 300<=tiv_next & tiv_next<=302 : errCode = cnt+1,15 : flg_error = 1 : break	// 右隣が ) , | ^ & == != < <= > >= << >> * / % であってはならない
						continue
					}
					if tiv=280 | tiv=281 {	//+ - なら
						if 101<=tiv_next & tiv_next<=302 : errCode = cnt+1,15 : flg_error = 1 : break	//右隣が ) , | ^ & == != < <= > >= << >> + - * / % であってはならない
						continue
					}
					if 1000<=tiv & tiv<=9999 {	//変数名なら
						if get_isArray@mv_mfx_VarPkg(varReg(tiv-1000)) {	//配列なら
							if tiv_next != 100 : errCode = cnt,40 : flg_error = 1 : break	//右隣は ( でなければならない
						} else {	//配列でないなら
							if tiv_next=100 : errCode = cnt,41 : flg_error = 1 : break	//右隣は ( であってはならない
							if tiv_next<101 | 302<tiv_next : errCode = cnt+1,15 : flg_error = 1 : break	//右隣は ) , | ^ & == != < <= > >= << >> + - * / % でなければならない
						}
						continue
					}
					if 10000<=tiv & tiv<=11001 {	//関数名なら
						if tiv_next != 100 : errCode = cnt,30 : flg_error = 1 : break	//右隣は ( でなければならない
					}
				loop
				if flg_error : return -1
			/* 最後にあってはならないトークン */
				tiv = INTIVC(TCCStkCnt-1)
				if tiv=100 | 120<=tiv & tiv<=302 : errCode = TCCStkCnt-1,16 : return -1	//( , | ^ & == = != ! < <= > >= << >> + - * / % \ であってはならない
				if tiv = 101 : depth --
				if 10000<=tiv & tiv<=11001 : errCode = TCCStkCnt-1,30 : return -1	//関数名 であってはならない
				if 1000<=tiv & tiv<=9999 {	//変数名であるなら
					if get_isArray@mv_mfx_VarPkg(varReg(tiv-1000)) : errCode = TCCStkCnt-1,40 : flg_error = 1 : return -1	//配列であってはならない
				}
	
			if depth > 0 : errCode = TCCStkCnt-1,20 : return -1	// ( が閉じられていない
			if depth < 0 : errCode = TCCStkCnt-1,21 : return -1	// ) 過多
			
			
		/* phase4 : INTIVC検査II */
			/*
				< チェック項目 >
					・配列の添え字の個数の確認
					・関数のパラメータの個数の確認
					・無駄な,の検出
	
				< 方針 >
					配列/関数 直属の , にチェックを付けてゆき、全ての , にチェックが1つだけ付くことを確認する。
					同時に 添え字/パラメータ の個数のチェックも行う。
	
				< 留意 >
					次のことが phase3 により保証されている。
	
						・配列,関数の右隣には必ず(...)の構造がある。
						・1つの , は多くとも1つの主人(配列,関数)しか持たない。
			*/
			dim DCS,TCCStkCnt	// "DelimiterCheckSheet" , チェックシート。各 , の主人(配列,関数)の個数を記録する。要素の位置関係はINTIVCと対応する。
			repeat TCCStkCnt
				cnt0 = cnt
				tiv = INTIVC(cnt)
				if 1000<=tiv & tiv<=9999 {	//変数名なら
					if get_isArray@mv_mfx_VarPkg(varReg(tiv-1000)) {	//配列なら
						num_sbscrpt = 1	//添え字の数
						depth2 = 0
						repeat -1,cnt+2	// ( の次から読み始める
							tiv2 = INTIVC(cnt)
							if tiv2 = 100 : depth2 ++ : continue	// (
							if tiv2 = 101 {	// )
								depth2 --
								if depth2 < 0 : break	//()の中を読み終わった
								continue
							}
							if depth2 = 0 {	//深さが0なら
								if tiv2 = 120 {	// , なら
									DCS(cnt) ++
									num_sbscrpt ++
								}
							}
						loop
						dimension = get_dimension@mv_mfx_VarPkg(varReg(tiv-1000))	//添え字のあるべき個数
						if num_sbscrpt < dimension : errCode = cnt,42 : flg_error = 1 : break
						if num_sbscrpt > dimension : errCode = cnt,43 : flg_error = 1 : break
					}
					continue
				}
				if 10000<=tiv & tiv<=11001 {	//関数名なら
					num_prm = 1	//パラメータの個数
					depth2 = 0
					repeat -1,cnt+2	// ( の次から読み始める
						tiv2 = INTIVC(cnt)
						if tiv2 = 100 : depth2 ++ : continue	// (
						if tiv2 = 101 {	// )
							depth2 --
							if depth2 < 0 : break	//()の中を読み終わった
							continue
						}
						if depth2 = 0 {	//深さが0なら
							if tiv2 = 120 {	// , なら
								DCS(cnt) ++
								num_prm ++
							}
						}
					loop
					foreach MFTIVTBL	//パラメータの個数が正しいかどうかチェックする
						if tiv = MFTIVTBL(cnt) {
							if num_prm < MFPRMNTBL(cnt) : errCode = cnt0,30 : flg_error = 1 : break
							if num_prm > MFPRMNTBL(cnt) : errCode = cnt0,31 : flg_error = 1 : break
							break
						}
					loop
					if flg_error : break
				}
			loop
			if flg_error : return -1
			/* 無駄な , の検出 */
				foreach DCS
					if INTIVC(cnt)=120 & DCS(cnt)=0 : errCode = cnt,17 : flg_error = 1 : break
				loop
				if flg_error : return -1
	
		
		/* phase5 : RPNTIVC,RPNCC生成 */
			/*
					逆ポーランド記法への変換
					
				< 方針 >
				
					配列変数名,関数名も演算子と見なす。非配列変数名は演算子と見なさない。
					最初に数式全体を区間スタックに積み、スタックが空になるまで以下を繰り返す。
	
					スタックから1つ降ろしてFとする。
					F内で深さ0の位置にあって最も優先順位が低く、かつ最も右側にある演算子を探す。
					
					(1) そのような演算子があるなら
					    それをoとする。oより優先順位が低い演算子はF内に無いことに注意。
					    
				    	(A) oが ) なら
				    		このときFは (...) の形であるから ( ) を消去して中身をスタックに積む。

						(B) oが配列変数名または関数名なら
							このときFは o(...) の形である。
							(...)とoの位置を入れ替えて ( ) を消去して中身をスタックに積む。
	
						(C) oが * / % \ << >> < <= > >= == != & ^ | なら
							oの左側をL、右側をRとして L R o の順番に並び替えて LとRをスタックに積む。
	
						(D) oが + なら
							
							(a) oがFの左端である、或いはoの左隣が * / % なら
								oは不要なので消し、右側をスタックに積む。
									
							(b) (a)以外なら
								oの左側をL、右側をRとして L R o の順番に並び替えて LとRをスタックに積む。
	
						(E) oが - なら
						
							(a) oがFの左端であるなら
							
								(ｲ) oの右隣が数値なら
									両者を統合する。数値を-1倍して - の右側をスタックに積み、-を消去する。
									
								(ﾛ) oの右隣が数値でないなら
									oの左側に0を置けばシステマティックに扱える。
									そこでoの右側をRとして 0 R o の順番に並び替えてRをスタックに積む。
									
							(b) oの左隣が * / % なら
	
								(ｲ) oの右隣が数値なら
									両者を統合する。す数値を-1倍して -を消去してFをスタックに積み直す。
								
								(ﾛ) oの右隣が数値でないなら
									oの左隣の演算子をo2とする。oよりo2の方が後で実行されるべき状態であるから、
									o2の左側をL、右側をRとして L R o2 の順番に並び替えて LとRをスタックに積む。
	
							(c) (a)(b)以外なら
								oの左側をL、右側をRとして L R o の順番に並び替えて LとRをスタックに積む。
						
						(F) oが , なら
							oを消去し、左側と右側をスタックに積む。
					
					(2) そのような演算子が無いなら
						Fは確定である。これ以上変形の必要はない。
			*/
			dim RPNTIVC,TCCStkCnt*2 : memcpy RPNTIVC,INTIVC,4*TCCStkCnt	//(E)の(ﾛ)の場合に備えて2倍の領域を確保する
			ddim RPNCC,TCCStkCnt*2 : memcpy RPNCC,INCC,8*TCCStkCnt
			/* 区間スタックの初期化 */
				dim secStk,TCCStkCnt*2	//1区間を2要素で表す。左端トークン,右端トークンのインデックス の順に格納。
				secStk = 0,TCCStkCnt-1	//全体を積む
				secStkCnt = 1	//スタックカウンタ
			/* 並べ替え */
				/*
					( ) , の削除等でRPNTIVC中に生じる空白には0を入れる
				*/
				repeat
					if secStkCnt = 0 : break
					section = secStk(2*secStkCnt-2), secStk(2*secStkCnt-1) : secStkCnt --	//pop
					/* 深さ0の位置にあって最も優先順位が低く、かつ最も右側にある演算子oを探す*/
						idx_o = -1	//oのインデックス
						order_o = 0	//oの順位
						depth = 0
						repeat section(1)-section+1, section
							tiv = RPNTIVC(cnt)
							if tiv = 100 : depth ++ : continue
							if tiv = 101 {	// )
								depth --
								if depth = 0 {
									if order_o <= 1 : idx_o = cnt : order_o = 1
								}
								continue
							}
							if depth : continue
							if 1000<=tiv & tiv<=9999 {	//変数名
								if get_isArray@mv_mfx_VarPkg(varReg(tiv-1000)) {	//配列なら
									if order_o <= 2 : idx_o = cnt : order_o = 2
								}
								continue
							}
							if 10000<=tiv & tiv<=11001 {	//関数名
								if order_o <= 2 : idx_o = cnt : order_o = 2
								continue
							}
							if 300<=tiv & tiv<=302 {	// * / %
								if order_o <= 3 : idx_o = cnt : order_o = 3
								continue
							}
							if tiv=280 | tiv=281 {	// + -
								if order_o <= 4 : idx_o = cnt : order_o = 4
								continue
							}
							if tiv=240 | tiv=241 {	// << >>
								if order_o <= 5 : idx_o = cnt : order_o = 5
								continue
							}
							if 220<=tiv & tiv<=223 {	// < <= > >=
								if order_o <= 6 : idx_o = cnt : order_o = 6
								continue
							}
							if tiv=200 | tiv=201 {	// << >>
								if order_o <= 7 : idx_o = cnt : order_o = 7
								continue
							}
							if tiv=180 {	// &
								if order_o <= 8 : idx_o = cnt : order_o = 8
								continue
							}
							if tiv=160 {	// ^
								if order_o <= 9 : idx_o = cnt : order_o = 9
								continue
							}
							if tiv=140 {	// |
								if order_o <= 10 : idx_o = cnt : order_o = 10
								continue
							}
							if tiv=120 {	// ,
								if order_o <= 11 : idx_o = cnt : order_o = 11
							}
						loop
						
					if idx_o = -1 : continue
					/* 演算子の処理 */
						tiv = RPNTIVC(idx_o)
						if tiv = 101 {	// )
							RPNTIVC(section) = 0 : RPNTIVC(section(1)) = 0	// ( ) 消去
							secStk(2*secStkCnt) = section+1, section(1)-1 : secStkCnt ++	//push
							continue
						}
						if 1000<=tiv & tiv<=11001 {	//配列変数名,関数名
							/* 並べ替え */
								memcpy RPNTIVC,RPNTIVC, 4*(section(1)-idx_o), 4*idx_o, 4*idx_o+4 : RPNTIVC(section(1)) = tiv
								memcpy RPNCC,RPNCC, 8*(section(1)-idx_o), 8*idx_o, 8*idx_o+8
							RPNTIVC(idx_o) = 0 : RPNTIVC(section(1)-1) = 0	// ( ) 消去
							secStk(2*secStkCnt) = idx_o+1, section(1)-2 : secStkCnt ++	//push
							continue
						}
						if 140<=tiv & tiv<=241 | 300<=tiv & tiv<=302 {	// * / % \ << >> < <= > >= == != & ^ |
							/* 並べ替え */
								memcpy RPNTIVC,RPNTIVC, 4*(section(1)-idx_o), 4*idx_o, 4*idx_o+4 : RPNTIVC(section(1)) = tiv
								memcpy RPNCC,RPNCC, 8*(section(1)-idx_o), 8*idx_o, 8*idx_o+8
							secStk(2*secStkCnt) = section,idx_o-1, idx_o,section(1)-1 : secStkCnt += 2	//push
							continue
						}
						if tiv=280 {	// +
							flg_delPlus = 0	// + 消去フラグ
							if idx_o = section {	// + がFの左端なら
								flg_delPlus = 1
							} else {
								if 300<=RPNTIVC(idx_o-1) & RPNTIVC(idx_o-1)<=302 : flg_delPlus = 1	//左隣が * / % なら
							}
							if flg_delPlus {
								RPNTIVC(idx_o) = 0	// + 消去
								secStk(2*secStkCnt) = idx_o+1,section(1) : secStkCnt ++	//push
							} else {
								/* 並べ替え */
									memcpy RPNTIVC,RPNTIVC, 4*(section(1)-idx_o), 4*idx_o, 4*idx_o+4 : RPNTIVC(section(1)) = tiv
									memcpy RPNCC,RPNCC, 8*(section(1)-idx_o), 8*idx_o, 8*idx_o+8
								secStk(2*secStkCnt) = section,idx_o-1, idx_o,section(1)-1 : secStkCnt += 2	//push
							}
							continue
						}
						if tiv=281 {	// -
							if idx_o = section {	// - がFの左端なら
								if RPNTIVC(idx_o+1) = 10 {	//右隣が数値なら
									/* 統合 */
										RPNCC(idx_o+1) *= -1.0	//数値を-1倍
										RPNTIVC(idx_o) = 0	// - 消去
									secStk(2*secStkCnt) = idx_o+1,section(1) : secStkCnt ++	//push
								} else {
									/* - の左隣に0を挟み込むためにFの右側に1トークン分の領域を確保する */
										/* スライド */
											memcpy RPNTIVC,RPNTIVC, 4*(TCCStkCnt*2-section(1)-2), 4*section(1)+8,4*section(1)+4
											memcpy RPNCC,RPNCC, 8*(TCCStkCnt*2-section(1)-2), 8*section(1)+16,8*section(1)+8
										/* スタックを修復 */
											repeat secStkCnt
												if secStk(2*cnt) > section(1) : secStk(2*cnt) ++ : secStk(2*cnt+1) ++
											loop
									/* 並べ替え */
										RPNTIVC(idx_o) = 10 : RPNCC(idx_o) = 0.0	//0追加
										RPNTIVC(section(1)+1) = tiv
									secStk(2*secStkCnt) = idx_o+1, section(1) : secStkCnt ++	//push
								}
								continue
							}
							if 300<=RPNTIVC(idx_o-1) & RPNTIVC(idx_o-1)<=302 : flg_delPlus = 1 {	//左隣が * / % なら
								if RPNTIVC(idx_o+1) = 10 {	//右隣が数値なら
									/* 統合 */
										RPNCC(idx_o+1) *= -1.0	//数値を-1倍
										RPNTIVC(idx_o) = 0	// - 消去
									secStk(2*secStkCnt) = section,section(1) : secStkCnt ++	//push
								} else {
									idx_o -- : tiv = RPNTIVC(idx_o)
									/* 並び替え */
										memcpy RPNTIVC,RPNTIVC, 4*(section(1)-idx_o), 4*idx_o, 4*idx_o+4 : RPNTIVC(section(1)) = tiv
										memcpy RPNCC,RPNCC, 8*(section(1)-idx_o), 8*idx_o, 8*idx_o+8
									secStk(2*secStkCnt) = section,idx_o-1, idx_o,section(1)-1 : secStkCnt += 2	//push
								}
								continue
							}
							/* 並べ替え */
								memcpy RPNTIVC,RPNTIVC, 4*(section(1)-idx_o), 4*idx_o, 4*idx_o+4 : RPNTIVC(section(1)) = tiv
								memcpy RPNCC,RPNCC, 8*(section(1)-idx_o), 8*idx_o, 8*idx_o+8
							secStk(2*secStkCnt) = section,idx_o-1, idx_o,section(1)-1 : secStkCnt += 2	//push
							continue
						}
						if tiv=120 {	// ,
							RPNTIVC(idx_o) = 0	// , 消去
							secStk(2*secStkCnt) = section,idx_o-1, idx_o+1,section(1) : secStkCnt += 2	//push
						}
				loop
			/* 空白を詰める */
				len_CALCODE = 0	//計算コードの長さ
				blnkCnt = 0	//検出した空白の個数カウンタ
				foreach RPNTIVC
					if RPNTIVC(cnt) = 0 : blnkCnt ++ : continue
					if RPNTIVC(cnt) {
						if blnkCnt {
							RPNTIVC(len_CALCODE) = RPNTIVC(cnt)
							RPNCC(len_CALCODE) = RPNCC(cnt)
						}
						len_CALCODE ++
					}
				loop
			/* 余分なコードを消去 */
				memset RPNTIVC, 0, 4*(TCCStkCnt*2-len_CALCODE), 4*len_CALCODE
				memset RPNCC, 0, 8*(TCCStkCnt*2-len_CALCODE), 8*len_CALCODE
				repeat len_CALCODE
					if RPNTIVC(cnt) != 10 : RPNCC(cnt) = 0.0
				loop
		
		return len_CALCODE
#global

#module mod_fx_calc	// "mod_fx_calculate" 計算
	/*
		速度重視の為インライン的な記述が非常に多い
	*/

	#define varReg			varReg@mod_fx_share
	#define id_selFml		id_selFml@mod_fx_share
	#define RPNTIVC_sel		RPNTIVC_sel@mod_fx_share
	#define RPNCC_sel		RPNCC_sel@mod_fx_share
	#define len_CALCODE_sel	len_CALCODE_sel@mod_fx_share
	
	#deffunc local modinit
		idx = 0,0,0,0
		errCode2 = 0
		stack = 0.0
		/* オペレーター処理ラベルテーブル */
			dimtype OPELABTBL,vartype("label"),11002	// "OPERATERLABELTBL" 数値 | ^ & == != < <= > >= << >> + - * / %  変数名 関数名 オペレーターのTIVに対応する要素に処理用ラベル情報が格納される。
		OPELABTBL(10) = *OPELAB_val
		
		OPELABTBL(140) = *OPELAB_vb
		OPELABTBL(160) = *OPELAB_caret
		OPELABTBL(180) = *OPELAB_ampsnd
		OPELABTBL(200) = *OPELAB_equal
		OPELABTBL(201) = *OPELAB_unequal
		OPELABTBL(220) = *OPELAB_lesser
		OPELABTBL(221) = *OPELAB_leq
		OPELABTBL(222) = *OPELAB_greater
		OPELABTBL(223) = *OPELAB_geq
		OPELABTBL(240) = *OPELAB_lbs
		OPELABTBL(241) = *OPELAB_rbs
		OPELABTBL(280) = *OPELAB_plus
		OPELABTBL(281) = *OPELAB_minus
		OPELABTBL(300) = *OPELAB_times
		OPELABTBL(301) = *OPELAB_div
		OPELABTBL(302) = *OPELAB_rem
	
		repeat 9000,1000 : OPELABTBL(cnt) = *OPELAB_var : loop
		
		OPELABTBL(10000) = *OPELAB_sin
		OPELABTBL(10001) = *OPELAB_cos
		OPELABTBL(10002) = *OPELAB_tan
		OPELABTBL(10010) = *OPELAB_asin
		OPELABTBL(10011) = *OPELAB_acos
		OPELABTBL(10012) = *OPELAB_atan
		OPELABTBL(10020) = *OPELAB_sinh
		OPELABTBL(10021) = *OPELAB_cosh
		OPELABTBL(10022) = *OPELAB_tanh
		OPELABTBL(10030) = *OPELAB_asinh
		OPELABTBL(10031) = *OPELAB_acosh
		OPELABTBL(10032) = *OPELAB_atanh
		OPELABTBL(10100) = *OPELAB_sqrt
		OPELABTBL(10200) = *OPELAB_exp
		OPELABTBL(10220) = *OPELAB_pow
		OPELABTBL(10300) = *OPELAB_log
		OPELABTBL(10320) = *OPELAB_ln
		OPELABTBL(10330) = *OPELAB_log10
		OPELABTBL(10400) = *OPELAB_limit
		OPELABTBL(10600) = *OPELAB_abs
		OPELABTBL(10700) = *OPELAB_floor
		OPELABTBL(10720) = *OPELAB_round
		OPELABTBL(10740) = *OPELAB_ceil
		OPELABTBL(10760) = *OPELAB_int
		OPELABTBL(10800) = *OPELAB_sgn
		OPELABTBL(10900) = *OPELAB_factorical
		OPELABTBL(11000) = *OPELAB_deg2rad
		OPELABTBL(11001) = *OPELAB_rad2deg
		return

	#defcfunc mfx_calc array errCode	//計算
		/*
			エラーが発生した場合の戻り値は double(0)
			
			errCode	: エラーコードを受け取るint型変数。errCode = 0,0,0 で初期化しておくべき。
			       	  詳細は design.txt を参照。
		*/
		if id_selFml = -1 : errCode = 1 : return 0.0
		stkCnt = 0	//スタックカウンタ
		flg_error = 0
		repeat len_CALCODE_sel
			tiv = RPNTIVC_sel(cnt)
			gosub OPELABTBL(tiv)
			if flg_error : break
		loop
		if flg_error : return 0.0
		errCode = 0
		return stack
	
	*OPELAB_val	// "OPELAB_value" 数値の処理
		stack(stkCnt) = RPNCC_sel(cnt) : stkCnt ++	//push
		return
	
	*OPELAB_var	// "OPELAB_variable" 変数の処理
		if varuse(varReg(tiv-1000)) {	//定義済み
			if get_isArray@mv_mfx_VarPkg(varReg(tiv-1000)) {	//配列なら
				dimension = get_dimension@mv_mfx_VarPkg(varReg(tiv-1000))	//次元数
				/* パラメータ取得 & 非負整数チェック */
					repeat dimension
						prm = stack(stkCnt-1) : stkCnt --	//pop
						if prm<0.0 | prm-double(int(prm))!=0.0 {	//パラメータが負である、或いは整数でない場合
							varName = get_name@mv_mfx_VarPkg(varReg(tiv-1000))	//変数名取得
							errCode = 2,2,varptr(varName)
							flg_error = 1 : break
						}
						idx(dimension-1-cnt) = int(prm)	//スタックから降ろした順番と逆にする
					loop
					if flg_error : return
					stack(stkCnt) = getVal@mv_mfx_VarPkg(varReg(tiv-1000), idx,errCode2) : stkCnt ++	//push
					if errCode2 {	//エラー
						varName = get_name@mv_mfx_VarPkg(varReg(tiv-1000))	//変数名取得
						errCode = 2,3,varptr(varName)
						flg_error = 1 : return
					}
			} else {	//非配列なら
				stack(stkCnt) = getVal@mv_mfx_VarPkg(varReg(tiv-1000), idx,errCode2) : stkCnt ++	//push
			}
		} else {	//未定義
			errCode = 2,1
			flg_error = 1 : return
		}
		return
	
	*OPELAB_vb	// "VerticalBar" |
		prm = stack(stkCnt-2),stack(stkCnt-1)	//pop
		if prm-double(int(prm)) ! 0.0 | prm(1)-double(int(prm(1))) ! 0.0 {	// パラメータは整数でなければならない
			errCode = 3,10,tiv
			flg_error = 1 : return
		}
		//※スクリプトでint()するよりHSPに自動でキャストさせた方が速いのでprm(1)のキャストはHSPに任せる
		stack(stkCnt-2) = double(int(prm)|prm(1)) : stkCnt --	//push
		return
	
	*OPELAB_caret	// ^
		prm = stack(stkCnt-2),stack(stkCnt-1)	//pop
		if prm-double(int(prm)) ! 0.0 | prm(1)-double(int(prm(1))) ! 0.0 {	// パラメータは整数でなければならない
			errCode = 3,10,tiv
			flg_error = 1 : return
		}
		stack(stkCnt-2) = double(int(prm)^prm(1)) : stkCnt --	//push
		return
	
	*OPELAB_ampsnd	// "ampersand" &
		prm = stack(stkCnt-2),stack(stkCnt-1)	//pop
		if prm-double(int(prm)) ! 0.0 | prm(1)-double(int(prm(1))) ! 0.0 {	// パラメータは整数でなければならない
			errCode = 3,10,tiv
			flg_error = 1 : return
		}
		stack(stkCnt-2) = double(int(prm)&prm(1)) : stkCnt --	//push
		return
	
	*OPELAB_equal	// ==
		stack(stkCnt-2) = double(stack(stkCnt-2)==stack(stkCnt-1)) : stkCnt -- //pop, push
		return
	
	*OPELAB_unequal	// !=
		stack(stkCnt-2) = double(stack(stkCnt-2)!=stack(stkCnt-1)) : stkCnt -- //pop, push
		return
	
	*OPELAB_lesser	// <
		stack(stkCnt-2) = double(stack(stkCnt-2)<stack(stkCnt-1)) : stkCnt -- //pop, push
		return
	
	*OPELAB_leq	// "lesser or equal" <=
		stack(stkCnt-2) = double(stack(stkCnt-2)<=stack(stkCnt-1)) : stkCnt -- //pop, push
		return
	
	*OPELAB_greater	// >
		stack(stkCnt-2) = double(stack(stkCnt-2)>stack(stkCnt-1)) : stkCnt -- //pop, push
		return
	
	*OPELAB_geq	// "greater or equal" >=
		stack(stkCnt-2) = double(stack(stkCnt-2)>=stack(stkCnt-1)) : stkCnt -- //pop, push
		return
	
	*OPELAB_lbs	// "leftBitShift"	<<
		prm = stack(stkCnt-2),stack(stkCnt-1)	//pop
		if prm-double(int(prm)) ! 0.0 | prm(1)-double(int(prm(1))) ! 0.0 {	// パラメータは整数でなければならない
			errCode = 3,10,tiv
			flg_error = 1 : return
		}
		stack(stkCnt-2) = double(int(prm)<<prm(1)) : stkCnt --	//push
		return
	
	*OPELAB_rbs // "rightBitShift" >>
		prm = stack(stkCnt-2),stack(stkCnt-1)	//pop
		if prm-double(int(prm)) ! 0.0 | prm(1)-double(int(prm(1))) ! 0.0 {	// パラメータは整数でなければならない
			errCode = 3,10,tiv
			flg_error = 1 : return
		}
		stack(stkCnt-2) = double(int(prm)>>prm(1)) : stkCnt --	//push
		return
	
	*OPELAB_plus	// +
		stack(stkCnt-2) += stack(stkCnt-1) : stkCnt --	//pop, push
		return
	
	*OPELAB_minus	// -
		stack(stkCnt-2) -= stack(stkCnt-1) : stkCnt --	//pop, push
		return
	
	*OPELAB_times	// *
		stack(stkCnt-2) *= stack(stkCnt-1) : stkCnt --	//pop, push
		return
	
	*OPELAB_div	// "divide" /
		if stack(stkCnt-1) = 0 : errCode = 3,15,0 : flg_error = 1 : return	//0除算エラー
		stack(stkCnt-2) /= stack(stkCnt-1) : stkCnt --	//pop, push
		return
	
	*OPELAB_rem	// "remainder" %
		stack(stkCnt-2) -= stack(stkCnt-1)*int(stack(stkCnt-2)/stack(stkCnt-1)) : stkCnt --	//pop, push
		return
	
	*OPELAB_sin	// sin
		stack(stkCnt-1) = sin(stack(stkCnt-1))	//pop, push
		return
	
	*OPELAB_cos	// cos
		stack(stkCnt-1) = cos(stack(stkCnt-1))	//pop, push
		return
	
	*OPELAB_tan	// tan
		stack(stkCnt-1) = tan(stack(stkCnt-1))	//pop, push
		return
	
	*OPELAB_asin	// asin
		h = stack(stkCnt-1)
		if absf(h) > 1.0 : errCode = 3,20,tiv : flg_error = 1 : return	//定義域は [-1,1]
		stack(stkCnt-1) = atan(h,sqrt(1.0-h*h))	//pop, push
		return
	
	*OPELAB_acos	// acos
		h = stack(stkCnt-1)
		if absf(h) > 1.0 : errCode = 3,20,tiv : flg_error = 1 : return	//定義域は [-1,1]
		stack(stkCnt-1) = atan(sqrt(1.0-h*h),h)	//pop, push
		return
	
	*OPELAB_atan	// atan
		stack(stkCnt-2) = atan(stack(stkCnt-2),stack(stkCnt-1)) : stkCnt --	//pop, push
		return
	
	*OPELAB_sinh	// sinh
		stack(stkCnt-1) = 0.5*(powf(2.718281828459045,stack(stkCnt-1))-powf(2.718281828459045,-stack(stkCnt-1)))	//pop, push
		return
	
	*OPELAB_cosh	// cosh
		stack(stkCnt-1) = 0.5*(powf(2.718281828459045,stack(stkCnt-1))+powf(2.718281828459045,-stack(stkCnt-1)))	//pop, push
		return
	
	*OPELAB_tanh	// tanh
		stack(stkCnt-1) = (powf(2.718281828459045,stack(stkCnt-1))-powf(2.718281828459045,-stack(stkCnt-1)))/(powf(2.718281828459045,stack(stkCnt-1))+powf(2.718281828459045,-stack(stkCnt-1)))	//pop, push
		return
	
	*OPELAB_asinh	// asinh
		stack(stkCnt-1) = logf(stack(stkCnt-1) + sqrt(stack(stkCnt-1)*stack(stkCnt-1)+1.0))	//pop,push
		return
	
	*OPELAB_acosh	// acosh
		h = stack(stkCnt-1)	//pop
		if h < 1.0 : errCode = 3,20,tiv : flg_error = 1 : return	//定義域は [1,∞)
		stack(stkCnt-1) = logf(h + sqrt(h*h-1.0))	//push
		return
	
	*OPELAB_atanh	// atanh
		h = stack(stkCnt-1)	//pop
		if absf(h) >= 1 : errCode = 3,20,tiv : flg_error = 1 : return
		stack(stkCnt-1) = 0.5*logf((1.0+h)/(1.0-h))	//push
		return
	
	*OPELAB_sqrt	// sqrt
		if stack(stkCnt-1) < 0 : errCode = 3,20,tiv : flg_error = 1 : return
		stack(stkCnt-1) = sqrt(stack(stkCnt-1))	//pop, push
		return
	
	*OPELAB_exp	// exp
		stack(stkCnt-1) = expf(stack(stkCnt-1))	//pop, push
		return
	
	*OPELAB_pow	// pow
		h1 = stack(stkCnt-2) : h2 = stack(stkCnt-1)	//pop
		if h1 > 0 {
			stack(stkCnt-2) = powf(h1,h2) : stkCnt --	//push
		} else {
			if h1 = 0 {
				if h2 < 0 : errCode = 3,20,tiv : flg_error = 1 : return
				stack(stkCnt-2) = powf(h1,h2) : stkCnt --	//pop, push
			} else {	// h1<0
				if h2 - double(int(h2)) != 0 : errCode = 3,20,tiv : flg_error = 1 : return	//h2は整数値でなくてはならない
				stack(stkCnt-2) = powf(h1,h2) : stkCnt --	//push
			}
		}
		return
	
	*OPELAB_log	// log
		h1 = stack(stkCnt-2) : h2 = stack(stkCnt-1)
		if h1=1 | h1<=0 | h2<=0 : errCode = 3,20,tiv : flg_error = 1 : return	//底は正かつ1未満、または1超過、真数は正でなくてはならない。
		stack(stkCnt-2) = logf(h2)/logf(h1) : stkCnt --	//pop, push
		return
	
	*OPELAB_ln	// ln
		if stack(stkCnt-1) <= 0.0 : errCode = 3,20,tiv : flg_error = 1 : return	//定義域は (0,∞)
		stack(stkCnt-1) = logf(stack(stkCnt-1))	//pop, push
		return
	
	*OPELAB_log10	// log10
		if stack(stkCnt-1) <= 0.0 : errCode = 3,20,tiv : flg_error = 1 : return	//定義域は (0,∞)
		stack(stkCnt-1) = logf(stack(stkCnt-1))/2.302585092994046	//pop, push
		return
	
	*OPELAB_limit	// limit
		if stack(stkCnt-2) > stack(stkCnt-1) : errCode = 3,20,tiv : flg_error = 1 : return	//最小値 > 最大値 となってはならない
		stack(stkCnt-3) = limitf(stack(stkCnt-3),stack(stkCnt-2),stack(stkCnt-1)) : stkCnt -= 2	//pop, push
		return
	
	*OPELAB_abs	// abs
		stack(stkCnt-1) = absf(stack(stkCnt-1))	//pop, push
		return
	
	*OPELAB_floor	// floor
		if stack(stkCnt-1) >= 0 {	//非負
			stack(stkCnt-1) = double(int(stack(stkCnt-1)))	//pop, push
		} else {	//負
			if stack(stkCnt-1)\1.0 != 0.0 {	//非整数
				stack(stkCnt-1) = -1.0 + int(stack(stkCnt-1))	//pop, push
			}
			//※整数の場合は何もしなくて良い
		}
		return
	
	*OPELAB_round	// round
		if stack(stkCnt-1) >= 0 {	//非負
			stack(stkCnt-1) = double(int(stack(stkCnt-1) + 0.5))	//pop, push
		} else {	//負
			stack(stkCnt-1) = double(int(stack(stkCnt-1) - 0.5))	//pop, push
		}
		return
	
	*OPELAB_ceil	// ceil
		if stack(stkCnt-1) >= 0 {	//非負
			if stack(stkCnt-1)\1.0 != 0.0 {	//非整数
				stack(stkCnt-1) = 1.0 + int(stack(stkCnt-1))	//pop, push
			}
			//※整数の場合は何もしなくてよい
		} else {	//負
			stack(stkCnt-1) = double(int(stack(stkCnt-1)))	//pop, push
		}
		return
	
	*OPELAB_int	// int
		stack(stkCnt-1) = double(int(stack(stkCnt-1)))	//pop, push
		return
	
	*OPELAB_sgn	// sgn
		if stack(stkCnt-1) > 0.0 {	//正
			stack(stkCnt-1) = 1.0	//pop, push
			return
		}
		if stack(stkCnt-1) < 0.0 {	//負
			stack(stkCnt-1) = -1.0	//pop, push
			return
		}
		//※0の場合は何もしなくて良い
		return
	
	*OPELAB_factorical	// factorical
		h = stack(stkCnt-1) //pop
		if h\1.0!=0.0 | h<0.0 : errCode = 3,11,tiv : flg_error = 1 : return	//パラメータは非負整数でなくてはならない
		if h=0.0 : stack(stkCnt-1) = 1.0 : return	//push
		//※ h=1.0,2.0 の場合は何もしなくて良い。
		if h>=3.0 {
			repeat -2+h,1
				stack(stkCnt-1) *= h-cnt	//push
			loop
		}
		return
	
	*OPELAB_deg2rad	// deg2rad
		stack(stkCnt-1) = deg2rad(stack(stkCnt-1))	//pop, push
		return
	
	*OPELAB_rad2deg	// rad2deg
		stack(stkCnt-1) = rad2deg(stack(stkCnt-1))	//pop, push
		return
#global