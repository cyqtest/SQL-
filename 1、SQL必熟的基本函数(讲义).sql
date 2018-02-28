

--------------------------SQL必熟的基本函数------------------------------------
--1、字符串函数：Ascii、Char、CharIndex、Left、Right、SubString、Len、DataLength、Lower、Upper、LTrim、RTrim、Replace、Replicate、Space。
--2、数学函数：Abs、Ceiling、Floor、Pi、Power、Rand、Round。
--3、日期时间函数：GetDate、Year、Month、Day、DateAdd、DateDiff、DatePart、Format。

--4、转换函数：Cast、Convert、Str。
--5、聚合函数：Count(*)、Sum、Min、Max、Avg。

--6、系统函数：Case、IsDate、IsNumeric、IsNULL、NULLIF、@@RowCount、@@IDentity、IDentity。
-------------------------------------------------------------------------------

--1、字符串函数: Ascii、Char、CharIndex、Left、Right、SubString、Len、DataLength、Lower、Upper、LTrim、RTrim、Replace、Replicate、Space。
-------------------------------------------------------------------------------
--Ascii: 返回字符表达式中“最左侧的字符”的 ASCII 代码值。
Select Ascii('a'), Ascii('Abc')		--97, 65

--Char: 把一个ASCII码整数转换为对应的字符。如果没有输入0 ~ 255 之间的ASCII码值，CHAR() 返回NULL。
Select Char(97), Char(65)			--'a', 'A'
--常见应用：Char(13) + Char(10)：表示回车换行
Select '你好，我的名字是：' + Char(13) + Char(10) + '张三！' + Char(13) + Char(10) + '很高兴认识你。'
--比较以下的不同：
Select '你好，我的名字是：' + Char(13) + Char(10) + '张三！' + Char(13) + '很高兴认识你。' + Char(10) + 'ABC'
--在SSMS里，得到显示结果是相同的，因为SSMS对单独的Char(13)和Char(10)进行了优化显示，但是如果你把得到结果复制到“记事本”程序里，就可以看到结果如下：
--		你好，我的名字是：
--		张三！很高兴认识你。ABC
--只有Char(13) + Char(10)才是完整的回车换行，适用于各种程序。

--以网格显示结果
--以文本格式显示结果
--Print

--★输入SQL时，输入函数的左括号，先不要输入右括号关闭，SSMS会有参数提示。
--★输入SQL时，在函数()内部，可按“Ctrl + Shift + 空格”显示函数的参数提示。

--CharIndex: 在一个表达式中搜索另一个表达式并返回其起始位置（如果找到）。如果找不到，返回0。
--语法：CharIndex('子串', '原串'[, 开始查找位置]) ★
Select CharIndex('abc', '213abcde'), CharIndex('abc', 'bcd')	--4, 0


--Left: 返回字符串中从左边开始指定个数的字符。
--Right: 从右边开始
Select Left('abcde', 2), Left('abcde', 3)	--ab, abc
Select Right('abcde', 3)					--cde

--SubString: 截取字符串。语法：SubString('字符串', 起始位置, 截取长度（找多少个字符）)。
--注意：如果“截取长度”超出字符串结尾，则仅截到结尾。
Select SubString('abc', 3, 1), SubString('abc', 3, 2), SubString('abc', 3, 200)		--c, c, c
Select SubString('abcdef', 2, 2)		--'bc'

	--异常：
	Select Substring('abcd', 1, 1)	--a
	Select Substring('abcd', 0, 2)	--a
	Select Substring('abcd', -1, 3)	--a
	Select Substring('abcd', 1, -1)	--Error

--Len: 获取字符串的“字符”长度。【注意】不包含尾随空格。
Select Len('abc'), Len('abc   '), Len('  abc'), Len('   ')			--3, 3, 5, 0
Select Len('中国A广东')			--5

--DataLength: 获取字符串的“字节”长度。
Select DataLength('abc'), DataLength(N'abc')	--3, 6
Select DataLength('abc  '), DataLength('  abc'), DataLength('   ')	--5, 5, 3
Select DataLength('中国A广东')	--9

--Lower: 转换为小写字母
--Upper: 转换为大写字母
Select Lower('aBCDE')				--abcde
Select Upper('aBcde')				--ABCDE

--LTrim: 删除字符串的左侧空格。
--RTrim: 删除字符串的右侧空格。
Select '[' + LTrim('      abc  ') + ']'			--[abc  ]
Select '[' + RTrim('      abc  ') + ']'			--[      abc]
Select '[' + LTrim(RTrim('      abc  ')) + ']'	--[abc]

