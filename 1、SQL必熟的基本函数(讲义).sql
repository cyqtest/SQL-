

--------------------------SQL����Ļ�������------------------------------------
--1���ַ���������Ascii��Char��CharIndex��Left��Right��SubString��Len��DataLength��Lower��Upper��LTrim��RTrim��Replace��Replicate��Space��
--2����ѧ������Abs��Ceiling��Floor��Pi��Power��Rand��Round��
--3������ʱ�亯����GetDate��Year��Month��Day��DateAdd��DateDiff��DatePart��Format��

--4��ת��������Cast��Convert��Str��
--5���ۺϺ�����Count(*)��Sum��Min��Max��Avg��

--6��ϵͳ������Case��IsDate��IsNumeric��IsNULL��NULLIF��@@RowCount��@@IDentity��IDentity��
-------------------------------------------------------------------------------

--1���ַ�������: Ascii��Char��CharIndex��Left��Right��SubString��Len��DataLength��Lower��Upper��LTrim��RTrim��Replace��Replicate��Space��
-------------------------------------------------------------------------------
--Ascii: �����ַ����ʽ�С��������ַ����� ASCII ����ֵ��
Select Ascii('a'), Ascii('Abc')		--97, 65

--Char: ��һ��ASCII������ת��Ϊ��Ӧ���ַ������û������0 ~ 255 ֮���ASCII��ֵ��CHAR() ����NULL��
Select Char(97), Char(65)			--'a', 'A'
--����Ӧ�ã�Char(13) + Char(10)����ʾ�س�����
Select '��ã��ҵ������ǣ�' + Char(13) + Char(10) + '������' + Char(13) + Char(10) + '�ܸ�����ʶ�㡣'
--�Ƚ����µĲ�ͬ��
Select '��ã��ҵ������ǣ�' + Char(13) + Char(10) + '������' + Char(13) + '�ܸ�����ʶ�㡣' + Char(10) + 'ABC'
--��SSMS��õ���ʾ�������ͬ�ģ���ΪSSMS�Ե�����Char(13)��Char(10)�������Ż���ʾ�����������ѵõ�������Ƶ������±���������Ϳ��Կ���������£�
--		��ã��ҵ������ǣ�
--		�������ܸ�����ʶ�㡣ABC
--ֻ��Char(13) + Char(10)���������Ļس����У������ڸ��ֳ���

--��������ʾ���
--���ı���ʽ��ʾ���
--Print

--������SQLʱ�����뺯���������ţ��Ȳ�Ҫ���������Źرգ�SSMS���в�����ʾ��
--������SQLʱ���ں���()�ڲ����ɰ���Ctrl + Shift + �ո���ʾ�����Ĳ�����ʾ��

--CharIndex: ��һ�����ʽ��������һ�����ʽ����������ʼλ�ã�����ҵ���������Ҳ���������0��
--�﷨��CharIndex('�Ӵ�', 'ԭ��'[, ��ʼ����λ��]) ��
Select CharIndex('abc', '213abcde'), CharIndex('abc', 'bcd')	--4, 0


--Left: �����ַ����д���߿�ʼָ���������ַ���
--Right: ���ұ߿�ʼ
Select Left('abcde', 2), Left('abcde', 3)	--ab, abc
Select Right('abcde', 3)					--cde

--SubString: ��ȡ�ַ������﷨��SubString('�ַ���', ��ʼλ��, ��ȡ���ȣ��Ҷ��ٸ��ַ���)��
--ע�⣺�������ȡ���ȡ������ַ�����β������ص���β��
Select SubString('abc', 3, 1), SubString('abc', 3, 2), SubString('abc', 3, 200)		--c, c, c
Select SubString('abcdef', 2, 2)		--'bc'

	--�쳣��
	Select Substring('abcd', 1, 1)	--a
	Select Substring('abcd', 0, 2)	--a
	Select Substring('abcd', -1, 3)	--a
	Select Substring('abcd', 1, -1)	--Error

--Len: ��ȡ�ַ����ġ��ַ������ȡ���ע�⡿������β��ո�
Select Len('abc'), Len('abc   '), Len('  abc'), Len('   ')			--3, 3, 5, 0
Select Len('�й�A�㶫')			--5

--DataLength: ��ȡ�ַ����ġ��ֽڡ����ȡ�
Select DataLength('abc'), DataLength(N'abc')	--3, 6
Select DataLength('abc  '), DataLength('  abc'), DataLength('   ')	--5, 5, 3
Select DataLength('�й�A�㶫')	--9

--Lower: ת��ΪСд��ĸ
--Upper: ת��Ϊ��д��ĸ
Select Lower('aBCDE')				--abcde
Select Upper('aBcde')				--ABCDE

--LTrim: ɾ���ַ��������ո�
--RTrim: ɾ���ַ������Ҳ�ո�
Select '[' + LTrim('      abc  ') + ']'			--[abc  ]
Select '[' + RTrim('      abc  ') + ']'			--[      abc]
Select '[' + LTrim(RTrim('      abc  ')) + ']'	--[abc]

