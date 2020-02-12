﻿
EXEC sp_rename 'FapTable.ExtTable', 'MainTable' , 'COLUMN';
update Fapcolumn set ColName='MainTable',colComment='主表', [CtrlType]='REFERENCE', [RefTable]='FapTable', [RefID]='TableName', [RefName]='TableComment', [RefType]='GridReference' where tablename='faptable' and colName='ExtTable'


UPDATE [fapcolumn]
SET [EditAble]=0
WHERE [TableName]='FapTable' AND [ColName]='IsSync'
GO
UPDATE [fapcolumn]
SET [ShowAble]=0
WHERE [TableName]='FapTable' AND [ColName]='SubTable'
GO
UPDATE [fapcolumn]
SET [ShowAble]=1, [EditAble]=1, [CtrlType]='CHECKBOXLIST', [RefTable]='FapTableFeature', [RefID]='Code', [RefCode]='Code', [RefName]='Name'
WHERE [TableName]='FapTable' AND [ColName]='TableFeature'
GO
UPDATE [fapcolumn]
SET [ShowAble]=0
WHERE [TableName]='FapTable' AND [ColName]='IsPagination'
GO
UPDATE [fapcolumn]
SET [NullAble]=0
WHERE [TableName]='FapTable' AND [ColName]='TableType'
GO
UPDATE [fapcolumn]
SET [ShowAble]=1
WHERE [TableName]='FapTable' AND [ColName]='DataInterceptor'
GO
UPDATE [fapcolumn]
SET [NullAble]=0
WHERE [TableName]='FapTable' AND [ColName]='TableCategory'
GO
UPDATE [fapcolumn]
SET [NullAble]=0
WHERE [TableName]='FapTable' AND [ColName]='TableName'
GO
UPDATE [fapcolumn]
SET [NullAble]=0
WHERE [TableName]='FapTable' AND [ColName]='ProductUid'
GO
UPDATE [fapcolumn]
SET [NullAble]=0
WHERE [TableName]='FapTable' AND [ColName]='TableComment'
GO
UPDATE [fapcolumn]
SET [ShowAble]=0
WHERE [TableName]='FapTable' AND [ColName]='IsTree'
GO
UPDATE [fapcolumn]
SET [NullAble]=0
WHERE [TableName]='FapTable' AND [ColName]='TableMode'
GO
UPDATE [fapcolumn]
SET [EditAble]=1
WHERE [TableName]='FapTable' AND [ColName]='DataInterceptor'
GO

UPDATE [faptable]
SET [DataInterceptor]='Fap.Core.Infrastructure.Interceptor.FapTableDataInterceptor,Fap.Core'
WHERE [TableName]='FapTable'
GO
update FapTable set TableFeature='AttachmentFeature:附件特性' where TableFeature='AttachmentFeature'
update FapTable set TableFeature='AttachmentFeature:附件特性;BillFeature:单据特性' where TableFeature='AttachmentFeature,BillFeature'
update FapTable set TableFeature='SortByFeature:排序特性' where TableFeature='SortByFeature'
update FapTable set TableFeature='EmpSubFeature:员工子集特性' where TableFeature='EmpSubFeature'
update FapTable set TableFeature='BillFeature:单据特性' where TableFeature='BillFeature'
update FapTable set TableFeature='InsCaseFeature:保险类特性' where TableFeature='InsCaseFeature'
update FapTable set TableFeature='PayCaseFeature:工资套特性' where TableFeature='PayCaseFeature'
GO
alter table FapTable
alter column TableFeature varchar(128)
GO