--Replace: 替换字符串。语法结构：Replace('原字符串', 'A', 'B')。把'原字符串'中的所有'A'替换为'B'。
Select Replace('abcdefghcde', 'cde', 'XXX')  --abXXXfghXXX

--Replicate: 重复n个字符串。
Select Replicate('*', 80)
Select Replicate('中国广东-', 4)
Select Replicate('*', -1)		--【注意】当n为负数是，总是返回NULL

--Space: 得到n个空格
Select '*****' + Space(70) + '*****'
-------------------------------------------------------------------------------


--2、Abs、Ceiling、Floor、Pi、Power、Rand、Round。
-------------------------------------------------------------------------------
--Abs: 返回绝对值(正数)。返回类型: 与参数的数据类型相同。
Select Abs(-2), Abs(2)		--2, 2 返回整型
Select Abs(-2.22)			--2.22 返回decimal

--Ceiling: 向上取整(天花板)
--Floor: 向下取整(地板)
Select Ceiling(123.456), Ceiling(123), Ceiling(123.00000001)		--124, 123, 124
Select Floor(123.999), Floor(123)			--123, 123
Select Ceiling($123.456), Floor($123.999), Floor($0)	--124.00, 123.00, 0.00	$参数: 结果保留2位小数
	--【注意】$后面只能是数字，不能是任何变量、表达式或子查询。	如：以下是错误的：
	Select Floor($(12.12345 - 1))
	Declare @F Decimal(28, 8) = 12.12345 Select Floor($@F)
Go

--Pi: 圆周率。返回类型: Float
Select Pi()   --3.14159265358979

--Power: 指数函数求幂。返回类型: 与第一个参数的数据类型相同。
Select Power(10, 2), Power(10, 3), Power(2, 6)		--100, 1000, 64
Select Power(2.00000000, 0.5), Power(2.00, 0.5), Power(2, 0.5)	--1.41421356, 1.41, 1


--Rand: 生成一个 0 ~ 1（不包括 0 和 1）之间的随机数(Float类型)
Select Rand()
Select Ceiling(Rand() * 100)

--Round: 将数字四舍五入到指定的位数。返回类型: 与第一个参数的数据类型相同。
Select Round(123.152, 1), Round(123.15200, 1), Round(123.15200, 2) 
Select Round(153.152, 0), Round(153.152, -1), Round(153.152, -2)	--如果“小数位”参数为负数，则将数字向小数点左侧舍入
Select Round(153.152, -3)	--当“小数位”的负数超过左侧长度时，返回0

--观察以下现象：
Select 5 / 2	--结果：等于？
Select 5.0 / 2
Select 5 * 1.0 / 2
--应用：
Select Avg(Age) From t_StudentInfo
Select Avg(Age * 1.0) From t_StudentInfo

-------------------------------------------------------------------------------


--3、日期时间函数：GetDate、Year、Month、Day、DateAdd、DateDiff、DatePart、Format。
-------------------------------------------------------------------------------
--GetDate: 得到当前服务器的时间
Select GetDate()

--Year: 返回指定日期的年
Select Year(GetDate())

--Month: 返回指定日期的月份
Select Month(GetDate())

--Day: 返回指定日期的日
Select Day(GetDate())

--DateAdd: 加减日期或时间。
--语法结构：DateAdd(datepart, number, date)
--datepart取值:
--	年: year 或 yyyy 或 yy
--	月: month 或 mm 或 m
--	日: day 或 dd 或 d
--	时: hour 或 hh
--	分: minute 或 mi 或 n
--	秒: second 或 ss 或 s
--	毫秒: millisecond 或 ms
Select DateAdd(year, 1, GetDate()), DateAdd(year, -1, GetDate())			--当前时间: 加1年, 减1年
Select DateAdd(month, 2, GetDate()), DateAdd(month, -2, GetDate())			--当前时间: 加2月，减2月
Select DateAdd(day, 10, GetDate()), DateAdd(day, -10, GetDate())			--当前时间: 加10日，减10日
Select DateAdd(hour, 10, GetDate()), DateAdd(hour, -10, GetDate())			--当前时间: 加10小时，减10小时
Select DateAdd(minute, 10, GetDate()), DateAdd(minute, -10, GetDate())		--当前时间: 加10分钟，减10分钟
Select DateAdd(second, 100, GetDate()), DateAdd(second, -100, GetDate())	--当前时间: 加100秒，减100秒
Select DateAdd(ms, 100, GetDate()), DateAdd(ms, -100, GetDate())			--当前时间: 加100毫秒，减100毫秒