--Replace: �滻�ַ������﷨�ṹ��Replace('ԭ�ַ���', 'A', 'B')����'ԭ�ַ���'�е�����'A'�滻Ϊ'B'��
Select Replace('abcdefghcde', 'cde', 'XXX')  --abXXXfghXXX

--Replicate: �ظ�n���ַ�����
Select Replicate('*', 80)
Select Replicate('�й��㶫-', 4)
Select Replicate('*', -1)		--��ע�⡿��nΪ�����ǣ����Ƿ���NULL

--Space: �õ�n���ո�
Select '*****' + Space(70) + '*****'
-------------------------------------------------------------------------------


--2��Abs��Ceiling��Floor��Pi��Power��Rand��Round��
-------------------------------------------------------------------------------
--Abs: ���ؾ���ֵ(����)����������: �����������������ͬ��
Select Abs(-2), Abs(2)		--2, 2 ��������
Select Abs(-2.22)			--2.22 ����decimal

--Ceiling: ����ȡ��(�컨��)
--Floor: ����ȡ��(�ذ�)
Select Ceiling(123.456), Ceiling(123), Ceiling(123.00000001)		--124, 123, 124
Select Floor(123.999), Floor(123)			--123, 123
Select Ceiling($123.456), Floor($123.999), Floor($0)	--124.00, 123.00, 0.00	$����: �������2λС��
	--��ע�⡿$����ֻ�������֣��������κα��������ʽ���Ӳ�ѯ��	�磺�����Ǵ���ģ�
	Select Floor($(12.12345 - 1))
	Declare @F Decimal(28, 8) = 12.12345 Select Floor($@F)
Go

--Pi: Բ���ʡ���������: Float
Select Pi()   --3.14159265358979

--Power: ָ���������ݡ���������: ���һ������������������ͬ��
Select Power(10, 2), Power(10, 3), Power(2, 6)		--100, 1000, 64
Select Power(2.00000000, 0.5), Power(2.00, 0.5), Power(2, 0.5)	--1.41421356, 1.41, 1


--Rand: ����һ�� 0 ~ 1�������� 0 �� 1��֮��������(Float����)
Select Rand()
Select Ceiling(Rand() * 100)

--Round: �������������뵽ָ����λ������������: ���һ������������������ͬ��
Select Round(123.152, 1), Round(123.15200, 1), Round(123.15200, 2) 
Select Round(153.152, 0), Round(153.152, -1), Round(153.152, -2)	--�����С��λ������Ϊ��������������С�����������
Select Round(153.152, -3)	--����С��λ���ĸ���������೤��ʱ������0

--�۲���������
Select 5 / 2	--��������ڣ�
Select 5.0 / 2
Select 5 * 1.0 / 2
--Ӧ�ã�
Select Avg(Age) From t_StudentInfo
Select Avg(Age * 1.0) From t_StudentInfo

-------------------------------------------------------------------------------


--3������ʱ�亯����GetDate��Year��Month��Day��DateAdd��DateDiff��DatePart��Format��
-------------------------------------------------------------------------------
--GetDate: �õ���ǰ��������ʱ��
Select GetDate()

--Year: ����ָ�����ڵ���
Select Year(GetDate())

--Month: ����ָ�����ڵ��·�
Select Month(GetDate())

--Day: ����ָ�����ڵ���
Select Day(GetDate())

--DateAdd: �Ӽ����ڻ�ʱ�䡣
--�﷨�ṹ��DateAdd(datepart, number, date)
--datepartȡֵ:
--	��: year �� yyyy �� yy
--	��: month �� mm �� m
--	��: day �� dd �� d
--	ʱ: hour �� hh
--	��: minute �� mi �� n
--	��: second �� ss �� s
--	����: millisecond �� ms
Select DateAdd(year, 1, GetDate()), DateAdd(year, -1, GetDate())			--��ǰʱ��: ��1��, ��1��
Select DateAdd(month, 2, GetDate()), DateAdd(month, -2, GetDate())			--��ǰʱ��: ��2�£���2��
Select DateAdd(day, 10, GetDate()), DateAdd(day, -10, GetDate())			--��ǰʱ��: ��10�գ���10��
Select DateAdd(hour, 10, GetDate()), DateAdd(hour, -10, GetDate())			--��ǰʱ��: ��10Сʱ����10Сʱ
Select DateAdd(minute, 10, GetDate()), DateAdd(minute, -10, GetDate())		--��ǰʱ��: ��10���ӣ���10����
Select DateAdd(second, 100, GetDate()), DateAdd(second, -100, GetDate())	--��ǰʱ��: ��100�룬��100��
Select DateAdd(ms, 100, GetDate()), DateAdd(ms, -100, GetDate())			--��ǰʱ��: ��100���룬��100����


--DateDiff: ������ʱ���(Diff: Difference)���� - ǰ
--�﷨�ṹ��DateDiff(datepart, startdate, enddate)
Select DateDiff(year, '2014-12-30', '2016-1-1')			--����ʱ������
Select DateDiff(month, '2014-11-30', '2016-1-1')		--����ʱ������
Select DateDiff(day, '2016-1-1', '2014-11-30')			--����ʱ������
Select DateDiff(hour, '2014-11-30', '2016-1-1')			--����ʱ����Сʱ
Select DateDiff(minute, '2016-1-1', '2014-11-30')		--����ʱ��������
Select DateDiff(second, '2014-11-30', '2016-1-1')		--����ʱ��������

