alter table ACT_RU_IDENTITYLINK add SCOPE_ID_ nvarchar(255);
alter table ACT_RU_IDENTITYLINK add SCOPE_TYPE_ nvarchar(255);
alter table ACT_RU_IDENTITYLINK add SCOPE_DEFINITION_ID_ nvarchar(255);

create index ACT_IDX_IDENT_LNK_SCOPE on ACT_RU_IDENTITYLINK(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_IDENT_LNK_SCOPE_DEF on ACT_RU_IDENTITYLINK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

alter table ACT_RU_TASK add SUB_TASK_COUNT_ int;
update ACT_RU_TASK set SUB_TASK_COUNT_ = (select count(*) from (select * from ACT_RU_TASK where IS_COUNT_ENABLED_ = 1) as count_table where count_table.PARENT_TASK_ID_ = ID_) where IS_COUNT_ENABLED_ = 1;

update ACT_RU_TIMER_JOB set HANDLER_TYPE_ = 'cmmn-trigger-timer' where HANDLER_TYPE_ = 'trigger-timer' and SCOPE_TYPE_ = 'cmmn';

update ACT_GE_PROPERTY set VALUE_ = '6.3.0.1' where NAME_ = 'identitylink.schema.version';

alter table ACT_RU_TASK add TASK_DEF_ID_ nvarchar(64);

update ACT_GE_PROPERTY set VALUE_ = '6.3.0.1' where NAME_ = 'task.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.3.0.1' where NAME_ = 'variable.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.3.0.1' where NAME_ = 'job.schema.version';

alter table ACT_HI_IDENTITYLINK add SCOPE_ID_ nvarchar(255);
alter table ACT_HI_IDENTITYLINK add SCOPE_TYPE_ nvarchar(255);
alter table ACT_HI_IDENTITYLINK add SCOPE_DEFINITION_ID_ nvarchar(255);

create index ACT_IDX_HI_IDENT_LNK_SCOPE on ACT_HI_IDENTITYLINK(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_HI_IDENT_LNK_SCOPE_DEF on ACT_HI_IDENTITYLINK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

alter table ACT_HI_TASKINST add TASK_DEF_ID_ nvarchar(64);
alter table ACT_RE_DEPLOYMENT add DERIVED_FROM_ varchar(64);
alter table ACT_RE_DEPLOYMENT add DERIVED_FROM_ROOT_ varchar(64);
alter table ACT_RE_PROCDEF add DERIVED_FROM_ varchar(64);
alter table ACT_RE_PROCDEF add DERIVED_FROM_ROOT_ varchar(64);

alter table ACT_RE_PROCDEF add DERIVED_VERSION_ integer not null default 0;

alter table ACT_RE_PROCDEF
    drop constraint ACT_UNIQ_PROCDEF;
    
alter table ACT_RE_PROCDEF
    add constraint ACT_UNIQ_PROCDEF
    unique (KEY_,VERSION_, DERIVED_VERSION_, TENANT_ID_);

update ACT_GE_PROPERTY set VALUE_ = '6.3.0.1' where NAME_ = 'schema.version';


UPDATE [ACT_CMMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.1.5 (192.168.1.5)', [LOCKGRANTED] = '2019-03-13T21:42:04.039' WHERE [ID] = 1 AND [LOCKED] = 0

ALTER TABLE [ACT_CMMN_RU_PLAN_ITEM_INST] ADD [IS_COMPLETEABLE_] [bit]

ALTER TABLE [ACT_CMMN_RU_CASE_INST] ADD [IS_COMPLETEABLE_] [bit]

CREATE NONCLUSTERED INDEX ACT_IDX_PLAN_ITEM_STAGE_INST ON [ACT_CMMN_RU_PLAN_ITEM_INST]([STAGE_INST_ID_])

ALTER TABLE [ACT_CMMN_RU_PLAN_ITEM_INST] ADD [IS_COUNT_ENABLED_] [bit]

ALTER TABLE [ACT_CMMN_RU_PLAN_ITEM_INST] ADD [VAR_COUNT_] [int]

ALTER TABLE [ACT_CMMN_RU_PLAN_ITEM_INST] ADD [SENTRY_PART_INST_COUNT_] [int]

INSERT INTO [ACT_CMMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', GETDATE(), 3, '7:1c0c14847bb4a891aaf91668d14240c1', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', 'EXECUTED', NULL, NULL, '3.5.3', '2509724790')

UPDATE [ACT_CMMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_DMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.1.5 (192.168.1.5)', [LOCKGRANTED] = '2019-03-13T21:42:11.473' WHERE [ID] = 1 AND [LOCKED] = 0

ALTER TABLE [ACT_DMN_HI_DECISION_EXECUTION] ADD [SCOPE_TYPE_] [varchar](255)

INSERT INTO [ACT_DMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', GETDATE(), 3, '7:eed5dec2f94778b62d0b0b4beebc191d', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.5.3', '2509731805')

UPDATE [ACT_DMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_FO_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.1.5 (192.168.1.5)', [LOCKGRANTED] = '2019-03-13T21:42:18.369' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_FO_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_CO_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.1.5 (192.168.1.5)', [LOCKGRANTED] = '2019-03-13T21:42:25.184' WHERE [ID] = 1 AND [LOCKED] = 0

ALTER TABLE [ACT_CO_CONTENT_ITEM] ADD [SCOPE_ID_] [varchar](255)

ALTER TABLE [ACT_CO_CONTENT_ITEM] ADD [SCOPE_TYPE_] [varchar](255)

CREATE NONCLUSTERED INDEX idx_contitem_scope ON [ACT_CO_CONTENT_ITEM]([SCOPE_ID_], [SCOPE_TYPE_])

INSERT INTO [ACT_CO_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', GETDATE(), 2, '7:5aa445d140a638ee432a00c23134dd98', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '3.5.3', '2509745483')

UPDATE [ACT_CO_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1