--DateDiff: 求两个时间差(Diff: Difference)：后 - 前
--语法结构：DateDiff(datepart, startdate, enddate)
Select DateDiff(year, '2014-12-30', '2016-1-1')			--两个时间相差几年
Select DateDiff(month, '2014-11-30', '2016-1-1')		--两个时间相差几月
Select DateDiff(day, '2016-1-1', '2014-11-30')			--两个时间相差几日
Select DateDiff(hour, '2014-11-30', '2016-1-1')			--两个时间相差几小时
Select DateDiff(minute, '2016-1-1', '2014-11-30')		--两个时间相差几分钟
Select DateDiff(second, '2014-11-30', '2016-1-1')		--两个时间相差几秒钟

--DatePart: 返回的日期的某一部分（年、月、日、时、分、秒、毫秒）
--语法结构：DatePart(datepart, date)
Select DatePart(year, GetDate())	--等价于 Year(GetDate())
Select DatePart(month, GetDate())	--等价于 Month(GetDate())
Select DatePart(day, GetDate())		--等价于 Day(GetDate())
Select DatePart(hour, GetDate())
Select DatePart(minute, GetDate())
Select DatePart(second, GetDate())
Select DatePart(ms, GetDate())

--Format: 格式化日期时间或数值。【注】此函数只支持SQLServer2012或更高版本。
--语法结构：Format(日期时间或数值, '格式')
--时间格式：
--	年：yy或yyyy
--	月：M
--	日：d
--	时：H (24小时制)	h (12小时制)
--	分：m
--	秒：s
Select Format(GetDate(), 'yyyy-MM-dd hh:mm:ss')
Select Format(GetDate(), 'yyyy-MM-dd HH:mm:ss')
Select Format(GetDate(), 'yyyy-MM-dd')
Select Format(GetDate(), 'yy-M-d')
Select Format(GetDate(), 'yy.M.d')
Select Format(GetDate(), 'yy年M月d日')

Select Format('2016-7-2 14:40:32', 'yy年M月d日')
--Format()函数的第一个参数必须是“日期/时间”或“数字”，不能使用其他字符串。
--查看SQLServer帮助：使用 FORMAT 函数将日期/时间和数字值格式化为识别区域设置的字符串。对于一般的类型转换，请继续使用 CAST 或 CONVERT。
Select Format(Cast('2016-7-2 14:40:32' as Datetime), 'yy年M月d日')		--16年7月2日
Select Format(Cast('2016-7-2 14:40:32' as Datetime), 'yy年MM月dd日')	--16年07月02日
Select Format(Cast('2016-7-2' as Datetime), 'yy-MM-dd hh:mm:ss')		--16-07-02 12:00:00
Select Format(Cast('2016-7-2' as Datetime), 'yy-MM-dd HH:mm:ss')		--16-07-02 00:00:00

--数值格式：
--	0: 占位符，如果所在位没有数据，也用0补足：
Select Format(1, '00.00')	--01.00
Select Format(12, '0.00')	--12.00
Select Format(12, '000000')	--000012
Select Format(123456, '000')--123456
--	#：该位如果有非0值就填充，没有就忽略：
Select Format(1, '#.##')	--1
Select Format(0.246, '#.##')--.25
--	0与#混合搭配：
Select Format(1234567, '#,0.00')	--1,234,567.00
Select Format(1234567, '#,0.##')	--1,234,567
Select Format(1234567.199876, '#,0.00')	--1,234,567.20
Select Format(1234567.199876, '#,0.##')	--1,234,567.2
-------------------------------------------------------------------------------


--4、转换函数：Cast、Convert、Str。
-------------------------------------------------------------------------------
--（一）隐式转换
--SQL的数据类型是一种弱类型，即：不同的数据类型可以相互赋值，或者混合运算。
--如：
--1）用数字给字符串变量赋值：
	Declare @s varchar(20)
	Set @s = 12		--'12'
	Select @s + '1'	--'121'
--2）用字符串给数值型变量赋值：
	Declare @i Int
	Set @i = '120'	--120
	Select @i + 1	--121
--3）字符串与数值混合运算：
	Declare @sNum varchar(20) = '12'	--'12'
	Set @sNum = @sNum + 1				--'13'			
	Select @sNum
--实际上，不同的数据类型是不能相互赋值不能混合运算的，SQLServer之所以可以，
--是因为它偷偷地为我们作了内部转换，我们把这种行为称之谓“隐式转换”。

--那问题来了，第3）题中的字符串'12'与数值1相加，为什么不是数值1隐式转换为字符串'1'再与'12'相加变成'121'？
--这里涉及到数据类型隐式转换优先级的问题：字符串 < Int < Float。更多的类据类型优先级，请查SQLServer帮助（在右上角搜查“数据类型优先级”）。
--所以当它们混合运算时，总是会优先把字符串'12'转换成数值12，再与数值1相加结果得13。