--DatePart: ���ص����ڵ�ĳһ���֣��ꡢ�¡��ա�ʱ���֡��롢���룩
--�﷨�ṹ��DatePart(datepart, date)
Select DatePart(year, GetDate())	--�ȼ��� Year(GetDate())
Select DatePart(month, GetDate())	--�ȼ��� Month(GetDate())
Select DatePart(day, GetDate())		--�ȼ��� Day(GetDate())
Select DatePart(hour, GetDate())
Select DatePart(minute, GetDate())
Select DatePart(second, GetDate())
Select DatePart(ms, GetDate())

--Format: ��ʽ������ʱ�����ֵ����ע���˺���ֻ֧��SQLServer2012����߰汾��
--�﷨�ṹ��Format(����ʱ�����ֵ, '��ʽ')
--ʱ���ʽ��
--	�꣺yy��yyyy
--	�£�M
--	�գ�d
--	ʱ��H (24Сʱ��)	h (12Сʱ��)
--	�֣�m
--	�룺s
Select Format(GetDate(), 'yyyy-MM-dd hh:mm:ss')
Select Format(GetDate(), 'yyyy-MM-dd HH:mm:ss')
Select Format(GetDate(), 'yyyy-MM-dd')
Select Format(GetDate(), 'yy-M-d')
Select Format(GetDate(), 'yy.M.d')
Select Format(GetDate(), 'yy��M��d��')

Select Format('2016-7-2 14:40:32', 'yy��M��d��')
--Format()�����ĵ�һ�����������ǡ�����/ʱ�䡱�����֡�������ʹ�������ַ�����
--�鿴SQLServer������ʹ�� FORMAT ����������/ʱ�������ֵ��ʽ��Ϊʶ���������õ��ַ���������һ�������ת���������ʹ�� CAST �� CONVERT��
Select Format(Cast('2016-7-2 14:40:32' as Datetime), 'yy��M��d��')		--16��7��2��
Select Format(Cast('2016-7-2 14:40:32' as Datetime), 'yy��MM��dd��')	--16��07��02��
Select Format(Cast('2016-7-2' as Datetime), 'yy-MM-dd hh:mm:ss')		--16-07-02 12:00:00
Select Format(Cast('2016-7-2' as Datetime), 'yy-MM-dd HH:mm:ss')		--16-07-02 00:00:00

--��ֵ��ʽ��
--	0: ռλ�����������λû�����ݣ�Ҳ��0���㣺
Select Format(1, '00.00')	--01.00
Select Format(12, '0.00')	--12.00
Select Format(12, '000000')	--000012
Select Format(123456, '000')--123456
--	#����λ����з�0ֵ����䣬û�оͺ��ԣ�
Select Format(1, '#.##')	--1
Select Format(0.246, '#.##')--.25
--	0��#��ϴ��䣺
Select Format(1234567, '#,0.00')	--1,234,567.00
Select Format(1234567, '#,0.##')	--1,234,567
Select Format(1234567.199876, '#,0.00')	--1,234,567.20
Select Format(1234567.199876, '#,0.##')	--1,234,567.2
-------------------------------------------------------------------------------


--4��ת��������Cast��Convert��Str��
-------------------------------------------------------------------------------
--��һ����ʽת��
--SQL������������һ�������ͣ�������ͬ���������Ϳ����໥��ֵ�����߻�����㡣
--�磺
--1�������ָ��ַ���������ֵ��
	Declare @s varchar(20)
	Set @s = 12		--'12'
	Select @s + '1'	--'121'
--2�����ַ�������ֵ�ͱ�����ֵ��
	Declare @i Int
	Set @i = '120'	--120
	Select @i + 1	--121
--3���ַ�������ֵ������㣺
	Declare @sNum varchar(20) = '12'	--'12'
	Set @sNum = @sNum + 1				--'13'			
	Select @sNum
--ʵ���ϣ���ͬ�����������ǲ����໥��ֵ���ܻ������ģ�SQLServer֮���Կ��ԣ�
--����Ϊ��͵͵��Ϊ���������ڲ�ת�������ǰ�������Ϊ��֮ν����ʽת������

--���������ˣ���3�����е��ַ���'12'����ֵ1��ӣ�Ϊʲô������ֵ1��ʽת��Ϊ�ַ���'1'����'12'��ӱ��'121'��
--�����漰������������ʽת�����ȼ������⣺�ַ��� < Int < Float�����������������ȼ������SQLServer�����������Ͻ��Ѳ顰�����������ȼ�������
--���Ե����ǻ������ʱ�����ǻ����Ȱ��ַ���'12'ת������ֵ12��������ֵ1��ӽ����13��

--4������������1��
Go
Create Table #Temp (
	MatName varchar(20),--��������	--Mat: Material(���ϣ�����)
	Qty varchar(20)		--����		--Qty: Quantity(����)
	)
