;_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
;
;	�umod_CharStr�v
;
;	�����񑀍샂�W���[��
;
;	by FunnyMaker
;	����J�n : 2013/5/19
;	�ŏI�X�V : 2014/1/11
;
;	��CharStr �� character string �̗�
;
;_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
#module N_M_CharStr1;�uName_Mod_CharStr1�v�̗�

;	�������𒲂ׂ�B���s�R�[�h�̓J�E���g���Ȃ��B
;
;	[����]
;		val = MCS_CntChar(������)
#defcfunc MCS_CntChar str strings_tmp
	strings1 = strings_tmp
	notesel strings1
	result = 0;���ʂ̕ۑ���
	repeat notemax
		noteget strings2,cnt;1�s���o��
		count1 = 0;���o�����s�ɂ����ēǂݐi�߂��o�C�g��
		repeat
			num1 = peek(strings2,count1) : count1 + 1
			if num1 = 0 : break;�I���R�[�h���o
			result + 1
			if ((129 <= num1)&(num1 <= 159))|((224 <= num1)&(num1 <= 252)) : count1 + 1;�S�p�����̏ꍇ�́A�ǂݏo���o�C�g����+1�B
		loop
	loop
	return result
#global

#module N_M_CharStr2

;	�����s������ɂ����āA�Œ��̍s�̕������𒲂ׂ�B

;	[����]
;		val = MCS_CntChar2(������)

#defcfunc MCS_CntChar2 str strings_tmp
	strings1 = strings_tmp
	notesel strings1
	result = 0;�Œ��L�^
	repeat notemax
		notesel strings1 : noteget strings2,cnt;1�s���o��
		num1 = MCS_CntChar(strings2) : if num1 > result : result = num1
	loop
	return result
#global

#module N_M_CharStr3

;	�^����ꂽ�����񂪐������ǂ������ׂ�

;	[����]
;		flg = MCS_IsThisFigure(������)

;	�߂�l : (1,0) = (�����ł���,�����łȂ�)

;	(��)
;		794 �͐���
;		8W2 �͐����łȂ�

#defcfunc MCS_IsThisFigure str string_arg

	string1 = string_arg
	length_string1 = strlen(string1)
	if length_string1 = 0 : return
	
	;��  - ��������������p�ӂ��� ��
		if peek(string1,0) = '-' {
			string2 = strmid(string1,1,length_string1 - 1)
			length_string2 = length_string1 - 1
		} else {
			string2 = string1
			length_string2 = length_string1
		}
	
	if length_string2 = 0 : return 0		;���̎��_�ŋ󕶎���̏ꍇ�̓A�E�g�B
	if peek(string2,0) = '.' : return 0	;�擪�� . ����������A�E�g�B
	
	flg1 = 1
	count1 = 0	;�������� . �̌��̃J�E���^
	repeat length_string2
		k = peek(string2,cnt)
		if ((48 <= k)&(k <= 57))|(k = 46) {  } else { flg1 = 0 : break }	; 0�`9 . �̂����ꂩ�Ȃ�OK�B����ȊO�Ȃ�A�E�g�B
		if k = 46 : count1 ++
		if count1 >= 2 : flg1 = 0 : break	; . ��2�ȏ゠������A�E�g�B
	loop
	
	return flg1
#global

#module N_M_CharStr4
;	64bit�{���x�̎����l�𕶎���Ő��m�ɕ\������

;	[����]
;
;		str = MCS_DoubleToStr64(�����l)

#defcfunc MCS_DoubleToStr64 double x
	;k1 = strlen(str(abs(x)))
	;k2 = 16 - k1
	;str1 = "%."+k2+"f"
	;return strf(str1,x)
	
	;		��(�܂Ƃ߂��...)
	
	return strf("%."+str(16 - strlen(str(abs(x))))+"f",x)
#global

#module N_M_CharStr5
;	�����̏����ʂ̖����́A�A������0���ȗ�����B

;	[����]

;	buf = MCS_OmitZero("������")
;	�܂��́A
;	buf = MCS_OmitZero(�ϐ���1)
;
;	�ϐ���1	:	�����񂪊i�[����Ă���ϐ��̖��O

#defcfunc MCS_OmitZero str strings
	
	Buf = strings
	if instr(Buf,0,".") = -1 : return Buf	; . �������ꍇ�͏ȗ����ׂ�0�͖���
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
;	SJIS�R�[�h�ŋL�q���ꂽ�����񂩂�w�肳�ꂽ1���������o���B
;	���s�R�[�h 13 10 �͂��ꂼ��1�̔��p�����Ƃ��Ĉ�����̂Œ��ӁB

;	[����]
;
;		str = MCS_GetChar(������,p1,p2)
;
;	������	:	���o�����̕�����(�ϐ�������)
;	p1		:	���o���J�n�C���f�b�N�X(>=0)
;	p2		:	���o��������

#defcfunc MCS_GetChar str strings_given ,int Index_start ,int CharNum_get
	if (Index_start < 0)|(CharNum_get <= 0) : return ""
	result = ""
	strings1 = strings_given
	;�� 1��������؂� ��
		;1��������؂��āA�����uCell1_strings1�v�����^�z��ϐ��ɕۑ�����B
		;�v�f(n,0)��n+1�����ڂ̕����̃X�e�[�^�X(0=null ,1=���p ,2=�S�p)
		;�v�f(n,1),(n,2)��n+1�����ڂ̕�����1,2�o�C�g��(�����p�̏ꍇ��2�o�C�g�ڂ�0�Ƃ���)�̒l���i�[�����
		dim Cell1_strings1,strlen(strings_given),3
		count1_read = 0	;�ǂݐi�߂��o�C�g��
		count2_read = 0	;�ǂݐi�߂�������
		repeat strlen(strings_given)
			num1(0) = peek(strings1,count1_read)
			if num1(0) = 0 : break
			if num1(0) <= 128 {;���p�̏ꍇ
				count1_read ++
				Cell1_strings1(count2_read,0) = 1
				Cell1_strings1(count2_read,1) = num1(0)
			} else {;�S�p�̏ꍇ
				num1(1) = peek(strings1,count1_read + 1)
				count1_read + 2
				Cell1_strings1(count2_read,0) = 2
				Cell1_strings1(count2_read,1) = num1(0)
				Cell1_strings1(count2_read,2) = num1(1)
			}
			count2_read ++
		loop
		CharNum_strings1 = count2_read
	;�� ���o�� ��
		if Index_start >= CharNum_strings1 : return ""
		count1_written = 0	;�uresult�v�ϐ��ɏ������񂾃o�C�g��
		sdim result,CharNum_get*2
		repeat limit(CharNum_get,0,CharNum_strings1 - Index_start)
			if Cell1_strings1(Index_start + cnt,0) = 0 : break
			if Cell1_strings1(Index_start + cnt,0) = 1 {;���p�̏ꍇ
				poke result,count1_written,Cell1_strings1(Index_start + cnt,1)
				count1_written ++
			} else {;�S�p�̏ꍇ
				poke result,count1_written,Cell1_strings1(Index_start + cnt,1)
				poke result,count1_written+1,Cell1_strings1(Index_start + cnt,2)
				count1_written + 2
			}
		loop
	return result
#global

#module N_M_CharStr7
	;�b�ŗ^����ꂽ���l����0:00:00 (����:��:�b) �����o���B�u���v,�u�b�v�͏\�̈ʂ�K���\�����邪�A�u���v�͌����ϓ�����B
	
	;[����]
	;
	;	buf = CnvSec2HMS(P1)
	;
	;	P1	:	�b�B�����l�B
	
	;�߂�l�͕�����^�B�Ⴆ�΁A3682 ��n������A"1:01:22"���߂�B
	
#defcfunc CnvSec2HMS int t
	t1 = t/3600	;��
	t2 = t\3600
	t3 = t2/60	;��
	t4 = t\60	;�b
	if t3 >= 10 : buf1 = ""+t3+"" : else : buf1 = "0"+t3+""
	if t4 >= 10 : buf2 = ""+t4+"" : else : buf2 = "0"+t4+""
	return ""+t1+":"+buf1+":"+buf2+""
#global

#module N_M_CharStr8
;	strrep���߂�hsp3dish�p��ցB�����E�U����strrep�Ɠ����B
#deffunc DishStrrep var TEXT ,str target ,str rookie
	strlen_target = strlen(target)
	strlen_rookie = strlen(rookie)
	strlen_TEXT = strlen(TEXT)
	��strlen = strlen_rookie-strlen_target
	;�� �^�[�Q�b�g�̃A�h���X�\����� ��
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
	;�� �u������ ��
		address(cnt_replaced) = strlen_TEXT
		TEXT2 = TEXT
		sdim TEXT,strlen_TEXT + ��strlen*cnt_replaced
		TEXT += strmid(TEXT2,0,address(0))
		repeat cnt_replaced
			TEXT += rookie + strmid(TEXT2,address(cnt)+strlen_target,address(cnt+1)-address(cnt)-strlen_target)
		loop
	return cnt_replaced
#global

#module N_M_CharStr9
;	�啶���E����������ʂ����ɕ����񂪈�v���邩�ǂ������ׂ�B

;[����]
;
;	val = IsEqualStrings(A,B)
;
;	A,B : ��r���镶���񂪊i�[���ꂽ������(or������^�ϐ�)

;	A��B����v����Ȃ�1���A��v���Ȃ��Ȃ�0���Ԃ�B
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
;	�����񒆂̕������ꂽ�v�f�ɂ��āA���ꂼ��̗��[�̘A�����锼�p�X�y�[�X����������B
;	�Ⴆ�΁uapple juice ,ball , a cup of tea�v�Ƃ�����������uapple juice,ball,a cup of tea�v�ɂ�����ł���B
;	�R�}���h�̃p�����[�^�����̑O�����ȂǂɁB

;	[����]
;
;		MCS_OmitSpaceBetweenElements var,str
;
;		var : ����Ώۂ̕����񂪊i�[���ꂽ�ϐ�
;		str : ��؂�p������

#deffunc MCS_OmitSpaceBetweenElements var TEXT ,str char_division
	TEXT2 = TEXT + char_division
	sdim TEXT,strlen(TEXT)
	len = strlen(char_division)
	index_frontier = 0
	repeat
		k = instr(TEXT2,index_frontier,char_division)
		if k = -1 : break
		str1 = strmid(TEXT2,index_frontier,k)
		;�� �O�ƌ�̃X�y�[�X������ ��
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
	memset TEXT,0,len,strlen(TEXT)-len	;�Ō�̗]���ȋ�؂蕶�����폜
	return
#global


#module N_M_CharStr11
;	�����񂩂番�����ꂽ�v�f����
;	��؂�p������ŕ������ꂽ���������Ɉꎟ���z��ϐ��ɑ�����Ă����B

;	[����]
;
;		MCS_SplitChar var ,str ,array ,int
;
;		var		:	���̕����񂪑�����ꂽ�ϐ�
;		str		:	��؂�p������
;		array	:	�������ꂽ�v�f����������ϐ� (���R��ׂ��v�f�������炩���ߊm�ۂ��Ă����ƍ����ŏ����ł���)
;		int		:	������n�߂�z��̗v�f�ԍ�(��0)

;	�������ꂽ����stat�Ɋi�[�����

#deffunc MCS_SplitChar var TEXT ,str char_division ,array POUCH ,int idx_start_POUCH
	TEXT += char_division	;�����̓s����A1�t����B
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
;	�����񒆂̃L�[���[�h�̌��𒲂ׂ�

;	[����]
;
;		val = MCS_NumStrKwd(var,str,opt)
;
;		var	:	��������镶���񂪊i�[����Ă��镶����^�ϐ���
;		str	:	�L�[���[�h
;		opt	:	�I�v�V�����B(0,1)=(���[�h0,���[�h1)
;					�� ���[�h0 ��	:	����ł��镶�����������B���̏ꍇ�A�Ⴆ�΁uAAA�v�̒��ɁuAA�v��2����ƌ��Ȃ����B
;					�� ���[�h1 ��	:	����ł��镶����𐔂��Ȃ��B
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
;	�R�����g�̍폜
;	�R�����g�J�n�L������s���܂ł��폜����

;	[����]
;
;		MCS_DelComment var,str
;
;		var	:	����Ώۂ̕����񂪊i�[���ꂽ������^�ϐ���
;		str	:	�R�����g�J�n�L��(������)

;	�폜���ꂽ�R�����g�̐���stat�ɕۑ������B

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