--4）常见的问题1：
Go
Create Table #Temp (
	MatName varchar(20),--物资名称	--Mat: Material(物料，物资)
	Qty varchar(20)		--数量		--Qty: Quantity(数量)
	)
Insert Into #Temp(MatName, Qty)
Values('鼠标', '10'), ('键盘', '1,420'), ('显示器', '50')

Select * From #Temp
Where Qty > 20.3

--消息 245，级别 16，状态 1，第 207 行
--在将 varchar 值 '1,420' 转换成数据类型 int 时失败。


--Drop Table #Temp
Go

--5）常见问题2：损失精度
--5.1 用Int整数给Float类型变量赋值：
	Declare @F Float
	Set @F = 10
	Select @F	--不会导到精度损失

--5.2 用Float浮点数给Int类型变量赋值：
	Declare @i Int
	Set @i = 12.3
	Select @i	--损失小数位


--（二）显式转换
--在混合运算时我们希望把数值1转换为字符串'1'再与'12'相加得到'121'。
--如：
	Declare @sNum varchar(20) = '12',
		@iNum Int = 1
	Set @sNum = @sNum + Cast(@iNum as varchar(20))
	Select '[' + @sNum + ']'
--上面我们使用了Cast函数进行了数据转换。这种通过函数明确要求数据类型发生变化的行为，称为“显式转换”。
--显式转换函数：Cast、Convert。
--1、Cast语法：Cast(原数据 as 新类型)
	Select Cast(41923.4 as DateTime)
	Select Cast(41923.4 as varchar(20)) + 'ABC'
	Select Cast(41923.4 as varchar(5))
--消息 8115，级别 16，状态 5，第 227 行
--将 numeric 转换为数据类型 varchar 时出现算术溢出错误。
	Select Cast(GetDate() as varchar(20))
	 
--2、Convert语法：Convert(新类型, 原数据 [, 样式代码])	“样式代码”参数是可选参数。 
	Select Convert(Datetime, 41923.4)
	Select Convert(varchar(20), 41923.4) + 'ABC'
	Select Convert(varchar(20), GetDate())
--可见Cast与Convert函数的功能是类似，写法不一样。但是两者还是有区别的：
--区别：1）Cast是通用的SQL语法，能跨不同的数据库使用，如：SQLServer、Oracle、MySQL等。
--		2）Convert提供第三个“样式代码”的可选参数，功能更强大。如：
	Select Convert(varchar(20), GetDate(), 2)
	Select Convert(varchar(20), GetDate(), 102)

	Select Convert(varchar(20), GetDate(), 12)
	Select Convert(varchar(20), GetDate(), 112)

	Select Convert(varchar(20), GetDate(), 120)
--注：具体样式可查帮助文档。

	--对Money数据类型（了解）
	Declare @m Money = 1234567890.56
	Select Convert(varchar(20), @m, 0)
	Select Convert(varchar(20), @m, 1)
	Select Convert(varchar(20), @m, 2)

--3、关于精度损失
--凡是字符串对应的内容的数据类型与转换的目标类型长度不同的话，就会报溢出错误。
--如：
	Select Cast('12.3' as Int)
--消息 245，级别 16，状态 1，第 236 行
--在将 varchar 值 '12.3' 转换成数据类型 int 时失败。


--（三）哪些数据类型可以隐式转换？哪些只能显式转换？哪些不能转换？
--请查SQLServer帮助文档。

--（四）使用建议
--1、在大数据量的查询中，隐式转换通常会带来性能慢的问题，因此我们建议大家尽可能地使用显式转换。
--2、显式转换通常使用Cast()函数，当需要样式显示时，才使用Convert()函数。
--3、当用作查询条件时，尽可能对表达式条件使用显式转换，使它与字段类型一致。如：
Go
	Declare @iNum Int = 20
	Select * From #Temp
	Where Qty > Cast(@iNum as varchar(20))


----字符串也是比较的
--	if 'a' < 'b'	--对应的Ascii码是97 < 98。
--	if 'abc' < 'abf'
--	if 'abcdddd' < 'abfaaaa'

--	尽量不要对字段使用显式转换（使字段类型与表达式一致）或表达式运算，如：
	Select * From #Temp
	Where Cast(Qty as Int) > 20
--	假设表有10000条记录，你就要Cast()转换一万次！！！而上面对表达式条件显式转换只转换一次！

Go