Insert Into #Temp(MatName, Qty)
Values('���', '10'), ('����', '1,420'), ('��ʾ��', '50')

Select * From #Temp
Where Qty > 20.3

--��Ϣ 245������ 16��״̬ 1���� 207 ��
--�ڽ� varchar ֵ '1,420' ת������������ int ʱʧ�ܡ�


--Drop Table #Temp
Go

--5����������2����ʧ����
--5.1 ��Int������Float���ͱ�����ֵ��
	Declare @F Float
	Set @F = 10
	Select @F	--���ᵼ��������ʧ

--5.2 ��Float��������Int���ͱ�����ֵ��
	Declare @i Int
	Set @i = 12.3
	Select @i	--��ʧС��λ


--��������ʽת��
--�ڻ������ʱ����ϣ������ֵ1ת��Ϊ�ַ���'1'����'12'��ӵõ�'121'��
--�磺
	Declare @sNum varchar(20) = '12',
		@iNum Int = 1
	Set @sNum = @sNum + Cast(@iNum as varchar(20))
	Select '[' + @sNum + ']'
--��������ʹ����Cast��������������ת��������ͨ��������ȷҪ���������ͷ����仯����Ϊ����Ϊ����ʽת������
--��ʽת��������Cast��Convert��
--1��Cast�﷨��Cast(ԭ���� as ������)
	Select Cast(41923.4 as DateTime)
	Select Cast(41923.4 as varchar(20)) + 'ABC'
	Select Cast(41923.4 as varchar(5))
--��Ϣ 8115������ 16��״̬ 5���� 227 ��
--�� numeric ת��Ϊ�������� varchar ʱ���������������
	Select Cast(GetDate() as varchar(20))
	 
--2��Convert�﷨��Convert(������, ԭ���� [, ��ʽ����])	����ʽ���롱�����ǿ�ѡ������ 
	Select Convert(Datetime, 41923.4)
	Select Convert(varchar(20), 41923.4) + 'ABC'
	Select Convert(varchar(20), GetDate())
--�ɼ�Cast��Convert�����Ĺ��������ƣ�д����һ�����������߻���������ģ�
--����1��Cast��ͨ�õ�SQL�﷨���ܿ粻ͬ�����ݿ�ʹ�ã��磺SQLServer��Oracle��MySQL�ȡ�
--		2��Convert�ṩ����������ʽ���롱�Ŀ�ѡ���������ܸ�ǿ���磺
	Select Convert(varchar(20), GetDate(), 2)
	Select Convert(varchar(20), GetDate(), 102)

	Select Convert(varchar(20), GetDate(), 12)
	Select Convert(varchar(20), GetDate(), 112)

	Select Convert(varchar(20), GetDate(), 120)
--ע��������ʽ�ɲ�����ĵ���

	--��Money�������ͣ��˽⣩
	Declare @m Money = 1234567890.56
	Select Convert(varchar(20), @m, 0)
	Select Convert(varchar(20), @m, 1)
	Select Convert(varchar(20), @m, 2)

--3�����ھ�����ʧ
--�����ַ�����Ӧ�����ݵ�����������ת����Ŀ�����ͳ��Ȳ�ͬ�Ļ����ͻᱨ�������
--�磺
	Select Cast('12.3' as Int)
--��Ϣ 245������ 16��״̬ 1���� 236 ��
--�ڽ� varchar ֵ '12.3' ת������������ int ʱʧ�ܡ�


--��������Щ�������Ϳ�����ʽת������Щֻ����ʽת������Щ����ת����
--���SQLServer�����ĵ���

--���ģ�ʹ�ý���
--1���ڴ��������Ĳ�ѯ�У���ʽת��ͨ������������������⣬������ǽ����Ҿ����ܵ�ʹ����ʽת����
--2����ʽת��ͨ��ʹ��Cast()����������Ҫ��ʽ��ʾʱ����ʹ��Convert()������
--3����������ѯ����ʱ�������ܶԱ��ʽ����ʹ����ʽת����ʹ�����ֶ�����һ�¡��磺
Go
	Declare @iNum Int = 20
	Select * From #Temp
	Where Qty > Cast(@iNum as varchar(20))


----�ַ���Ҳ�ǱȽϵ�
--	if 'a' < 'b'	--��Ӧ��Ascii����97 < 98��
--	if 'abc' < 'abf'
--	if 'abcdddd' < 'abfaaaa'

--	������Ҫ���ֶ�ʹ����ʽת����ʹ�ֶ���������ʽһ�£�����ʽ���㣬�磺
	Select * From #Temp
	Where Cast(Qty as Int) > 20
--	�������10000����¼�����ҪCast()ת��һ��Σ�����������Ա��ʽ������ʽת��ֻת��һ�Σ�

Go


