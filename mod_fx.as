#module mv_mfx_VarPkg var,name,isArray,dimension,len	// "moduleVariable_mfx_VariablePackage" �ϐ��p�b�P�[�W
	/*
		var			: �ϐ��{��
		name		: �ϐ���
		isArray		: �z�񂩂ǂ����B(0,1)=(�łȂ�,�ł���)
		dimension	: ������
		len			: �����Bint[4]�B�v�f0�`3�ɂ͊e���������̒������i�[�B
	*/
	#deffunc local modDetect
		return
	
	#modinit str name_, int isArray_, int dimension_, array len_
		/*
			�ϐ�������
			�G���[�`�F�b�N����
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
	
	#modcfunc local get_name	//���O�ǂݏo��
		return name
	
	#modcfunc local get_isArray	//�z�񂩂ǂ���
		return isArray
	
	#modcfunc local get_dimension	//������
		return dimension
	
	#modcfunc local getVal array idx, var errCode	//�ǂݏo��
		/*
			���e�ǂݏo��
			
			idx			: �w��C���f�b�N�X�Bint[4]�B�Ⴆ�Ηv�f(1,2)���~������΁Aidx = 1,2
			errCode		: �G���[�R�[�h���󂯎��int�^�ϐ��B
			       		  �G���[�R�[�h�̓��e : (0,1) = (����,�z��v�f������)
	
			< �߂�l >
			
				����I��	�� ���]�̒l
				�G���[		�� 0.0
		*/
		errCode = 0
		if isArray {	//�z��Ȃ�
			/* �v�f�`�F�b�N */
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
	
	#modfunc local setVal double val, array idx	// ���
		/*
			���
	
			val			: �l
			idx			: �����C���f�b�N�X�Bint[4]�B�Ⴆ�Ηv�f(1,2)�ɑ����������΁Aidx = 1,2
	
			< ���s���stat�̒l >
	
				(0,1) = (����I��,�z��v�f������)
		*/
		flg_err = 0
		if isArray {	//�z��Ȃ�
			/* �v�f�`�F�b�N */
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

#module mv_mfx_FmlPkg RPNTIVC,RPNCC,len	// "moduleVariable_mfx_FormulaPackage" �����p�b�P�[�W
	/*
		RPNTIVC	: �t�|�[�����h�L�@�g�[�N�����ʒl�R�[�h
		RPNCC	: �t�|�[�����h�L�@�萔�R�[�h
		len		: �v�Z�R�[�h�̒���
	*/
	#modinit array RPNTIVC_, array RPNCC_, int len_	//�����p�b�P�[�W�쐬
		/*
			�����p�b�P�[�W�쐬
			�G���[�`�F�b�N����
		*/
		len = len_
		dim RPNTIVC,len : memcpy RPNTIVC,RPNTIVC_,4*len
		ddim RPNCC,len : memcpy RPNCC,RPNCC_,8*len
		return
	
	#modfunc local getCALCODE array RPNTIVC_, array RPNCC_, var len_	// �v�Z�R�[�h�擾
		len_ = len
		dup RPNTIVC_,RPNTIVC : dup RPNCC_,RPNCC
		return
#global

#module mod_fx_share	//���L���O���

	#define MAX_LEN_TOKEN	127
	#define MAX_NUM_VARS	9000

	#deffunc mfx_init	//���W���[��������
		modinit@mod_fx_calc
		
		dimtype varReg,vartype("struct"),1	// "variableRegistry" �ϐ����W�X�g��
		num_vars = 0	//�o�^����Ă���ϐ��̐�
		dimtype fmlReg,vartype("struct"),1	// "formulaRegistry" �������W�X�g��
		num_fmls = 0	//�o�^����Ă��鐔���̐�
		/* ���Z�q���\,���Z�q�g�[�N�����ʒl�\ */
			#define num_nameVartn_oprtr	26	//���Z�q���̐�
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
		/* ���w�萔���\,���w�萔�l�\,���w�萔�g�[�N�����ʒl�\ */
			#define num_nameVartn_mthCnst	2	//���w�萔���̐�
			sdim MCNTBL,num_nameVartn_mthCnst	// "mathConstantNameTable"
			dim MCTIVTBL,num_nameVartn_mthCnst	// "mathConstantTokenIdentifierValueTable"
			ddim MCVTBL,num_nameVartn_mthCnst	// "mathConstantValueTable"
			MCNTBL(0) = "m_pi"	: MCTIVTBL(0) = 20000	: MCVTBL(0) = 3.141592653589793
			MCNTBL(1) = "m_e"	: MCTIVTBL(1) = 20001	: MCVTBL(1) = 2.718281828459045
		/* ���w�֐����\,���w�֐��g�[�N�����ʒl�\,���w�֐��p�����[�^���\ */
			#define num_nameVartn_mthFnc	28	//���w�֐����̐�
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
	
		/* �I������Ă���ϐ��̏�� */
			id_selVar = -1	//ID�B(-1�Ȃ疢�I��)
		
		/* �I������Ă��鐔���̏�� */
			id_selFml = -1	//ID�B(-1�Ȃ疢�I��)
			RPNTIVC_sel = 0 : RPNCC_sel = 0.0	//�v�Z�R�[�h
			len_CALCODE_sel = 0	//����
			
		return
	
	#deffunc mfx_newVar str name_, int isArray, int dimension, array len	// "mfx_newVariable" �ϐ��쐬
		/*
			�ϐ��쐬
	
			name		: ���O
			isArray		: �z�񂩂ǂ����B(0,1)=(�łȂ�,�ł���)
			dimension	: �������B�Ⴆ��2�����z����`�������Ȃ�2�Ƃ���B
			len			: �����Bint[4]�B�v�f0�`3�ɂ͊e���������̒������i�[�B�Ⴆ�� [3,4] �m�ۂ������Ȃ� len = 3,4,0.0 �Ƃ���B
	
			< ���s���stat�̒l >
	
				(-4,-3,-2,-1,other) = (�����s��,�ϐ����s��,�����ϐ����ƏՓ�,�o�^�����E����,�o�^��ID)
		*/
		RC = 0
		name = name_
		if num_vars = MAX_NUM_VARS : return -1	//�o�^�����E����
		if name = "" | strlen(name) > MAX_LEN_TOKEN : return -3
		if (isArray != 0)&(isArray != 1) : return -4
		if isArray {	//�z��Ȃ�
			if (dimension < 1)|(dimension > 4) : return -4
			if length(len) < 4 : return -4
			repeat dimension
				if len(cnt) < 1 : RC = -4 : break
			loop
			if RC : return -4
		}
		
		/* �ϐ����`�F�b�N */
			if name = "" : return -3
			/* �擪�����p�����łȂ����m�F */
				if int(name) : return -3
				if peek(name,0) = 48 : return -3	//�擪��0�Ȃ�
			/* ����,2�����Z�q�Ɠ������O���܂܂�Ă��Ȃ����m�F */
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
			/* �\���ƈ�v���Ă��Ȃ����m�F */
				/* ���w�萔�� */
					repeat num_nameVartn_mthCnst
						if name = MCNTBL(cnt) : RC = -3 : break
					loop
					if RC : return -3
				/* ���w�֐��� */
					repeat num_nameVartn_mthFnc
						if name = MFNTBL(cnt) : RC = -3 : break
					loop
					if RC : return -3
			/* �����̕ϐ��Ɠ����łȂ����m�F */
				foreach varReg
					if name = get_name@mv_mfx_VarPkg(varReg(cnt)) : RC = -2 : break
				loop
				if RC : return -2
		/* �o�^��ID���Z�o */
			repeat
				if varuse(varReg(cnt)) = 0 : id = cnt : break
			loop
		
		newmod varReg,mv_mfx_VarPkg, name,isArray,dimension,len
		num_vars ++
		return id
	
	#deffunc mfx_selVar_name str name_	// "mfx_selectVar" ����Ώەϐ��̑I��
		/*
			����Ώەϐ��𖼑O�Ŏw�肷��
			
			name_	: �ϐ���
	
			< ���s���stat�̒l >
	
				(-1,other) : (�w�肳�ꂽ�ϐ������݂��Ȃ�,�I�����ꂽ�ϐ���ID)
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
	
	#deffunc mfx_selVar_id int id_	// "mod_fx_selectVar_id" ����Ώەϐ��̑I��
		/*
			����Ώەϐ���ID�Ŏw�肷��B
			mfx_selVar_name ���������B
			
			id	: ID
	
			< ���s���stat�̒l >
	
				(0,1) : (����I��,�w�肳�ꂽ�ϐ������݂��Ȃ�)
		*/
		if id_ < 0 : return 1
		if varuse(varReg(id_)) {
			id_selVar = id_
			return 0
		} else : return 1
	
	#defcfunc mfx_getSelVarName	// "mod_fx_getSelectedVariableName" �I������Ă���ϐ��̖��O���擾
		/*
			< �߂�l >
	
				(�󕶎���,other) = (�ϐ����I��,�ϐ���)
		*/
		if id_selVar = -1 : return ""
		return get_name@mv_mfx_VarPkg(varReg(id_selVar))
	
	#defcfunc mfx_getSelVarID	// "mod_fx_getSelectedVariableID" �I������Ă���ϐ���ID���擾
		/*
			< �߂�l >
	
				(-1,other) = (�ϐ����I��,�ϐ���ID)
		*/
		return id_selVar
	
	#deffunc mfx_delVar	// "mfx_deleteVariable" �ϐ��폜
		/*
			����ΏۂƂ��đI������Ă���ϐ����폜����
	
			< ���s���stat�̒l >
	
				(0,1) = (����I��,�ϐ����I��)
		*/
		if id_selVar = -1 : return 1
		delmod varReg(id_selVar)
		id_selVar = -1
		num_vars --
		return 0
		
	#deffunc mfx_subst double val, array idx	// "mfx_substitute" �ϐ��ւ̑��
		/*
			����ΏۂƂ��đI������Ă���ϐ��ɒl��������
	
			val		: �l
			idx		: �����C���f�b�N�X�Bint[4]�B�Ⴆ�Ηv�f(1,2)�ɑ����������΁Aidx = 1,2,0,0 �Ƃ���B
	
			< ���s���stat�̒l >
	
				(0,1,2,3) = (����I��,�ϐ����I��,�z��v�f������,�����s��)
		*/
		if id_selVar = -1 : return 1
		if length(idx) < 4 : return 3
		setVal@mv_mfx_VarPkg varReg(id_selVar), val,idx
		if stat : return 2 : else : return 0
	
	#deffunc mfx_newFml str strFml_, array errCode	// "mod_fx_newFormula" �����o�^
		/*
			�����o�^��o�^����
	
			strFml	: �����񐔎�
			errCode	: �G���[�R�[�h���󂯎��int�^�ϐ��BerrCode = 0,0 �ŏ��������Ă����ׂ��B
			       	  �ڍׂ� design.txt ���Q�ƁB
	
			< ���s���stat�̒l >
	
				(-1,other) : (�G���[,�o�^��ID)
		*/
		strFml = strFml_
		RPNTIVC = 0 : RPNCC = 0.0	//���������ϐ��x�����
		mfx_cmp@mod_fx_cmp strFml,RPNTIVC,RPNCC,errCode
		if stat = -1 : return -1
		len = stat
		/* �o�^��ID���Z�o */
			repeat
				if varuse(fmlReg(cnt)) = 0 : id = cnt : break
			loop
	
		newmod fmlReg,mv_mfx_FmlPkg,RPNTIVC,RPNCC,len	//�o�^
		return id
	
	#deffunc mfx_selFml int id_	// "mod_fx_selectFormula" ������I��
		/*
			������I������
	
			id_ : ID
	
			< ���s���stat�̒l >
	
				(0,1) : (����I��,�w�肳�ꂽ���������݂��Ȃ�)
		*/
		if id_ < 0 : return 1
		if varuse(fmlReg(id_)) {
			id_selFml = id_
			getCALCODE@mv_mfx_FmlPkg fmlReg(id_), RPNTIVC_sel,RPNCC_sel,len_CALCODE_sel
			return 0
		} else {
			return 1
		}
	
	#defcfunc mfx_get_id_selFml	//�I������Ă��鐔����ID�̎擾
		/*
			�I������Ă��鐔����ID��Ԃ�
	
			< �߂�l >
	
				(-1,other) = (�������I��,������ID)
		*/
		return id_selFml
	
	#deffunc mfx_delFml	// "mod_fx_deleteFormula" �����폜
		/*
			�I������Ă��鐔�����폜����
	
			< ���s���stat�̒l >
	
				(0,1) = (����I��,�������I��)
		*/
		if id_selFml = -1 : return 1
		delmod(fmlReg(id_selFml))
		id_selFml = -1
		return 0
#global

#module mod_fx_cmp	// "mod_fx_compile" �R���p�C��

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
			�R���p�C��
	
			strFml	: �����񐔎�
			RPNTIVC	: RPNTIVC
			RPNCC	: RPNCC
			errCode	: �G���[�R�[�h���󂯎��int�^�ϐ��BerrCode = 0,0 �ŏ��������Ă����ׂ��B
			       	  �ڍׂ� design.txt ���Q�ƁB
	
			< ���s���stat�̒l >
	
				(-1,other) = (�G���[,�v�Z�R�[�h�̒���)
		*/
		strFml = strFml_
		strrep strFml," ",""	//���p�X�y�[�X�폜
		len_strFml = strlen(strFml)
		if len_strFml = 0 {
			errCode = 0,0
			return -1
		}
		flg_error = 0
		/* phase1 : TCC���� */
			/*
				< ���j >
					( ) * / % \ + - << >> < <= > >= = == ! != & ^ | , �ŋ�؂�B
					�������u��؂�L�[���[�h�v�ƌĂԁB
			*/
			sdim TCC,MAX_LEN_TOKEN,len_strFml
			TCCStkCnt = 0	//TCC�X�^�b�N�J�E���^
			frontier = 0	//strFml��ǂݐi�߂��o�C�g���B�t�����e�B�A�B
			repeat
				/* ���̋�؂�L�[���[�h�̃C���f�b�N�X�ƒ����𒲂ׂ� */
					idx_nxtDivKwd = -1	//���̋�؂�L�[���[�h�̃C���f�b�N�X
					frontier_prev = frontier
					repeat
						char = peek(strFml,frontier) : frontier ++
						if (char = '(')|(char = ')')|(char = '*')|(char = '/')|(char = '%')|(char = '\\')|(char = '+')|(char = '-')|(char = '&')|(char = '^')|(char = '|')|(char = ',') {	//��؂�L�[���[�h���m��
							idx_nxtDivKwd = frontier-1
							len_nxtDivKwd = 1
							break
						}
						if (char = '<')|(char = '>')|(char = '=')|(char = '!') {	//<,>,=,!�̏ꍇ�͂܂��m�肵�Ȃ�
							char2 = peek(strFml,frontier) : frontier ++	//����1�����ǂ߂Ίm�肷��
							if ((char = '<')&(char2 = '<'))|((char = '<')&(char2 = '='))|((char = '>')&(char2 = '>'))|((char = '>')&(char2 = '='))|((char = '=')&(char2 = '='))|((char = '!')&(char2 = '=')) {	//2�����̃L�[���[�h�Ȃ�
								idx_nxtDivKwd = frontier-2
								len_nxtDivKwd = 2
								break
							} else {	//1�����̃L�[���[�h�Ȃ�
								frontier --	//�ǂ݉߂����������߂�
								idx_nxtDivKwd = frontier-1
								len_nxtDivKwd = 1
								break
							}
						}
						if frontier = len_strFml : break
					loop
				/* �؂�o�� */
					if idx_nxtDivKwd >= 0 {	//��؂�L�[���[�h�����������Ȃ�
						if idx_nxtDivKwd > frontier_prev {	//��؂�L�[���[�h�ƑO����̃t�����e�B�A�̊Ԃɕʂ̃g�[�N��������Ȃ�
							TCC(TCCStkCnt) = strmid(strFml,frontier_prev,idx_nxtDivKwd-frontier_prev) : TCCStkCnt ++
						}
						TCC(TCCStkCnt) = strmid(strFml,idx_nxtDivKwd,len_nxtDivKwd) : TCCStkCnt ++
					} else {	//��؂�L�[���[�h��������Ȃ������Ȃ�
						TCC(TCCStkCnt) = strmid(strFml,frontier_prev,frontier-frontier_prev) : TCCStkCnt ++
					}
				
				if frontier = len_strFml : break	//�ǂݐs��������I��
			loop
	
		
		/* phase2 : INTIVC,INCC���� */
		/*
			���w�萔�͂����Ő��l�ɒu����������B
		*/
			dim INTIVC,TCCStkCnt
			ddim INCC,TCCStkCnt
			repeat TCCStkCnt
				cnt0 = cnt
				token = TCC(cnt)
				flg_identified = 0
				/* ���Z�q��? */
					repeat num_nameVartn_oprtr
						if token = ONTBL(cnt) {
							INTIVC(cnt0) = OTIVTBL(cnt)
							flg_identified = 1 : break
						}
					loop
					if flg_identified : continue
				/* ���w�萔��? */
					repeat num_nameVartn_mthCnst
						if token = MCNTBL(cnt) {
							INTIVC(cnt0) = 10
							INCC(cnt0) = MCVTBL(cnt)
							flg_identified = 1 : break
						}
					loop
					if flg_identified : continue
				/* ���w�֐���? */
					repeat num_nameVartn_mthFnc
						if token = MFNTBL(cnt) {
							INTIVC(cnt0) = MFTIVTBL(cnt)
							flg_identified = 1 : break
						}
					loop
					if flg_identified : continue
				/* �ϐ���? */
					foreach varReg
						if token = get_name@mv_mfx_VarPkg(varReg(cnt)) {
							INTIVC(cnt0) = 1000+cnt
							flg_identified = 1 : break
						}
					loop
					if flg_identified : continue
				/* ���l��? */
					//+ -�͊܂܂�Ă��Ȃ�����擪��0�`9�̂����ꂩ�ł��邩�ǂ��������f�̌��B
					char = peek(token,0)
					if (48 <= char)&(char <= 57) {	//�擪��0�`9
						if strlen(token) = 1 {	//1����
							flg_identified = 1
						} else {	//2�����ȏ�
							/* .��1�ȉ��ł��邩�ǂ������ׂ� */
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
				/* ���m�łȂ� */
					flg_error = 1
					errCode = cnt,10
					break
			loop
			if flg_error : return -1
	
		
		/* phase3 : INTIVC����I */
			/*
				< �`�F�b�N���� >
					�E�[��
					�E�אڃg�[�N���Ԃ̐������B����g�[�N�������̉E�ׂ̃g�[�N���Ɩ������Ȃ������ׂ�B
			*/
			depth = 0
			/* �ŏ��ɂ����Ă͂Ȃ�Ȃ��g�[�N�� */
				tiv = INTIVC(0)
				if 101<=tiv & tiv<=241 | 300<=tiv & tiv<=302 : errCode = 0,15 : return -1	// ) , | ^ & == = != ! < <= > >= << >> + - * / % \ �������Ă͂Ȃ�Ȃ�
			/* �E�ׂ̃g�[�N���Ƃ̐������`�F�b�N */
				tiv_next = INTIVC(0)
				repeat TCCStkCnt-1
					tiv = tiv_next
					tiv_next = INTIVC(cnt+1)
					if tiv=10 {	//���l�Ȃ�
						if tiv_next<101 | 302<tiv_next : errCode = cnt+1,15 : flg_error = 1 : break	//�E�ׂ� ) , | ^ & == != < <= > >= << >> + - * / % �łȂ���΂Ȃ�Ȃ�
						continue
					}
					if tiv=100 {	// ( �Ȃ�
						depth ++
						if 101<=tiv_next & tiv_next<=241 | 300<=tiv_next & tiv_next<=302 : errCode = cnt+1,15 : flg_error = 1 : break	//�E�ׂ� ) , | ^ & == != < <= > >= << >> * / % �ł����Ă͂Ȃ�Ȃ�
						continue
					}
					if tiv=101 {	// ) �Ȃ�
						depth --
						if depth < 0 : errCode = cnt,21 : flg_error = 1 : break	//�[�������ł����Ă͂Ȃ�Ȃ�
						if tiv_next<101 | 302<tiv_next : errCode = cnt+1,15 : flg_error = 1 : break	//�E�ׂ� ) , | ^ & == != < <= > >= << >> + - * / % �łȂ���΂Ȃ�Ȃ�
						continue
					}
					if 120<=tiv & tiv<=241 | 300<=tiv & tiv<=302 {	// , | ^ & == != < <= > >= << >> * / % �Ȃ�
						if 101<=tiv_next & tiv_next<=241 | 300<=tiv_next & tiv_next<=302 : errCode = cnt+1,15 : flg_error = 1 : break	// �E�ׂ� ) , | ^ & == != < <= > >= << >> * / % �ł����Ă͂Ȃ�Ȃ�
						continue
					}
					if tiv=280 | tiv=281 {	//+ - �Ȃ�
						if 101<=tiv_next & tiv_next<=302 : errCode = cnt+1,15 : flg_error = 1 : break	//�E�ׂ� ) , | ^ & == != < <= > >= << >> + - * / % �ł����Ă͂Ȃ�Ȃ�
						continue
					}
					if 1000<=tiv & tiv<=9999 {	//�ϐ����Ȃ�
						if get_isArray@mv_mfx_VarPkg(varReg(tiv-1000)) {	//�z��Ȃ�
							if tiv_next != 100 : errCode = cnt,40 : flg_error = 1 : break	//�E�ׂ� ( �łȂ���΂Ȃ�Ȃ�
						} else {	//�z��łȂ��Ȃ�
							if tiv_next=100 : errCode = cnt,41 : flg_error = 1 : break	//�E�ׂ� ( �ł����Ă͂Ȃ�Ȃ�
							if tiv_next<101 | 302<tiv_next : errCode = cnt+1,15 : flg_error = 1 : break	//�E�ׂ� ) , | ^ & == != < <= > >= << >> + - * / % �łȂ���΂Ȃ�Ȃ�
						}
						continue
					}
					if 10000<=tiv & tiv<=11001 {	//�֐����Ȃ�
						if tiv_next != 100 : errCode = cnt,30 : flg_error = 1 : break	//�E�ׂ� ( �łȂ���΂Ȃ�Ȃ�
					}
				loop
				if flg_error : return -1
			/* �Ō�ɂ����Ă͂Ȃ�Ȃ��g�[�N�� */
				tiv = INTIVC(TCCStkCnt-1)
				if tiv=100 | 120<=tiv & tiv<=302 : errCode = TCCStkCnt-1,16 : return -1	//( , | ^ & == = != ! < <= > >= << >> + - * / % \ �ł����Ă͂Ȃ�Ȃ�
				if tiv = 101 : depth --
				if 10000<=tiv & tiv<=11001 : errCode = TCCStkCnt-1,30 : return -1	//�֐��� �ł����Ă͂Ȃ�Ȃ�
				if 1000<=tiv & tiv<=9999 {	//�ϐ����ł���Ȃ�
					if get_isArray@mv_mfx_VarPkg(varReg(tiv-1000)) : errCode = TCCStkCnt-1,40 : flg_error = 1 : return -1	//�z��ł����Ă͂Ȃ�Ȃ�
				}
	
			if depth > 0 : errCode = TCCStkCnt-1,20 : return -1	// ( �������Ă��Ȃ�
			if depth < 0 : errCode = TCCStkCnt-1,21 : return -1	// ) �ߑ�
			
			
		/* phase4 : INTIVC����II */
			/*
				< �`�F�b�N���� >
					�E�z��̓Y�����̌��̊m�F
					�E�֐��̃p�����[�^�̌��̊m�F
					�E���ʂ�,�̌��o
	
				< ���j >
					�z��/�֐� ������ , �Ƀ`�F�b�N��t���Ă䂫�A�S�Ă� , �Ƀ`�F�b�N��1�����t�����Ƃ��m�F����B
					������ �Y����/�p�����[�^ �̌��̃`�F�b�N���s���B
	
				< ���� >
					���̂��Ƃ� phase3 �ɂ��ۏ؂���Ă���B
	
						�E�z��,�֐��̉E�ׂɂ͕K��(...)�̍\��������B
						�E1�� , �͑����Ƃ�1�̎�l(�z��,�֐�)���������Ȃ��B
			*/
			dim DCS,TCCStkCnt	// "DelimiterCheckSheet" , �`�F�b�N�V�[�g�B�e , �̎�l(�z��,�֐�)�̌����L�^����B�v�f�̈ʒu�֌W��INTIVC�ƑΉ�����B
			repeat TCCStkCnt
				cnt0 = cnt
				tiv = INTIVC(cnt)
				if 1000<=tiv & tiv<=9999 {	//�ϐ����Ȃ�
					if get_isArray@mv_mfx_VarPkg(varReg(tiv-1000)) {	//�z��Ȃ�
						num_sbscrpt = 1	//�Y�����̐�
						depth2 = 0
						repeat -1,cnt+2	// ( �̎�����ǂݎn�߂�
							tiv2 = INTIVC(cnt)
							if tiv2 = 100 : depth2 ++ : continue	// (
							if tiv2 = 101 {	// )
								depth2 --
								if depth2 < 0 : break	//()�̒���ǂݏI�����
								continue
							}
							if depth2 = 0 {	//�[����0�Ȃ�
								if tiv2 = 120 {	// , �Ȃ�
									DCS(cnt) ++
									num_sbscrpt ++
								}
							}
						loop
						dimension = get_dimension@mv_mfx_VarPkg(varReg(tiv-1000))	//�Y�����̂���ׂ���
						if num_sbscrpt < dimension : errCode = cnt,42 : flg_error = 1 : break
						if num_sbscrpt > dimension : errCode = cnt,43 : flg_error = 1 : break
					}
					continue
				}
				if 10000<=tiv & tiv<=11001 {	//�֐����Ȃ�
					num_prm = 1	//�p�����[�^�̌�
					depth2 = 0
					repeat -1,cnt+2	// ( �̎�����ǂݎn�߂�
						tiv2 = INTIVC(cnt)
						if tiv2 = 100 : depth2 ++ : continue	// (
						if tiv2 = 101 {	// )
							depth2 --
							if depth2 < 0 : break	//()�̒���ǂݏI�����
							continue
						}
						if depth2 = 0 {	//�[����0�Ȃ�
							if tiv2 = 120 {	// , �Ȃ�
								DCS(cnt) ++
								num_prm ++
							}
						}
					loop
					foreach MFTIVTBL	//�p�����[�^�̌������������ǂ����`�F�b�N����
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
			/* ���ʂ� , �̌��o */
				foreach DCS
					if INTIVC(cnt)=120 & DCS(cnt)=0 : errCode = cnt,17 : flg_error = 1 : break
				loop
				if flg_error : return -1
	
		
		/* phase5 : RPNTIVC,RPNCC���� */
			/*
					�t�|�[�����h�L�@�ւ̕ϊ�
					
				< ���j >
				
					�z��ϐ���,�֐��������Z�q�ƌ��Ȃ��B��z��ϐ����͉��Z�q�ƌ��Ȃ��Ȃ��B
					�ŏ��ɐ����S�̂���ԃX�^�b�N�ɐς݁A�X�^�b�N����ɂȂ�܂ňȉ����J��Ԃ��B
	
					�X�^�b�N����1�~�낵��F�Ƃ���B
					F���Ő[��0�̈ʒu�ɂ����čł��D�揇�ʂ��Ⴍ�A���ł��E���ɂ��鉉�Z�q��T���B
					
					(1) ���̂悤�ȉ��Z�q������Ȃ�
					    �����o�Ƃ���Bo���D�揇�ʂ��Ⴂ���Z�q��F���ɖ������Ƃɒ��ӁB
					    
				    	(A) o�� ) �Ȃ�
				    		���̂Ƃ�F�� (...) �̌`�ł��邩�� ( ) ���������Ē��g���X�^�b�N�ɐςށB

						(B) o���z��ϐ����܂��͊֐����Ȃ�
							���̂Ƃ�F�� o(...) �̌`�ł���B
							(...)��o�̈ʒu�����ւ��� ( ) ���������Ē��g���X�^�b�N�ɐςށB
	
						(C) o�� * / % \ << >> < <= > >= == != & ^ | �Ȃ�
							o�̍�����L�A�E����R�Ƃ��� L R o �̏��Ԃɕ��ёւ��� L��R���X�^�b�N�ɐςށB
	
						(D) o�� + �Ȃ�
							
							(a) o��F�̍��[�ł���A������o�̍��ׂ� * / % �Ȃ�
								o�͕s�v�Ȃ̂ŏ����A�E�����X�^�b�N�ɐςށB
									
							(b) (a)�ȊO�Ȃ�
								o�̍�����L�A�E����R�Ƃ��� L R o �̏��Ԃɕ��ёւ��� L��R���X�^�b�N�ɐςށB
	
						(E) o�� - �Ȃ�
						
							(a) o��F�̍��[�ł���Ȃ�
							
								(�) o�̉E�ׂ����l�Ȃ�
									���҂𓝍�����B���l��-1�{���� - �̉E�����X�^�b�N�ɐς݁A-����������B
									
								(�) o�̉E�ׂ����l�łȂ��Ȃ�
									o�̍�����0��u���΃V�X�e�}�e�B�b�N�Ɉ�����B
									������o�̉E����R�Ƃ��� 0 R o �̏��Ԃɕ��ёւ���R���X�^�b�N�ɐςށB
									
							(b) o�̍��ׂ� * / % �Ȃ�
	
								(�) o�̉E�ׂ����l�Ȃ�
									���҂𓝍�����B�����l��-1�{���� -����������F���X�^�b�N�ɐςݒ����B
								
								(�) o�̉E�ׂ����l�łȂ��Ȃ�
									o�̍��ׂ̉��Z�q��o2�Ƃ���Bo���o2�̕�����Ŏ��s�����ׂ���Ԃł��邩��A
									o2�̍�����L�A�E����R�Ƃ��� L R o2 �̏��Ԃɕ��ёւ��� L��R���X�^�b�N�ɐςށB
	
							(c) (a)(b)�ȊO�Ȃ�
								o�̍�����L�A�E����R�Ƃ��� L R o �̏��Ԃɕ��ёւ��� L��R���X�^�b�N�ɐςށB
						
						(F) o�� , �Ȃ�
							o���������A�����ƉE�����X�^�b�N�ɐςށB
					
					(2) ���̂悤�ȉ��Z�q�������Ȃ�
						F�͊m��ł���B����ȏ�ό`�̕K�v�͂Ȃ��B
			*/
			dim RPNTIVC,TCCStkCnt*2 : memcpy RPNTIVC,INTIVC,4*TCCStkCnt	//(E)��(�)�̏ꍇ�ɔ�����2�{�̗̈���m�ۂ���
			ddim RPNCC,TCCStkCnt*2 : memcpy RPNCC,INCC,8*TCCStkCnt
			/* ��ԃX�^�b�N�̏����� */
				dim secStk,TCCStkCnt*2	//1��Ԃ�2�v�f�ŕ\���B���[�g�[�N��,�E�[�g�[�N���̃C���f�b�N�X �̏��Ɋi�[�B
				secStk = 0,TCCStkCnt-1	//�S�̂�ς�
				secStkCnt = 1	//�X�^�b�N�J�E���^
			/* ���בւ� */
				/*
					( ) , �̍폜����RPNTIVC���ɐ�����󔒂ɂ�0������
				*/
				repeat
					if secStkCnt = 0 : break
					section = secStk(2*secStkCnt-2), secStk(2*secStkCnt-1) : secStkCnt --	//pop
					/* �[��0�̈ʒu�ɂ����čł��D�揇�ʂ��Ⴍ�A���ł��E���ɂ��鉉�Z�qo��T��*/
						idx_o = -1	//o�̃C���f�b�N�X
						order_o = 0	//o�̏���
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
							if 1000<=tiv & tiv<=9999 {	//�ϐ���
								if get_isArray@mv_mfx_VarPkg(varReg(tiv-1000)) {	//�z��Ȃ�
									if order_o <= 2 : idx_o = cnt : order_o = 2
								}
								continue
							}
							if 10000<=tiv & tiv<=11001 {	//�֐���
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
					/* ���Z�q�̏��� */
						tiv = RPNTIVC(idx_o)
						if tiv = 101 {	// )
							RPNTIVC(section) = 0 : RPNTIVC(section(1)) = 0	// ( ) ����
							secStk(2*secStkCnt) = section+1, section(1)-1 : secStkCnt ++	//push
							continue
						}
						if 1000<=tiv & tiv<=11001 {	//�z��ϐ���,�֐���
							/* ���בւ� */
								memcpy RPNTIVC,RPNTIVC, 4*(section(1)-idx_o), 4*idx_o, 4*idx_o+4 : RPNTIVC(section(1)) = tiv
								memcpy RPNCC,RPNCC, 8*(section(1)-idx_o), 8*idx_o, 8*idx_o+8
							RPNTIVC(idx_o) = 0 : RPNTIVC(section(1)-1) = 0	// ( ) ����
							secStk(2*secStkCnt) = idx_o+1, section(1)-2 : secStkCnt ++	//push
							continue
						}
						if 140<=tiv & tiv<=241 | 300<=tiv & tiv<=302 {	// * / % \ << >> < <= > >= == != & ^ |
							/* ���בւ� */
								memcpy RPNTIVC,RPNTIVC, 4*(section(1)-idx_o), 4*idx_o, 4*idx_o+4 : RPNTIVC(section(1)) = tiv
								memcpy RPNCC,RPNCC, 8*(section(1)-idx_o), 8*idx_o, 8*idx_o+8
							secStk(2*secStkCnt) = section,idx_o-1, idx_o,section(1)-1 : secStkCnt += 2	//push
							continue
						}
						if tiv=280 {	// +
							flg_delPlus = 0	// + �����t���O
							if idx_o = section {	// + ��F�̍��[�Ȃ�
								flg_delPlus = 1
							} else {
								if 300<=RPNTIVC(idx_o-1) & RPNTIVC(idx_o-1)<=302 : flg_delPlus = 1	//���ׂ� * / % �Ȃ�
							}
							if flg_delPlus {
								RPNTIVC(idx_o) = 0	// + ����
								secStk(2*secStkCnt) = idx_o+1,section(1) : secStkCnt ++	//push
							} else {
								/* ���בւ� */
									memcpy RPNTIVC,RPNTIVC, 4*(section(1)-idx_o), 4*idx_o, 4*idx_o+4 : RPNTIVC(section(1)) = tiv
									memcpy RPNCC,RPNCC, 8*(section(1)-idx_o), 8*idx_o, 8*idx_o+8
								secStk(2*secStkCnt) = section,idx_o-1, idx_o,section(1)-1 : secStkCnt += 2	//push
							}
							continue
						}
						if tiv=281 {	// -
							if idx_o = section {	// - ��F�̍��[�Ȃ�
								if RPNTIVC(idx_o+1) = 10 {	//�E�ׂ����l�Ȃ�
									/* ���� */
										RPNCC(idx_o+1) *= -1.0	//���l��-1�{
										RPNTIVC(idx_o) = 0	// - ����
									secStk(2*secStkCnt) = idx_o+1,section(1) : secStkCnt ++	//push
								} else {
									/* - �̍��ׂ�0�����ݍ��ނ��߂�F�̉E����1�g�[�N�����̗̈���m�ۂ��� */
										/* �X���C�h */
											memcpy RPNTIVC,RPNTIVC, 4*(TCCStkCnt*2-section(1)-2), 4*section(1)+8,4*section(1)+4
											memcpy RPNCC,RPNCC, 8*(TCCStkCnt*2-section(1)-2), 8*section(1)+16,8*section(1)+8
										/* �X�^�b�N���C�� */
											repeat secStkCnt
												if secStk(2*cnt) > section(1) : secStk(2*cnt) ++ : secStk(2*cnt+1) ++
											loop
									/* ���בւ� */
										RPNTIVC(idx_o) = 10 : RPNCC(idx_o) = 0.0	//0�ǉ�
										RPNTIVC(section(1)+1) = tiv
									secStk(2*secStkCnt) = idx_o+1, section(1) : secStkCnt ++	//push
								}
								continue
							}
							if 300<=RPNTIVC(idx_o-1) & RPNTIVC(idx_o-1)<=302 : flg_delPlus = 1 {	//���ׂ� * / % �Ȃ�
								if RPNTIVC(idx_o+1) = 10 {	//�E�ׂ����l�Ȃ�
									/* ���� */
										RPNCC(idx_o+1) *= -1.0	//���l��-1�{
										RPNTIVC(idx_o) = 0	// - ����
									secStk(2*secStkCnt) = section,section(1) : secStkCnt ++	//push
								} else {
									idx_o -- : tiv = RPNTIVC(idx_o)
									/* ���ёւ� */
										memcpy RPNTIVC,RPNTIVC, 4*(section(1)-idx_o), 4*idx_o, 4*idx_o+4 : RPNTIVC(section(1)) = tiv
										memcpy RPNCC,RPNCC, 8*(section(1)-idx_o), 8*idx_o, 8*idx_o+8
									secStk(2*secStkCnt) = section,idx_o-1, idx_o,section(1)-1 : secStkCnt += 2	//push
								}
								continue
							}
							/* ���בւ� */
								memcpy RPNTIVC,RPNTIVC, 4*(section(1)-idx_o), 4*idx_o, 4*idx_o+4 : RPNTIVC(section(1)) = tiv
								memcpy RPNCC,RPNCC, 8*(section(1)-idx_o), 8*idx_o, 8*idx_o+8
							secStk(2*secStkCnt) = section,idx_o-1, idx_o,section(1)-1 : secStkCnt += 2	//push
							continue
						}
						if tiv=120 {	// ,
							RPNTIVC(idx_o) = 0	// , ����
							secStk(2*secStkCnt) = section,idx_o-1, idx_o+1,section(1) : secStkCnt += 2	//push
						}
				loop
			/* �󔒂��l�߂� */
				len_CALCODE = 0	//�v�Z�R�[�h�̒���
				blnkCnt = 0	//���o�����󔒂̌��J�E���^
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
			/* �]���ȃR�[�h������ */
				memset RPNTIVC, 0, 4*(TCCStkCnt*2-len_CALCODE), 4*len_CALCODE
				memset RPNCC, 0, 8*(TCCStkCnt*2-len_CALCODE), 8*len_CALCODE
				repeat len_CALCODE
					if RPNTIVC(cnt) != 10 : RPNCC(cnt) = 0.0
				loop
		
		return len_CALCODE
#global

#module mod_fx_calc	// "mod_fx_calculate" �v�Z
	/*
		���x�d���̈׃C�����C���I�ȋL�q�����ɑ���
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
		/* �I�y���[�^�[�������x���e�[�u�� */
			dimtype OPELABTBL,vartype("label"),11002	// "OPERATERLABELTBL" ���l | ^ & == != < <= > >= << >> + - * / %  �ϐ��� �֐��� �I�y���[�^�[��TIV�ɑΉ�����v�f�ɏ����p���x����񂪊i�[�����B
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

	#defcfunc mfx_calc array errCode	//�v�Z
		/*
			�G���[�����������ꍇ�̖߂�l�� double(0)
			
			errCode	: �G���[�R�[�h���󂯎��int�^�ϐ��BerrCode = 0,0,0 �ŏ��������Ă����ׂ��B
			       	  �ڍׂ� design.txt ���Q�ƁB
		*/
		if id_selFml = -1 : errCode = 1 : return 0.0
		stkCnt = 0	//�X�^�b�N�J�E���^
		flg_error = 0
		repeat len_CALCODE_sel
			tiv = RPNTIVC_sel(cnt)
			gosub OPELABTBL(tiv)
			if flg_error : break
		loop
		if flg_error : return 0.0
		errCode = 0
		return stack
	
	*OPELAB_val	// "OPELAB_value" ���l�̏���
		stack(stkCnt) = RPNCC_sel(cnt) : stkCnt ++	//push
		return
	
	*OPELAB_var	// "OPELAB_variable" �ϐ��̏���
		if varuse(varReg(tiv-1000)) {	//��`�ς�
			if get_isArray@mv_mfx_VarPkg(varReg(tiv-1000)) {	//�z��Ȃ�
				dimension = get_dimension@mv_mfx_VarPkg(varReg(tiv-1000))	//������
				/* �p�����[�^�擾 & �񕉐����`�F�b�N */
					repeat dimension
						prm = stack(stkCnt-1) : stkCnt --	//pop
						if prm<0.0 | prm-double(int(prm))!=0.0 {	//�p�����[�^�����ł���A�����͐����łȂ��ꍇ
							varName = get_name@mv_mfx_VarPkg(varReg(tiv-1000))	//�ϐ����擾
							errCode = 2,2,varptr(varName)
							flg_error = 1 : break
						}
						idx(dimension-1-cnt) = int(prm)	//�X�^�b�N����~�낵�����ԂƋt�ɂ���
					loop
					if flg_error : return
					stack(stkCnt) = getVal@mv_mfx_VarPkg(varReg(tiv-1000), idx,errCode2) : stkCnt ++	//push
					if errCode2 {	//�G���[
						varName = get_name@mv_mfx_VarPkg(varReg(tiv-1000))	//�ϐ����擾
						errCode = 2,3,varptr(varName)
						flg_error = 1 : return
					}
			} else {	//��z��Ȃ�
				stack(stkCnt) = getVal@mv_mfx_VarPkg(varReg(tiv-1000), idx,errCode2) : stkCnt ++	//push
			}
		} else {	//����`
			errCode = 2,1
			flg_error = 1 : return
		}
		return
	
	*OPELAB_vb	// "VerticalBar" |
		prm = stack(stkCnt-2),stack(stkCnt-1)	//pop
		if prm-double(int(prm)) ! 0.0 | prm(1)-double(int(prm(1))) ! 0.0 {	// �p�����[�^�͐����łȂ���΂Ȃ�Ȃ�
			errCode = 3,10,tiv
			flg_error = 1 : return
		}
		//���X�N���v�g��int()������HSP�Ɏ����ŃL���X�g���������������̂�prm(1)�̃L���X�g��HSP�ɔC����
		stack(stkCnt-2) = double(int(prm)|prm(1)) : stkCnt --	//push
		return
	
	*OPELAB_caret	// ^
		prm = stack(stkCnt-2),stack(stkCnt-1)	//pop
		if prm-double(int(prm)) ! 0.0 | prm(1)-double(int(prm(1))) ! 0.0 {	// �p�����[�^�͐����łȂ���΂Ȃ�Ȃ�
			errCode = 3,10,tiv
			flg_error = 1 : return
		}
		stack(stkCnt-2) = double(int(prm)^prm(1)) : stkCnt --	//push
		return
	
	*OPELAB_ampsnd	// "ampersand" &
		prm = stack(stkCnt-2),stack(stkCnt-1)	//pop
		if prm-double(int(prm)) ! 0.0 | prm(1)-double(int(prm(1))) ! 0.0 {	// �p�����[�^�͐����łȂ���΂Ȃ�Ȃ�
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
		if prm-double(int(prm)) ! 0.0 | prm(1)-double(int(prm(1))) ! 0.0 {	// �p�����[�^�͐����łȂ���΂Ȃ�Ȃ�
			errCode = 3,10,tiv
			flg_error = 1 : return
		}
		stack(stkCnt-2) = double(int(prm)<<prm(1)) : stkCnt --	//push
		return
	
	*OPELAB_rbs // "rightBitShift" >>
		prm = stack(stkCnt-2),stack(stkCnt-1)	//pop
		if prm-double(int(prm)) ! 0.0 | prm(1)-double(int(prm(1))) ! 0.0 {	// �p�����[�^�͐����łȂ���΂Ȃ�Ȃ�
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
		if stack(stkCnt-1) = 0 : errCode = 3,15,0 : flg_error = 1 : return	//0���Z�G���[
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
		if absf(h) > 1.0 : errCode = 3,20,tiv : flg_error = 1 : return	//��`��� [-1,1]
		stack(stkCnt-1) = atan(h,sqrt(1.0-h*h))	//pop, push
		return
	
	*OPELAB_acos	// acos
		h = stack(stkCnt-1)
		if absf(h) > 1.0 : errCode = 3,20,tiv : flg_error = 1 : return	//��`��� [-1,1]
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
		if h < 1.0 : errCode = 3,20,tiv : flg_error = 1 : return	//��`��� [1,��)
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
				if h2 - double(int(h2)) != 0 : errCode = 3,20,tiv : flg_error = 1 : return	//h2�͐����l�łȂ��Ă͂Ȃ�Ȃ�
				stack(stkCnt-2) = powf(h1,h2) : stkCnt --	//push
			}
		}
		return
	
	*OPELAB_log	// log
		h1 = stack(stkCnt-2) : h2 = stack(stkCnt-1)
		if h1=1 | h1<=0 | h2<=0 : errCode = 3,20,tiv : flg_error = 1 : return	//��͐�����1�����A�܂���1���߁A�^���͐��łȂ��Ă͂Ȃ�Ȃ��B
		stack(stkCnt-2) = logf(h2)/logf(h1) : stkCnt --	//pop, push
		return
	
	*OPELAB_ln	// ln
		if stack(stkCnt-1) <= 0.0 : errCode = 3,20,tiv : flg_error = 1 : return	//��`��� (0,��)
		stack(stkCnt-1) = logf(stack(stkCnt-1))	//pop, push
		return
	
	*OPELAB_log10	// log10
		if stack(stkCnt-1) <= 0.0 : errCode = 3,20,tiv : flg_error = 1 : return	//��`��� (0,��)
		stack(stkCnt-1) = logf(stack(stkCnt-1))/2.302585092994046	//pop, push
		return
	
	*OPELAB_limit	// limit
		if stack(stkCnt-2) > stack(stkCnt-1) : errCode = 3,20,tiv : flg_error = 1 : return	//�ŏ��l > �ő�l �ƂȂ��Ă͂Ȃ�Ȃ�
		stack(stkCnt-3) = limitf(stack(stkCnt-3),stack(stkCnt-2),stack(stkCnt-1)) : stkCnt -= 2	//pop, push
		return
	
	*OPELAB_abs	// abs
		stack(stkCnt-1) = absf(stack(stkCnt-1))	//pop, push
		return
	
	*OPELAB_floor	// floor
		if stack(stkCnt-1) >= 0 {	//��
			stack(stkCnt-1) = double(int(stack(stkCnt-1)))	//pop, push
		} else {	//��
			if stack(stkCnt-1)\1.0 != 0.0 {	//�񐮐�
				stack(stkCnt-1) = -1.0 + int(stack(stkCnt-1))	//pop, push
			}
			//�������̏ꍇ�͉������Ȃ��ėǂ�
		}
		return
	
	*OPELAB_round	// round
		if stack(stkCnt-1) >= 0 {	//��
			stack(stkCnt-1) = double(int(stack(stkCnt-1) + 0.5))	//pop, push
		} else {	//��
			stack(stkCnt-1) = double(int(stack(stkCnt-1) - 0.5))	//pop, push
		}
		return
	
	*OPELAB_ceil	// ceil
		if stack(stkCnt-1) >= 0 {	//��
			if stack(stkCnt-1)\1.0 != 0.0 {	//�񐮐�
				stack(stkCnt-1) = 1.0 + int(stack(stkCnt-1))	//pop, push
			}
			//�������̏ꍇ�͉������Ȃ��Ă悢
		} else {	//��
			stack(stkCnt-1) = double(int(stack(stkCnt-1)))	//pop, push
		}
		return
	
	*OPELAB_int	// int
		stack(stkCnt-1) = double(int(stack(stkCnt-1)))	//pop, push
		return
	
	*OPELAB_sgn	// sgn
		if stack(stkCnt-1) > 0.0 {	//��
			stack(stkCnt-1) = 1.0	//pop, push
			return
		}
		if stack(stkCnt-1) < 0.0 {	//��
			stack(stkCnt-1) = -1.0	//pop, push
			return
		}
		//��0�̏ꍇ�͉������Ȃ��ėǂ�
		return
	
	*OPELAB_factorical	// factorical
		h = stack(stkCnt-1) //pop
		if h\1.0!=0.0 | h<0.0 : errCode = 3,11,tiv : flg_error = 1 : return	//�p�����[�^�͔񕉐����łȂ��Ă͂Ȃ�Ȃ�
		if h=0.0 : stack(stkCnt-1) = 1.0 : return	//push
		//�� h=1.0,2.0 �̏ꍇ�͉������Ȃ��ėǂ��B
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