--插播：关于字符串的排序规则（了解）：
------------------------------------------------------------------------------------------
	Create Table #Letters (
		Name varchar(10),
		RecID Int Identity
		)
	Go
	Insert Into #Letters(Name)
	Values('A'), ('B'), ('C'), ('a'), ('b'), ('c')
	Go

	--查询
	Select * From #Letters
	Where Name = 'a' 
	--发现：大小写字母'a'和'A'都被查出来了

	Select * From #Letters
	Order By Name
	--发现：大小写字母排序无规律

	--区分大小写：
	Select * From #Letters
	Where Name = 'a' Collate Chinese_PRC_CS_AS

	Select * From #Letters
	Where Name = 'A' Collate Chinese_PRC_CS_AS

	Select * From #Letters
	Order By Name Collate Chinese_PRC_CS_AS


	--结论：
	--1、默认情况下，相同字母是不区分大小写，并按拼音排序。
		if 'a' < 'A' Print '成立' Else Print '不成立'
		if 'a' > 'A' Print '成立' Else Print '不成立'
		if 'a' = 'A' Print '成立' Else Print '不成立'
	--2、如果要更改某句SQL的排序规则，可使用Collate关键字。
	--3、默认排序规则可以在数据库的“选项”中配置更改。

	--更多的排序规则演示：
	Go
	Create Table #Words (
		Name varchar(10),
		RecID Int Identity
		)
	Go
	Insert Into #Words(Name)
	Values('三'), ('田'), ('一'), ('风'), ('二')
	Go

	Select * From #Words
	Order by Name		--默认按拼音排序

	Select * From #Words
	Order by Name Collate Chinese_PRC_Stroke_CS_AS		--按笔划排序
------------------------------------------------------------------------------------------
Go



--（五）Str函数（了解）
--Str: 把数字转换成字符串，根据指定的小数位四舍五入，并且右对齐。是一种比较特殊的“格式化数字”转换函数。
--语法结构：Str(数字, 总长度, 小数位长度) --char(10)
	Select '[' + Str(123.45678, 10, 2) + ']'	--[    123.46]	总长度10，保留2位小数，右对齐	
	Select '[' + Str(123.45678, 20, 2) + ']'	--[              123.46] 总长度用空格补齐
	Select '[' + Str(123.45678, 20, 10) + ']'	--[      123.4567800000] 小数位用0补齐
	Select '[' + Str(1, 10, 4) + ']'			--[    1.0000]

	--异常问题1
	Select '[' + Str(123.45678, 5, 2) + ']'		--[123.5] 总长度5，只能保留1位小数
	Select '[' + Str(123.45678, 2, 2) + ']'		--[**]	总长度不能小于整数部分的长度，否则显示*

	--异常问题2 
	Select '[' + Str(123.45678, 10, 0) + ']'	--[       123]
	Select '[' + Str(123.45678, 10, -1) + ']'	--NULL 小数位必须>=0，否则返回NULL。注意：与Round(123.45678, -1)不同
	
-------------------------------------------------------------------------------


--5、聚合函数：Count(*)、Sum、Min、Max、Avg。
-------------------------------------------------------------------------------
--数据准备:
Create Table #Score (
	StudentID varchar(20),	--学号
	StudentName varchar(50),--姓名
	Gender int,				--性别
	CourseName varchar(50),	--课程名称
	Score decimal(28, 8)	--课程成绩
	)
Insert Into #Score
Values ('001', '张三', 1, 'SQLServer', 90),
	('001', '张三', 1, 'Delphi', 95),
	('001', '张三', 1, '数据', NULL),
	('002', '李四', 0, 'SQLServer', 60),
	('002', '李四', 0, 'Delphi', 65),
	('002', '李四', 0, '数据', NULL),
	('003', '如花', 2, 'Delphi', 80)
Go
Select * From #Score

--1）关于NULL
--NULL常常口语表述为空值，但又经常与“空字符串”混淆，所以我们通常说NULL值，而不说空值。
--实际上，NULL表示不存在，不存在的东西是不能比较的，所以，NULL是不能参与运算的。
--换句话来说：NULL = NULL, NULL <> NULL 都是不成立的。同理：'ABC' <> NULL, 1 <> NULL, 'ABC' = NULL等都是不成立。
--试试：
	if NULL = NULL Print '成立' Else Print '不成立'
	if NULL <> NULL Print '成立' Else Print '不成立'
	if 'ABC' <> NULL Print '成立' Else Print '不成立'
	if 1 <> NULL Print '成立' Else Print '不成立'
--至此，你应该明白，为什么“任何字符串 + NULL 结果等于 NULL”了吧。
--要判断一个变量（或字段值）是否为NULL，正确方法是：is NULL 和 is Not NULL。
--如：
	Declare @i Int,
		@j Int = 10
	if @i is NULL Print '@i是NULL' Else Print '@i不是NULL'
	if @j is Not NULL Print '@j不是NULL' Else Print '@j是NULL'