--�岥�������ַ�������������˽⣩��
------------------------------------------------------------------------------------------
	Create Table #Letters (
		Name varchar(10),
		RecID Int Identity
		)
	Go
	Insert Into #Letters(Name)
	Values('A'), ('B'), ('C'), ('a'), ('b'), ('c')
	Go

	--��ѯ
	Select * From #Letters
	Where Name = 'a' 
	--���֣���Сд��ĸ'a'��'A'�����������

	Select * From #Letters
	Order By Name
	--���֣���Сд��ĸ�����޹���

	--���ִ�Сд��
	Select * From #Letters
	Where Name = 'a' Collate Chinese_PRC_CS_AS

	Select * From #Letters
	Where Name = 'A' Collate Chinese_PRC_CS_AS

	Select * From #Letters
	Order By Name Collate Chinese_PRC_CS_AS


	--���ۣ�
	--1��Ĭ������£���ͬ��ĸ�ǲ����ִ�Сд������ƴ������
		if 'a' < 'A' Print '����' Else Print '������'
		if 'a' > 'A' Print '����' Else Print '������'
		if 'a' = 'A' Print '����' Else Print '������'
	--2�����Ҫ����ĳ��SQL��������򣬿�ʹ��Collate�ؼ��֡�
	--3��Ĭ�����������������ݿ�ġ�ѡ������ø��ġ�

	--��������������ʾ��
	Go
	Create Table #Words (
		Name varchar(10),
		RecID Int Identity
		)
	Go
	Insert Into #Words(Name)
	Values('��'), ('��'), ('һ'), ('��'), ('��')
	Go

	Select * From #Words
	Order by Name		--Ĭ�ϰ�ƴ������

	Select * From #Words
	Order by Name Collate Chinese_PRC_Stroke_CS_AS		--���ʻ�����
------------------------------------------------------------------------------------------
Go



--���壩Str�������˽⣩
--Str: ������ת�����ַ���������ָ����С��λ�������룬�����Ҷ��롣��һ�ֱȽ�����ġ���ʽ�����֡�ת��������
--�﷨�ṹ��Str(����, �ܳ���, С��λ����) --char(10)
	Select '[' + Str(123.45678, 10, 2) + ']'	--[    123.46]	�ܳ���10������2λС�����Ҷ���	
	Select '[' + Str(123.45678, 20, 2) + ']'	--[              123.46] �ܳ����ÿո���
	Select '[' + Str(123.45678, 20, 10) + ']'	--[      123.4567800000] С��λ��0����
	Select '[' + Str(1, 10, 4) + ']'			--[    1.0000]

	--�쳣����1
	Select '[' + Str(123.45678, 5, 2) + ']'		--[123.5] �ܳ���5��ֻ�ܱ���1λС��
	Select '[' + Str(123.45678, 2, 2) + ']'		--[**]	�ܳ��Ȳ���С���������ֵĳ��ȣ�������ʾ*

	--�쳣����2 
	Select '[' + Str(123.45678, 10, 0) + ']'	--[       123]
	Select '[' + Str(123.45678, 10, -1) + ']'	--NULL С��λ����>=0�����򷵻�NULL��ע�⣺��Round(123.45678, -1)��ͬ
	
-------------------------------------------------------------------------------


--5���ۺϺ�����Count(*)��Sum��Min��Max��Avg��
-------------------------------------------------------------------------------
--����׼��:
Create Table #Score (
	StudentID varchar(20),	--ѧ��
	StudentName varchar(50),--����
	Gender int,				--�Ա�
	CourseName varchar(50),	--�γ�����
	Score decimal(28, 8)	--�γ̳ɼ�
	)
Insert Into #Score
Values ('001', '����', 1, 'SQLServer', 90),
	('001', '����', 1, 'Delphi', 95),
	('001', '����', 1, '����', NULL),
	('002', '����', 0, 'SQLServer', 60),
	('002', '����', 0, 'Delphi', 65),
	('002', '����', 0, '����', NULL),
	('003', '�绨', 2, 'Delphi', 80)
Go
Select * From #Score

--1������NULL
--NULL�����������Ϊ��ֵ�����־����롰���ַ�������������������ͨ��˵NULLֵ������˵��ֵ��
--ʵ���ϣ�NULL��ʾ�����ڣ������ڵĶ����ǲ��ܱȽϵģ����ԣ�NULL�ǲ��ܲ�������ġ�
--���仰��˵��NULL = NULL, NULL <> NULL ���ǲ������ġ�ͬ��'ABC' <> NULL, 1 <> NULL, 'ABC' = NULL�ȶ��ǲ�������
--���ԣ�
	if NULL = NULL Print '����' Else Print '������'
	if NULL <> NULL Print '����' Else Print '������'
	if 'ABC' <> NULL Print '����' Else Print '������'
	if 1 <> NULL Print '����' Else Print '������'
--���ˣ���Ӧ�����ף�Ϊʲô���κ��ַ��� + NULL ������� NULL���˰ɡ�
--Ҫ�ж�һ�����������ֶ�ֵ���Ƿ�ΪNULL����ȷ�����ǣ�is NULL �� is Not NULL��
--�磺
	Declare @i Int,
		@j Int = 10
	if @i is NULL Print '@i��NULL' Else Print '@i����NULL'
	if @j is Not NULL Print '@j����NULL' Else Print '@j��NULL'