UPDATE [FapDict]
SET [Name]='浮点型'
WHERE [Code]='DOUBLE' AND [Category]='ColType'
GO
UPDATE [FapDict]
SET [Name]='二进制'
WHERE [Code]='BLOB' AND [Category]='ColType'
GO
UPDATE [FapDict]
SET [Name]='布尔型'
WHERE [Code]='BOOL' AND [Category]='ColType'
GO
UPDATE [FapDict]
SET [Name]='整型'
WHERE [Code]='INT' AND [Category]='ColType'
GO
UPDATE [FapDict]
SET [Name]='长整型'
WHERE [Code]='LONG' AND [Category]='ColType'
GO
UPDATE [FapDict]
SET [Name]='文本二进制'
WHERE [Code]='CLOB' AND [Category]='ColType'
GO
UPDATE [FapDict]
SET [Name]='字符串'
WHERE [Code]='STRING' AND [Category]='ColType'
GO
UPDATE [FapDict]
SET [Name]='日期时间'
WHERE [Code]='DATETIME' AND [Category]='ColType'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d527' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d52d' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='f41b11e5bd3ecacbc798' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d52b' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d52e' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d52f' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='5fb411e6a8dec3a1b249' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d528' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d51b' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='5fb411e6a8dec3a1b248' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='5fb411e6a8dec3a1b246' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='5fb411e6a8dec3a1b245' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d535' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d529' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d520' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColComment]='是否多选', [ColGroup]='基本信息'
WHERE [Fid]='228b11e6828eb712f30f' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='7c6311e58078247308c2' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d533' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d51a' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d52a' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d522' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d51c' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='5fb411e6a8dec3a1b24d' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='83c011e58a7e044679c4' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d51e' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d524' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d51d' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d531' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='5fb411e6a8dec3a1b24e' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d530' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='1da311e6a75ecae1c38f' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d532' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='5fb411e6a8dec3a1b24c' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='83c011e58a7e0ac10c5c' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d523' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='83d011e6a05cbd502f63' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d51f' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='83c011e58a7e044679c3' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='6ff111e580ff54c0d521' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d534' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='f41b11e5bd3ecacbc799' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='7c5c11e58078cfc7c005' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='基本信息'
WHERE [Fid]='5fb411e6a8dec3a1b247' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件设置'
WHERE [Fid]='6ff111e580ff54c0d52c' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=90, [ShowAble]=0
WHERE [Fid]='6ff111e580ff54c0d51e' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ShowAble]=0
WHERE [Fid]='73b311e5b11118fc216b' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=6
WHERE [Fid]='6ff111e580ff54c0d51f' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=10
WHERE [Fid]='6ff111e580ff54c0d522' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [EditAble]=0
WHERE [Fid]='6ff111e580ff54c0d51a' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=15
WHERE [Fid]='f41b11e5bd3ecacbc799' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=9
WHERE [Fid]='6ff111e580ff54c0d524' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=80
WHERE [Fid]='7c5c11e58078cfc7c005' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=8
WHERE [Fid]='6ff111e580ff54c0d521' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=11
WHERE [Fid]='6ff111e580ff54c0d520' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=7
WHERE [Fid]='6ff111e580ff54c0d51d' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=15
WHERE [Fid]='1da311e6a75ecae1c38f' AND [TableName]='FapColumn'
GO
UPDATE [FapColumn]
SET [ColOrder]=23
WHERE [Fid]='f41b11e5bd3ecacbc799' AND [TableName]='FapColumn'
GO


UPDATE [FapColumn]
SET [ShowAble]=0
WHERE [TableName]='FapColumn' AND [ColName]='MainTable'
GO
UPDATE [FapColumn]
SET [CtrlType]='REFERENCE', [RefTable]='FapTable', [RefID]='TableName', [RefName]='TableComment', [RefType]='GridReference', [ColGroup]='参照控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='RefTable'
GO
UPDATE [FapColumn]
SET [ColGroup]='参照控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='RefReturnMapping'
GO
UPDATE [FapColumn]
SET [ColGroup]='参照控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='RefCols'
GO
UPDATE [FapColumn]
SET [ColGroup]='参照控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='RefCondition'
GO
UPDATE [FapColumn]
SET [CtrlType]='REFERENCE', [RefTable]='FapColumn', [RefID]='ColName', [RefName]='ColComment', [RefCondition]='TableName=''${RefTable}''', [RefType]='GridReference', [ColGroup]='参照控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='RefName'
GO
UPDATE [FapColumn]
SET [ColComment]='参照FID列', [ColGroup]='参照控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='RefID'
GO
UPDATE [FapColumn]
SET [ShowAble]=0
WHERE [TableName]='FapColumn' AND [ColName]='MainTableCol'
GO
UPDATE [FapColumn]
SET [CtrlType]='COMBOBOX', [RefTable]='RefType', [ColGroup]='参照控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='RefType'
GO
UPDATE [FapColumn]
SET [CtrlType]='REFERENCE', [RefTable]='FapColumn', [RefID]='ColName', [RefName]='ColComment', [RefCondition]='TableName=''${RefTable}''', [RefType]='GridReference', [ColGroup]='参照控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='RefCode'
GO

UPDATE [FapColumn]
SET [ColGroup]='数值控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='MaxValue'
GO
UPDATE [FapColumn]
SET [ColGroup]='附件控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='FileCount'
GO
UPDATE [FapColumn]
SET [ShowAble]=0
WHERE [TableName]='FapColumn' AND [ColName]='CalculationExpr'
GO
UPDATE [FapColumn]
SET [ColGroup]='附件控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='FileSuffix'
GO
UPDATE [FapColumn]
SET [ColGroup]='字段校验设置'
WHERE [TableName]='FapColumn' AND [ColName]='RemoteChkMsg'
GO
UPDATE [FapColumn]
SET [ColGroup]='控件显示格式设置'
WHERE [TableName]='FapColumn' AND [ColName]='DisplayFormat'
GO
UPDATE [FapColumn]
SET [ColGroup]='字段校验设置'
WHERE [TableName]='FapColumn' AND [ColName]='RemoteChkURL'
GO
UPDATE [FapColumn]
SET [ColGroup]='附件控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='FileSize'
GO
UPDATE [FapColumn]
SET [ColGroup]='数值控件设置'
WHERE [TableName]='FapColumn' AND [ColName]='MinValue'
GO
UPDATE [FapColumn]
SET [ShowAble]=0
WHERE [TableName]='FapColumn' AND [ColName]='ComponentUid'
GO