--2）Count: 获取记录数
Select Count(*) From #Score
Select Count(*) From #Score Where StudentID = '001'
--问题：如何获取有几个学生？
Select Count(Distinct StudentName) From #Score

--3）Sum: 汇总所有数值的和。只用于数字类型的字段。
Select Sum(Score) From #Score Where Score is Not NULL	
-----------------------------
--注意区别：Score <> NULL
Select * From #Score Where Score <> NULL
Select * From #Score Where Score = NULL
-----------------------------
Select Sum(Score) From #Score Where Score is NULL

Select Sum(Score) From #Score
--警告: 聚合或其他 SET 操作消除了 Null 值。
--(1 行受影响)
--结论：Sum()是忽略NULL值的。
--		实际上，聚合函数除了Count()之外，其他Sum、Min、Max、Avg等全部都是忽略NULL值的。

--Count()在某些情况下也是忽略NULL值的。
--	1）Count(*) 返回组中的项数。包括 NULL 值和重复项。
--	2）Count(expression) = Count(ALL expression) 对组中的每一行都计算 expression 并返回非空值的数量。 
--	3）Count(Distinct expression) 对组中的每一行都计算 expression 并返回唯一非空值的数量。 
--例如：
Create Table #tbl (
	ID int,
	Name varchar(20)
	)
Insert Into #tbl(ID, Name)
Values(1, '张三'), (2, NULL), (3, '李四'), (4, '张三')
Go

Select * From #tbl
Select Count(*) From #tbl
Select Count(Name) From #tbl
Select Count(All Name) From #tbl
Select Count(Distinct Name) From #tbl


--问题1：如何列出每个学生的成绩总和？
Select StudentID, StudentName, Sum(Score) From #Score --??
Group by StudentID, StudentName
Order by StudentID
--选择列表中的列 '#Score.StudentID' 无效，因为该列没有包含在聚合函数或 GROUP BY 子句中。

--问题2：如何只列出总成绩小于150的每个学生的成绩总和
Select StudentID, StudentName, Sum(Score) From #Score
--Where Sum(Score) < 150
Group by StudentID, StudentName
Having Sum(Score) < 150


--4）Min：获取最小值
Select * From #Score Where StudentName = '张三' 
Select Min(Score) From #Score
Select Min(Score) From #Score Where StudentID = '001'
--问题1：如何知道'张三'最差成绩的科目？
Select CourseName, Min(Score) From #Score 
Where StudentName = '张三' --??

--第1步：获取'张三'最差成绩：90
Select Min(Score) From #Score Where StudentName = '张三'

--第2步：查找'张三'并且成绩等于90的记录
Select CourseName, Score From #Score
Where StudentName = '张三' And Score = 90