--2��Count: ��ȡ��¼��
Select Count(*) From #Score
Select Count(*) From #Score Where StudentID = '001'
--���⣺��λ�ȡ�м���ѧ����
Select Count(Distinct StudentName) From #Score

--3��Sum: ����������ֵ�ĺ͡�ֻ�����������͵��ֶΡ�
Select Sum(Score) From #Score Where Score is Not NULL	
-----------------------------
--ע������Score <> NULL
Select * From #Score Where Score <> NULL
Select * From #Score Where Score = NULL
-----------------------------
Select Sum(Score) From #Score Where Score is NULL

Select Sum(Score) From #Score
--����: �ۺϻ����� SET ���������� Null ֵ��
--(1 ����Ӱ��)
--���ۣ�Sum()�Ǻ���NULLֵ�ġ�
--		ʵ���ϣ��ۺϺ�������Count()֮�⣬����Sum��Min��Max��Avg��ȫ�����Ǻ���NULLֵ�ġ�

--Count()��ĳЩ�����Ҳ�Ǻ���NULLֵ�ġ�
--	1��Count(*) �������е����������� NULL ֵ���ظ��
--	2��Count(expression) = Count(ALL expression) �����е�ÿһ�ж����� expression �����طǿ�ֵ�������� 
--	3��Count(Distinct expression) �����е�ÿһ�ж����� expression ������Ψһ�ǿ�ֵ�������� 
--���磺
Create Table #tbl (
	ID int,
	Name varchar(20)
	)
Insert Into #tbl(ID, Name)
Values(1, '����'), (2, NULL), (3, '����'), (4, '����')
Go

Select * From #tbl
Select Count(*) From #tbl
Select Count(Name) From #tbl
Select Count(All Name) From #tbl
Select Count(Distinct Name) From #tbl


--����1������г�ÿ��ѧ���ĳɼ��ܺͣ�
Select StudentID, StudentName, Sum(Score) From #Score --??
Group by StudentID, StudentName
Order by StudentID
--ѡ���б��е��� '#Score.StudentID' ��Ч����Ϊ����û�а����ھۺϺ����� GROUP BY �Ӿ��С�

--����2�����ֻ�г��ܳɼ�С��150��ÿ��ѧ���ĳɼ��ܺ�
Select StudentID, StudentName, Sum(Score) From #Score
--Where Sum(Score) < 150
Group by StudentID, StudentName
Having Sum(Score) < 150


--4��Min����ȡ��Сֵ
Select * From #Score Where StudentName = '����' 
Select Min(Score) From #Score
Select Min(Score) From #Score Where StudentID = '001'
--����1�����֪��'����'���ɼ��Ŀ�Ŀ��
Select CourseName, Min(Score) From #Score 
Where StudentName = '����' --??

--��1������ȡ'����'���ɼ���90
Select Min(Score) From #Score Where StudentName = '����'

--��2��������'����'���ҳɼ�����90�ļ�¼
Select CourseName, Score From #Score
Where StudentName = '����' And Score = 90