--第3步：使用SQL语句代入90
Select CourseName, Score From #Score
Where StudentName = '张三' And Score = (Select Min(Score) From #Score Where StudentName = '张三')
--这种使用(Select ...)称谓“子查询”。

--(Select ...)子查询还可以出现在Select语句中，如：
Select CourseName, Score, (Select Max(Score) From #Score Where StudentName = '张三') From #Score 
Where StudentName = '张三' And Score = (Select Min(Score) From #Score Where StudentName = '张三')

--插播：动态构造字段
------------------------------------------------------------------------------------
	Select 'ABC' As Letter
	Select 'ABC' As Letter, '香菇' As WantCry

	Select *, 'ABC' As Letter, '香菇' As WantCry
	From #Score

	Select * From t_StudentInfo

	Select *, (Select Count(*) From t_StudentInfo b Where b.Score = a.Score) As SameScoreCount,
		 同姓人数 = (Select Count(*) From t_StudentInfo b Where Left(b.StudentName, 1) = Left(a.StudentName, 1))
	From t_StudentInfo a

	Select *, (Select Count(*) From t_StudentInfo Where Score = a.Score) As SameScoreCount,
		(Select Count(*) From t_StudentInfo Where Left(StudentName, 1) = Left(a.StudentName, 1)) As 同姓人数
	From t_StudentInfo a
------------------------------------------------------------------------------------
Go


--5）Max: 获取最大值
Select Max(Score) From #Score

--问题1：列出所有学生的最好成绩：
Select StudentID, StudentName, Max(Score) 
From #Score 
Group by StudentID, StudentName

--问题2：列出所有学生的最好成绩及对应的科目名称：

--插播：关于联表查询
-------------------------------------------------------------------------------
	--员工信息表
	Create Table #EmpInfo (		--Emp: Employee
		EmpID varchar(20),
		EmpName varchar(20),
		DeptID varchar(20)
		)

	--部门信息表
	Create Table #DeptInfo (	--Dept: Department
		DeptID varchar(20),
		DeptName varchar(50)
		)
	Go

	Insert Into #EmpInfo(EmpID, EmpName, DeptID)
	Values('001', '张三', 'D001'),
		('002', '李四', 'D002'),
		('003', '王五', 'D003')

	Insert Into #DeptInfo(DeptID, DeptName)
	Values('D001', '办公室'),
		('D002', '销售部'),
		('D003', '财务部')
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
	Values('004', '小红', 'D004')

	Insert Into #DeptInfo(DeptID, DeptName)
	Values('D005', '生产部')

	Select * From #EmpInfo 
	Select * From #DeptInfo

	--内链接（简写，常用写法）
	Select a.*, b.DeptName
	From #EmpInfo a, #DeptInfo b
	Where a.DeptID = b.DeptID

	--内链接（标准写法）
	Select a.*, b.DeptName
	From #EmpInfo a Inner Join #DeptInfo b On a.DeptID = b.DeptID

	--左外链接
	Select a.*, b.DeptName
	From #EmpInfo a Left Join #DeptInfo b On a.DeptID = b.DeptID

	--右外链接
	Select a.*, b.DeptName
	From #EmpInfo a Right Join #DeptInfo b On a.DeptID = b.DeptID

	--交叉链接
	Select a.*, b.DeptID, b.DeptName
	From #EmpInfo a, #DeptInfo b

	Select a.*, b.DeptID, b.DeptName
	From #EmpInfo a Cross Join #DeptInfo b

	--全外链接
	Select a.*, b.DeptName
	From #EmpInfo a Full Join #DeptInfo b On a.DeptID = b.DeptID

	--theta链接
	Select a.*, b.DeptName
	From #EmpInfo a Inner Join #DeptInfo b On a.DeptID <> b.DeptID

	--对比Left Join与子查询的效果：
	Select a.*, (Select DeptName From #DeptInfo Where DeptID = a.DeptID) As DeptName
	From #EmpInfo a
-------------------------------------------------------------------------------


--继续问题2：列出所有学生的最好成绩及对应的科目名称：
--先取得每个学生的最好成绩
Select StudentID, Max(Score) as MaxScore Into #t_MaxScore From #Score Group by StudentID

Select * From #Score
Select * From #t_MaxScore

--联表查询
Select a.StudentID, a.StudentName, a.CourseName, a.Score 
From #Score a, #t_MaxScore b
Where a.StudentID = b.StudentID And a.Score = b.MaxScore

--不使用临时表，而是用SQL直接代入#t_MaxScore
Select a.StudentID, a.StudentName, a.CourseName, a.Score 
From #Score a, (Select StudentID, Max(Score) as MaxScore From #Score Group by StudentID) b
Where a.StudentID = b.StudentID And a.Score = b.MaxScore


--方法2：子查询（暂时不要求掌握）
Select StudentID, StudentName, Max(Score) As MaxScore,
	(Select CourseName From #Score a Where StudentName = b.StudentName And Score = Max(b.Score)) 
From #Score b
Group by StudentID, StudentName



--6）Avg：求平均值
Select Avg(Score) From #Score 
--SQLServer课程的平均分数
Select Avg(Score) From #Score Where CourseName = 'SQLServer'
--每门课程的平均分数
Select CourseName, Avg(Score * 1.0) From #Score Group by CourseName


--7）混合使用
Select Count(*) As RecCount, Max(Score) As MaxScore, Min(Score) As MinScore, Avg(Score) As AvgScore
From #Score
--Where Score is Not NULL
-------------------------------------------------------------------------------


--6、系统函数：
--常用：Case、IsDate、IsNumeric、IsNULL、NULLIF
--了解：@@RowCount、@@IDentity、IDentity。
-------------------------------------------------------------------------------
--1）Case ... When ...：多条件多结果表达式
--语法结构1：
--	Case 变量(或字段) 
--		When 值1 Then 结果1 
--		When 值2 Then 结果2
--		...
--		Else 其他结果
--	End
--为性别字段显示“男女”:
	Select StudentName, Gender, 
		GenderText = Case Gender When 0 Then '女'
								When 1 Then '男'
								Else '人妖'
					End --As GenderText
	From #Score

	Select * From #Score

--语法结构2：
--	Case When 条件表达式1 Then 结果1 
--		When 条件表达式2 Then 结果2
--		...
--		Else 其他结果
--	End
	Select StudentName,  
		Case When Gender = 0 Then '女'
			When Gender = 1 Then '男'
			Else '人妖'
		End As GenderText
	From #Score

--Case可用于允许使用有效表达式的任意语句或子句。
--例如，可以在 Select、Update、Delete 和 Set 等语句以及 In、Where、Order by 和 Having 等子句中使用 Case。

	--用在Update中
	Update a
	Set Score = Case When Score > 90 Then Score + 20
					When Score > 70 Then Score + 10
					When Score Is NULL Then NULL
					Else Score - 10
				End
	From #Score a

	--Select * From #Score


	--用在Where中
	Select *, 
		Case When Gender = 0 Then '女'
			When Gender = 1 Then '男'
			Else '人妖'
		End 
	From #Score
	Where Case When Gender = 0 Then '女'
			When Gender = 1 Then '男'
			Else '人妖'
		End = '男'



	--其他应用
	Declare @i Int,
		@s varchar(50)
	Set @i = 6
	Set @s = Case When @i < 10 And @i > 0 Then '@i是一个个位正数'
				When @i >= 10 Then '@i是一个十位以上的正数'
				Else '@i是零或负数'
			End
	Select @s


--2）IsDate：判断一个字符串是否为有效的日期或时间。若是，返回1，否则返回0。
Select IsDate('abc')
Select IsDate('2016-2-20')
Select IsDate('20160220')
Select IsDate('16:36:23')
if IsDate('2016-2-20 16:36:23') = 1
	Print '有效时间'
Else
	Print '无效'


--3）IsNumeric：判断一个字符串是否为有效的数值。若是，返回1，否则返回0
Select IsNumeric('ab')
Select IsNumeric('12')
Select IsNumeric('12.34')
Select IsNumeric('1,234.56')	--注意与Cast转换的区别：Select Cast('1,234.56' as Float)


--4）IsNULL：检测输入的参数是否为NULL值，若是则使用指定的值替换NULL并返回
Go
--先回顾 is NULL 运算：
----------------------------------------------
Declare @i Int = 0
if @i Is NULL Print 'NULL' Else Print '不是NULL'
----------------------------------------------
Select IsNULL(NULL, 'haha')
Select IsNULL('abc', 'haha')
--因此：IsNULL()函数实质上是：If First Is NULL Then Second Else First。

Go
--应用于变量：
Declare @i Int
if @i >= 0 Print '@i是正数'
if IsNULL(@i, 0) >= 0 Print '@i是正数'

--应用于字段：
Select StudentName, CourseName, IsNULL(Score, 0) From #Score


--5）NULLIF：如果两个指定的表达式相等，则返回NULL值。若不等，返回第一个参数值。
Select NULLIF(22, 12)
Select NULLIF(12, 12)
Select NULLIF('ab', 12)
--因此：NULLIF()函数实质上是：If First = Second Then NULL Else First。

--应用1：让成绩等于90的显示为NULL值
Select StudentName, CourseName, NULLIF(Score, 90) From #Score Where Score is Not NULL
--Select * From #Score

--应用2：让成绩等于90或NULL的显示为100分。
Select StudentName, CourseName, IsNULL(NULLIF(Score, 90), 100) 
From #Score 
--Where Score is Not NULL

--等价于（使用Case来实现）：
Select StudentName, CourseName, 
	Case When Score is NULL or Score = 90 Then 100 Else Score End
From #Score 
--Where Score is Not NULL


--6）全局变量@@RowCount：得到上一SQL语句影响的行数。
Update #Score
Set Score = Score

Select @@RowCount

Select * From #Score Where StudentID = '001'
Select @@RowCount


--7）全局变量@@IDentity（了解）：得到当前“会话”的“所有作用域”中的“任何表”最后生成的标识值。
Go
Create table #tbl(
	Name varchar(20),
	RecID int Identity	--自动增长的字段
	)

Insert Into #tbl(Name)
Values('张三')
	--, ('李四')
Select @@IDENTITY

--Select * From #tbl

Drop Table #tbl
Go


--8）IDentity函数（了解）：只用于在带有 INTO table 子句的 SELECT 语句中将标识列插入到新表中。
--语法结构：IDentity(数据类型) 
--尽管类似，但是 IDENTITY 函数不是与 CREATE TABLE 和 ALTER TABLE 一起使用的 IDENTITY 属性。
Select *, IDentity(int) As MyRecID Into #cyw From #Score
Select * From #cyw


--总结：除了内置函数外，我们还学会了：
--1、#临时表
--2、隐式转换、显式转换
--3、NULL的本质与运算
--4、学会稍复杂的SQL，联表查询
--5、Into table复制另一张表的数据


--完成。