--��3����ʹ��SQL������90
Select CourseName, Score From #Score
Where StudentName = '����' And Score = (Select Min(Score) From #Score Where StudentName = '����')
--����ʹ��(Select ...)��ν���Ӳ�ѯ����

--(Select ...)�Ӳ�ѯ�����Գ�����Select����У��磺
Select CourseName, Score, (Select Max(Score) From #Score Where StudentName = '����') From #Score 
Where StudentName = '����' And Score = (Select Min(Score) From #Score Where StudentName = '����')

--�岥����̬�����ֶ�
------------------------------------------------------------------------------------
	Select 'ABC' As Letter
	Select 'ABC' As Letter, '�㹽' As WantCry

	Select *, 'ABC' As Letter, '�㹽' As WantCry
	From #Score

	Select * From t_StudentInfo

	Select *, (Select Count(*) From t_StudentInfo b Where b.Score = a.Score) As SameScoreCount,
		 ͬ������ = (Select Count(*) From t_StudentInfo b Where Left(b.StudentName, 1) = Left(a.StudentName, 1))
	From t_StudentInfo a

	Select *, (Select Count(*) From t_StudentInfo Where Score = a.Score) As SameScoreCount,
		(Select Count(*) From t_StudentInfo Where Left(StudentName, 1) = Left(a.StudentName, 1)) As ͬ������
	From t_StudentInfo a
------------------------------------------------------------------------------------
Go


--5��Max: ��ȡ���ֵ
Select Max(Score) From #Score

--����1���г�����ѧ������óɼ���
Select StudentID, StudentName, Max(Score) 
From #Score 
Group by StudentID, StudentName

--����2���г�����ѧ������óɼ�����Ӧ�Ŀ�Ŀ���ƣ�

--�岥�����������ѯ
-------------------------------------------------------------------------------
	--Ա����Ϣ��
	Create Table #EmpInfo (		--Emp: Employee
		EmpID varchar(20),
		EmpName varchar(20),
		DeptID varchar(20)
		)

	--������Ϣ��
	Create Table #DeptInfo (	--Dept: Department
		DeptID varchar(20),
		DeptName varchar(50)
		)
	Go

	Insert Into #EmpInfo(EmpID, EmpName, DeptID)
	Values('001', '����', 'D001'),
		('002', '����', 'D002'),
		('003', '����', 'D003')

	Insert Into #DeptInfo(DeptID, DeptName)
	Values('D001', '�칫��'),
		('D002', '���۲�'),
		('D003', '����')
	Go

	Select * From #EmpInfo 
	Select * From #DeptInfo

	Select *
	From #EmpInfo a, #DeptInfo b
	Where a.DeptID = b.DeptID

	Select a.*, b.DeptName
	From #EmpInfo a, #DeptInfo b
	Where a.DeptID = b.DeptID

	Insert Into #EmpInfo(EmpID, EmpName, DeptID)
	Values('004', 'С��', 'D004')

	Insert Into #DeptInfo(DeptID, DeptName)
	Values('D005', '������')

	Select * From #EmpInfo 
	Select * From #DeptInfo

	--�����ӣ���д������д����
	Select a.*, b.DeptName
	From #EmpInfo a, #DeptInfo b
	Where a.DeptID = b.DeptID

	--�����ӣ���׼д����
	Select a.*, b.DeptName
	From #EmpInfo a Inner Join #DeptInfo b On a.DeptID = b.DeptID

	--��������
	Select a.*, b.DeptName
	From #EmpInfo a Left Join #DeptInfo b On a.DeptID = b.DeptID

	--��������
	Select a.*, b.DeptName
	From #EmpInfo a Right Join #DeptInfo b On a.DeptID = b.DeptID

	--��������
	Select a.*, b.DeptID, b.DeptName
	From #EmpInfo a, #DeptInfo b

	Select a.*, b.DeptID, b.DeptName
	From #EmpInfo a Cross Join #DeptInfo b

	--ȫ������
	Select a.*, b.DeptName
	From #EmpInfo a Full Join #DeptInfo b On a.DeptID = b.DeptID

	--theta����
	Select a.*, b.DeptName
	From #EmpInfo a Inner Join #DeptInfo b On a.DeptID <> b.DeptID

	--�Ա�Left Join���Ӳ�ѯ��Ч����
	Select a.*, (Select DeptName From #DeptInfo Where DeptID = a.DeptID) As DeptName
	From #EmpInfo a
-------------------------------------------------------------------------------


--��������2���г�����ѧ������óɼ�����Ӧ�Ŀ�Ŀ���ƣ�
--��ȡ��ÿ��ѧ������óɼ�
Select StudentID, Max(Score) as MaxScore Into #t_MaxScore From #Score Group by StudentID

Select * From #Score
Select * From #t_MaxScore

--�����ѯ
Select a.StudentID, a.StudentName, a.CourseName, a.Score 
From #Score a, #t_MaxScore b
Where a.StudentID = b.StudentID And a.Score = b.MaxScore

--��ʹ����ʱ��������SQLֱ�Ӵ���#t_MaxScore
Select a.StudentID, a.StudentName, a.CourseName, a.Score 
From #Score a, (Select StudentID, Max(Score) as MaxScore From #Score Group by StudentID) b
Where a.StudentID = b.StudentID And a.Score = b.MaxScore


--����2���Ӳ�ѯ����ʱ��Ҫ�����գ�
Select StudentID, StudentName, Max(Score) As MaxScore,
	(Select CourseName From #Score a Where StudentName = b.StudentName And Score = Max(b.Score)) 
From #Score b
Group by StudentID, StudentName



--6��Avg����ƽ��ֵ
Select Avg(Score) From #Score 
--SQLServer�γ̵�ƽ������
Select Avg(Score) From #Score Where CourseName = 'SQLServer'
--ÿ�ſγ̵�ƽ������
Select CourseName, Avg(Score * 1.0) From #Score Group by CourseName


--7�����ʹ��
Select Count(*) As RecCount, Max(Score) As MaxScore, Min(Score) As MinScore, Avg(Score) As AvgScore
From #Score
--Where Score is Not NULL
-------------------------------------------------------------------------------


--6��ϵͳ������
--���ã�Case��IsDate��IsNumeric��IsNULL��NULLIF
--�˽⣺@@RowCount��@@IDentity��IDentity��
-------------------------------------------------------------------------------
--1��Case ... When ...���������������ʽ
--�﷨�ṹ1��
--	Case ����(���ֶ�) 
--		When ֵ1 Then ���1 
--		When ֵ2 Then ���2
--		...
--		Else �������
--	End
--Ϊ�Ա��ֶ���ʾ����Ů��:
	Select StudentName, Gender, 
		GenderText = Case Gender When 0 Then 'Ů'
								When 1 Then '��'
								Else '����'
					End --As GenderText
	From #Score

	Select * From #Score

--�﷨�ṹ2��
--	Case When �������ʽ1 Then ���1 
--		When �������ʽ2 Then ���2
--		...
--		Else �������
--	End
	Select StudentName,  
		Case When Gender = 0 Then 'Ů'
			When Gender = 1 Then '��'
			Else '����'
		End As GenderText
	From #Score

--Case����������ʹ����Ч���ʽ�����������Ӿ䡣
--���磬������ Select��Update��Delete �� Set ������Լ� In��Where��Order by �� Having ���Ӿ���ʹ�� Case��

	--����Update��
	Update a
	Set Score = Case When Score > 90 Then Score + 20
					When Score > 70 Then Score + 10
					When Score Is NULL Then NULL
					Else Score - 10
				End
	From #Score a

	--Select * From #Score


	--����Where��
	Select *, 
		Case When Gender = 0 Then 'Ů'
			When Gender = 1 Then '��'
			Else '����'
		End 
	From #Score
	Where Case When Gender = 0 Then 'Ů'
			When Gender = 1 Then '��'
			Else '����'
		End = '��'



	--����Ӧ��
	Declare @i Int,
		@s varchar(50)
	Set @i = 6
	Set @s = Case When @i < 10 And @i > 0 Then '@i��һ����λ����'
				When @i >= 10 Then '@i��һ��ʮλ���ϵ�����'
				Else '@i�������'
			End
	Select @s


--2��IsDate���ж�һ���ַ����Ƿ�Ϊ��Ч�����ڻ�ʱ�䡣���ǣ�����1�����򷵻�0��
Select IsDate('abc')
Select IsDate('2016-2-20')
Select IsDate('20160220')
Select IsDate('16:36:23')
if IsDate('2016-2-20 16:36:23') = 1
	Print '��Чʱ��'
Else
	Print '��Ч'


--3��IsNumeric���ж�һ���ַ����Ƿ�Ϊ��Ч����ֵ�����ǣ�����1�����򷵻�0
Select IsNumeric('ab')
Select IsNumeric('12')
Select IsNumeric('12.34')
Select IsNumeric('1,234.56')	--ע����Castת��������Select Cast('1,234.56' as Float)


--4��IsNULL���������Ĳ����Ƿ�ΪNULLֵ��������ʹ��ָ����ֵ�滻NULL������
Go
--�Ȼع� is NULL ���㣺
----------------------------------------------
Declare @i Int = 0
if @i Is NULL Print 'NULL' Else Print '����NULL'
----------------------------------------------
Select IsNULL(NULL, 'haha')
Select IsNULL('abc', 'haha')
--��ˣ�IsNULL()����ʵ�����ǣ�If First Is NULL Then Second Else First��

Go
--Ӧ���ڱ�����
Declare @i Int
if @i >= 0 Print '@i������'
if IsNULL(@i, 0) >= 0 Print '@i������'

--Ӧ�����ֶΣ�
Select StudentName, CourseName, IsNULL(Score, 0) From #Score


--5��NULLIF���������ָ���ı��ʽ��ȣ��򷵻�NULLֵ�������ȣ����ص�һ������ֵ��
Select NULLIF(22, 12)
Select NULLIF(12, 12)
Select NULLIF('ab', 12)
--��ˣ�NULLIF()����ʵ�����ǣ�If First = Second Then NULL Else First��

--Ӧ��1���óɼ�����90����ʾΪNULLֵ
Select StudentName, CourseName, NULLIF(Score, 90) From #Score Where Score is Not NULL
--Select * From #Score

--Ӧ��2���óɼ�����90��NULL����ʾΪ100�֡�
Select StudentName, CourseName, IsNULL(NULLIF(Score, 90), 100) 
From #Score 
--Where Score is Not NULL

--�ȼ��ڣ�ʹ��Case��ʵ�֣���
Select StudentName, CourseName, 
	Case When Score is NULL or Score = 90 Then 100 Else Score End
From #Score 
--Where Score is Not NULL


--6��ȫ�ֱ���@@RowCount���õ���һSQL���Ӱ���������
Update #Score
Set Score = Score

Select @@RowCount

Select * From #Score Where StudentID = '001'
Select @@RowCount


--7��ȫ�ֱ���@@IDentity���˽⣩���õ���ǰ���Ự���ġ������������еġ��κα�������ɵı�ʶֵ��
Go
Create table #tbl(
	Name varchar(20),
	RecID int Identity	--�Զ��������ֶ�
	)

Insert Into #tbl(Name)
Values('����')
	--, ('����')
Select @@IDENTITY

--Select * From #tbl

Drop Table #tbl
Go


--8��IDentity�������˽⣩��ֻ�����ڴ��� INTO table �Ӿ�� SELECT ����н���ʶ�в��뵽�±��С�
--�﷨�ṹ��IDentity(��������) 
--�������ƣ����� IDENTITY ���������� CREATE TABLE �� ALTER TABLE һ��ʹ�õ� IDENTITY ���ԡ�
Select *, IDentity(int) As MyRecID Into #cyw From #Score
Select * From #cyw


--�ܽ᣺�������ú����⣬���ǻ�ѧ���ˣ�
--1��#��ʱ��
--2����ʽת������ʽת��
--3��NULL�ı���������
--4��ѧ���Ը��ӵ�SQL�������ѯ
--5��Into table������һ�ű������


--��ɡ�
