-- TWIA Guidewire BillingCenter QA02 Schema (Clean DDL)
-- Database: twia_gwcppre_qa02_bc
-- Extracted: 2026-09-18T19:35:56.034Z
-- Total Tables: 1296

CREATE TABLE IF NOT EXISTS public.bc_account (
  loadcommandid bigint,
  heldforinvoicesending boolean,
  publicid character varying(64),
  createartifacts_ext boolean,
  securityzoneid bigint,
  createtime timestamp without time zone,
  secondtwicepermthinvoicedom integer,
  currency integer,
  firsttwicepermthinvoicedom integer,
  updatetime timestamp without time zone,
  servicetier integer,
  hiddentaccountcontainerid bigint,
  invoicedayofweek integer,
  invoicedayofmonth integer,
  id bigint,
  invoicedeliverytype integer,
  accountnamekanji character varying(255),
  feindenorm character varying(510),
  createuserid bigint,
  dba character varying(255),
  fein character varying(255),
  allocationplanid bigint,
  delinquencystatus integer,
  appeventsyncstatus integer,
  closedate timestamp without time zone,
  accounttype integer,
  beanversion integer,
  retired bigint,
  billinglevel integer,
  chargeheld boolean,
  organizationtypedenorm character varying(510),
  newpolicypaymentdistributable boolean,
  organizationtype character varying(255),
  updateuserid bigint,
  billdateorduedatebilling integer,
  distributionlimittype integer,
  accountnumberdenorm character varying(510),
  segment integer,
  accountnamedenorm character varying(510),
  accountnumber character varying(255),
  delinquencyplanid bigint,
  accountname character varying(255),
  collecting boolean,
  everyotherweekinvoiceanchor timestamp without time zone,
  uwcompany_ext integer,
  collectionagencyid bigint,
  billingplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_accountcontact (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  accountid bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  primarypayer boolean,
  updatetime timestamp without time zone,
  contactid bigint,
  id bigint,
  insuredaccountid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_accountcontactrole (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  role integer,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  accountcontactid bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_accountcontext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  unappliedfundid bigint,
  accountid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  acctnegativewriteoffid bigint,
  updatetime timestamp without time zone,
  transactionid bigint,
  subtype integer,
  id bigint,
  disbursementid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_accountgroup (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  updateuserid bigint,
  mainaccountid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_accountinactivityworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  accountid bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_accountpaymentplan (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  accountid bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  paymentplanid bigint,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_acctcmsnexpenseworkitem (
  loadcommandid bigint,
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  accountid bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_acctcorrespondenceentry (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  acctcorrespondencetype integer,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  accountcontactid bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_acctcurrencygrp (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  currencyingroup integer,
  retired bigint,
  createtime timestamp without time zone,
  ownerid bigint,
  updateuserid bigint,
  foreignentityid bigint,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_acctinvcpolpersnapshot (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  remainingbalance numeric(18,2),
  remainingbalance_cur integer,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  policyperiodid bigint,
  updateuserid bigint,
  currency integer,
  outstandingamount numeric(18,2),
  outstandingamount_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  accountinvoiceid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_acctpmntinst (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_actentdelinqthshlddefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  delinquencyplanid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_activemoneyrcvd (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_activescheduledjob (
  publicid character varying(64),
  jobstarted bigint,
  processtype integer,
  id bigint,
  serverid character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_activity (
  loadcommandid bigint,
  previousgroupid bigint,
  accountid bigint,
  enddate timestamp without time zone,
  assignedbyuserid bigint,
  externallyowned boolean,
  fundstransferid bigint,
  logicalname character varying(255),
  approvalrationale character varying(255),
  documenttemplate character varying(255),
  commpaymentid bigint,
  previousqueueid bigint,
  updatetime timestamp without time zone,
  emailtemplate character varying(255),
  writeoffreversalid bigint,
  workflowid bigint,
  id bigint,
  chargereversalid bigint,
  closeuserid bigint,
  troubleticketid bigint,
  creditreversalid bigint,
  createuserid bigint,
  priority integer,
  closedate timestamp without time zone,
  beanversion integer,
  retired bigint,
  validationlevel integer,
  subject character varying(255),
  accountcontactid bigint,
  updateuserid bigint,
  shortsubject character varying(10),
  approved boolean,
  delinquencyprocessid bigint,
  negativewriteoffrevid bigint,
  advancecmsnpaymentid bigint,
  type integer,
  contactid bigint,
  bonuscmsnpaymentid bigint,
  targetdate timestamp without time zone,
  negativewriteoffid bigint,
  autogenerated boolean,
  escalationdate timestamp without time zone,
  publicid character varying(64),
  lastvieweddate timestamp without time zone,
  createtime timestamp without time zone,
  activityclass integer,
  writeoffid bigint,
  command character varying(1333),
  assignedgroupid bigint,
  policyperiodid bigint,
  creditid bigint,
  mandatory boolean,
  recurring boolean,
  previoususerid bigint,
  assignedqueueid bigint,
  fundstransferreversalid bigint,
  archivepartition bigint,
  escalated boolean,
  status integer,
  producer_ext bigint,
  assigneduserid bigint,
  producerpayabletransferid bigint,
  approvalissue character varying(255),
  subtype integer,
  assignmentdate timestamp without time zone,
  disbursementid bigint,
  activitypatternid bigint,
  description character varying(1333),
  uwcompany_ext integer,
  assignmentstatus integer
);

CREATE TABLE IF NOT EXISTS public.bc_activitypattern (
  loadcommandid bigint,
  escbuscallocpath character varying(255),
  publicid character varying(64),
  createtime timestamp without time zone,
  activityclass integer,
  assignablequeue_ext bigint,
  command character varying(1333),
  ccgenerationallowed_sp boolean,
  targetincludedays integer,
  documenttemplate character varying(255),
  updatetime timestamp without time zone,
  emailtemplate character varying(255),
  escalationbuscaltag integer,
  mandatory boolean,
  escalationhours integer,
  id bigint,
  targetbuscaltag integer,
  automatedonly boolean,
  group_sp bigint,
  recurring boolean,
  targethours integer,
  pcgenerationallowed_sp boolean,
  createuserid bigint,
  priority integer,
  targetbuscallocpath character varying(255),
  beanversion integer,
  targetdays integer,
  retired bigint,
  subject character varying(255),
  escalationdays integer,
  code character varying(60),
  updateuserid bigint,
  shortsubject character varying(10),
  escalationstartpt integer,
  type integer,
  escalationincldays integer,
  description character varying(1333),
  category integer,
  targetstartpoint integer
);

CREATE TABLE IF NOT EXISTS public.bc_actpat_desc_l10n (
  loadcommandid bigint,
  value character varying(1333),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_actpat_ssbj_l10n (
  loadcommandid bigint,
  value character varying(10),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_actpat_subj_l10n (
  loadcommandid bigint,
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_address (
  loadcommandid bigint,
  obfuscatedinternal boolean,
  publicid character varying(64),
  batchgeocode boolean,
  extrafield1 character varying(60),
  extrafield2 character varying(60),
  createtime timestamp without time zone,
  extrafield10 character varying(60),
  addressline1 character varying(60),
  extrafield3 character varying(60),
  addressline2 character varying(60),
  county character varying(60),
  extrafield4 character varying(60),
  addressline3 character varying(60),
  extrafield5 character varying(60),
  citykanji character varying(60),
  spatialpoint public.geography(Point,4326),
  extrafield6 character varying(60),
  addressline2kanji character varying(60),
  extrafield7 character varying(60),
  extrafield8 character varying(60),
  extrafield9 character varying(60),
  state integer,
  addressbookuid character varying(64),
  updatetime timestamp without time zone,
  country integer,
  id bigint,
  createuserid bigint,
  validuntil timestamp without time zone,
  beanversion integer,
  citydenorm character varying(120),
  retired bigint,
  city character varying(60),
  addressline1kanji character varying(60),
  addresstype integer,
  updateuserid bigint,
  cedexbureau character varying(2),
  geocodestatus integer,
  cedex boolean,
  postalcodedenorm character varying(120),
  postalcode character varying(60),
  subtype integer,
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_addressconfiglockedfield (
  publicid character varying(64),
  extrafieldname character varying(255),
  country integer,
  extrafieldvalue character varying(255),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_addresscorrection (
  correctedpostalcode character varying(12),
  publicid character varying(64),
  beanversion integer,
  correctedstate character varying(30),
  addressline1 character varying(60),
  addressline2 character varying(60),
  county character varying(60),
  city character varying(60),
  correctedcountry character varying(30),
  addressid bigint,
  state integer,
  correctedaddressline1 character varying(60),
  correctedaddressline2 character varying(60),
  correctedcounty character varying(60),
  correctedcity character varying(60),
  country integer,
  postalcode character varying(60),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_adminexportdetail (
  createuserid bigint,
  publicid character varying(64),
  adminexportrecord bigint,
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  followreference boolean,
  id bigint,
  entitytype character varying(255),
  updateuserid bigint,
  publicids text
);

CREATE TABLE IF NOT EXISTS public.bc_adminexportpurgeworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  adminexportrecord bigint,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_adminexportrecord (
  createuserid bigint,
  publicid character varying(64),
  exportstatus integer,
  exportaudit bigint,
  beanversion integer,
  createtime timestamp without time zone,
  data bytea,
  admindatafiletype integer,
  updateuserid bigint,
  flattenifexcel boolean,
  updatetime timestamp without time zone,
  exportfilename character varying(255),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_adminexportworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  adminexportrecord bigint,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_adminimportarrayconflict (
  added boolean,
  bean text,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  conflictingfield bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_adminimportconflict (
  createuserid bigint,
  publicid character varying(64),
  entitypublicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  entitydisplayname character varying(255),
  overwrite boolean,
  updateuserid bigint,
  importrecord bigint,
  updatetime timestamp without time zone,
  id bigint,
  entitytype character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_adminimporterror (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  importrecord bigint,
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  updateuserid bigint,
  errormessage character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bc_adminimportfieldconflict (
  arrayfield boolean,
  createuserid bigint,
  publicid character varying(64),
  existingvalue character varying(1333),
  beanversion integer,
  createtime timestamp without time zone,
  importvalue character varying(1333),
  updateuserid bigint,
  updatetime timestamp without time zone,
  importconflict bigint,
  field character varying(255),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_adminimportpurgeworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  importrecord bigint,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_adminimportrecord (
  importfile bytea,
  createuserid bigint,
  publicid character varying(64),
  simulatedimport boolean,
  filename character varying(255),
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  numdeleted integer,
  numupdated integer,
  updatetime timestamp without time zone,
  filetype integer,
  importaudit bigint,
  importstatus integer,
  id bigint,
  deleteifmissing boolean,
  numinserted integer,
  conflictresolution integer
);

CREATE TABLE IF NOT EXISTS public.bc_adminimportworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  importrecord bigint,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_advanceexpirationworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  advancecmsnpaymentid bigint,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_agblsusppmntworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  basesuspdistitemid bigint,
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_agencybillcycle (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  producerid bigint,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  statementinvoiceid bigint,
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_agencycycleprocess (
  loadcommandid bigint,
  pastdueexceptiongenerated boolean,
  publicid character varying(64),
  statementsent boolean,
  createtime timestamp without time zone,
  paymentpastduecomments character varying(1333),
  currency integer,
  genpromiseexceptiondate timestamp without time zone,
  promiseexceptiondismissed boolean,
  sendstatementdate timestamp without time zone,
  senddunning1date timestamp without time zone,
  updatetime timestamp without time zone,
  senddunning2date timestamp without time zone,
  id bigint,
  promisepastduecomments character varying(1333),
  pastdueexceptiondismissed boolean,
  createuserid bigint,
  promiseremindersent boolean,
  beanversion integer,
  retired bigint,
  genpastdueexceptiondate timestamp without time zone,
  updateuserid bigint,
  sendpromisereminderdate timestamp without time zone,
  agencybillcycleid bigint,
  dunning1sent boolean,
  dunning2sent boolean,
  subtype integer,
  promiseexceptiongenerated boolean
);

CREATE TABLE IF NOT EXISTS public.bc_agencydisbpaidcontext (
  loadcommandid bigint,
  agencydisbursementid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  producerid bigint,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  transactionid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_agencymoneyrcvdcontext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  producerid bigint,
  updateuserid bigint,
  currency integer,
  paymentmoneyreceivedid bigint,
  updatetime timestamp without time zone,
  transactionid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_appeventsgraphrootinfo (
  lasttransactionid character varying(255),
  publicid character varying(64),
  graphobjecttype character varying(255),
  graphobjectid character varying(64),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_appeventstest (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_appfrmprom (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_archiveaccountpdrollupctx (
  loadcommandid bigint,
  currency integer,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  chargepatternid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  transactionid bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_archivecmsnrollupctx (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  role integer,
  updatetime timestamp without time zone,
  transactionid bigint,
  producercodeid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_archivedocrefitem (
  referencedentitypublicid character varying(64),
  createuserid bigint,
  root bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  referencedentity character varying(1024),
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_archivedocrefs (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  rootpublicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_archivefailure (
  publicid character varying(64),
  archivefailure character varying(1333),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_archivefailuredetails (
  publicid character varying(64),
  archivefailuredetails text,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_archiveprodpdrollupctx (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  chargepatternid bigint,
  transactionid bigint,
  producercodeid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_archiveworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  item bigint,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_arraydatadist (
  minsize bigint,
  publicid character varying(64),
  arrayname character varying(255),
  maxsize bigint,
  meansize numeric(12,2),
  arrayentityname character varying(255),
  tabledatadistid bigint,
  id bigint,
  mediansize bigint,
  arrayentitytablename character varying(255),
  numnonnull bigint
);

CREATE TABLE IF NOT EXISTS public.bc_arraysizecntdd (
  publicid character varying(64),
  arraydatadistid bigint,
  distsize bigint,
  distcount bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_assignableforkeydatadist (
  publicid character varying(64),
  meansize numeric(12,2),
  tabledatadistid bigint,
  assignableforkeyname character varying(30),
  id bigint,
  mediansize bigint,
  numnonnull bigint
);

CREATE TABLE IF NOT EXISTS public.bc_assignableforkeysizecntdd (
  publicid character varying(64),
  distsize bigint,
  distcount bigint,
  assignableforkeydatadistid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_assignqueue (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  name character varying(255),
  lockingcolumn integer,
  updateuserid bigint,
  subgroupvisible boolean,
  updatetime timestamp without time zone,
  groupid bigint,
  id bigint,
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_asyncapirequest (
  requeststarttime timestamp without time zone,
  requestacceptedtime timestamp without time zone,
  responsebody bytea,
  publicid character varying(64),
  responseheaders text,
  requestid character varying(128),
  requestquerystring character varying(1333),
  requestmethod character varying(16),
  status integer,
  responsestatus integer,
  requestpath character varying(1333),
  requestcompletiontime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_attr_desc_l10n (
  loadcommandid bigint,
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_attr_name_l10n (
  loadcommandid bigint,
  value character varying(1333),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_attribute (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  active boolean,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  name character varying(255),
  updateuserid bigint,
  updatetime timestamp without time zone,
  type integer,
  id bigint,
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bc_attributeuser (
  loadcommandid bigint,
  publicid character varying(64),
  textfield1 character varying(255),
  datefield1 timestamp without time zone,
  textfield2 character varying(255),
  userid bigint,
  datefield2 timestamp without time zone,
  textfield3 character varying(255),
  datefield3 timestamp without time zone,
  beanversion integer,
  value integer,
  state integer,
  attributeid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_authlp_desc_l10n (
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_authlp_name_l10n (
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_authorityevent (
  negativewriteoffid bigint,
  publicid character varying(64),
  createtime timestamp without time zone,
  writeoffid bigint,
  creditid bigint,
  fundstransferid bigint,
  updatetime timestamp without time zone,
  writeoffreversalid bigint,
  id bigint,
  chargereversalid bigint,
  creditreversalid bigint,
  createuserid bigint,
  userid bigint,
  prodpayablexferautheventid bigint,
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  updateuserid bigint,
  commissionwriteoffid bigint,
  fundsxferreversalautheventid bigint,
  negativewriteoffrevid bigint,
  subtype integer,
  advancecmsnpaymentid bigint,
  disbursementid bigint,
  bonuscmsnpaymentid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_authoritylimit (
  createuserid bigint,
  profileid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  limitamount numeric(18,2),
  limitamount_cur integer,
  limittype integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_authoritylimitprofile (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  name character varying(255),
  description character varying(255),
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_autodisbworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  accountid bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_autosyncworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  mincontactref bigint,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  addressbookuid character varying(64),
  newaddressbookuid character varying(64),
  maxcontactref bigint,
  id bigint,
  checkedoutby character varying(150),
  skip boolean
);

CREATE TABLE IF NOT EXISTS public.bc_basedist (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  writeoffamount numeric(18,2),
  beanversion integer,
  frozenbyarchiving boolean,
  writeoffamount_cur integer,
  retired bigint,
  createtime timestamp without time zone,
  applieddate timestamp without time zone,
  updateuserid bigint,
  distributeddate timestamp without time zone,
  currency integer,
  netdisttoinvoiceitems_cur integer,
  netdistributedtoinvoiceitems numeric(18,2),
  updatetime timestamp without time zone,
  subtype integer,
  id bigint,
  reversaldate timestamp without time zone,
  netinsuspense numeric(18,2),
  netinsuspense_cur integer
);

CREATE TABLE IF NOT EXISTS public.bc_basedistitem (
  loadcommandid bigint,
  reverseddistid bigint,
  publicid character varying(64),
  activedistid bigint,
  createtime timestamp without time zone,
  policyperiodid bigint,
  currency integer,
  updatetime timestamp without time zone,
  producercodeid bigint,
  invoiceitemid bigint,
  id bigint,
  createuserid bigint,
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  applieddate timestamp without time zone,
  updateuserid bigint,
  reverseddate timestamp without time zone,
  commissionamounttoapply numeric(18,2),
  commissionamounttoapply_cur integer,
  grossamounttoapply numeric(18,2),
  disposition integer,
  grossamounttoapply_cur integer,
  subtype integer,
  paymentcomments character varying(255),
  executeddate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_basemoneyreceived (
  loadcommandid bigint,
  publicid character varying(64),
  promisingproducerid bigint,
  invoiceid bigint,
  accountid bigint,
  paymentinstrumentid bigint,
  createtime timestamp without time zone,
  name character varying(255),
  policyperiodid bigint,
  receiveddate timestamp without time zone,
  currency integer,
  basedistid bigint,
  reversalreason integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  refnumberdenorm character varying(510),
  amount_cur integer,
  id bigint,
  refnumber character varying(255),
  userrevfeeoverride_sp integer,
  createuserid bigint,
  unappliedfundid bigint,
  beanversion integer,
  retired bigint,
  applieddate timestamp without time zone,
  reportinggroupid bigint,
  producerid bigint,
  updateuserid bigint,
  batchpayment_sp bigint,
  boacoupontype_ext character varying(255),
  isadjustment_ext boolean,
  subtype integer,
  reversaldate timestamp without time zone,
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bc_basenonrecdistitem (
  loadcommandid bigint,
  createuserid bigint,
  reverseddistid bigint,
  publicid character varying(64),
  activedistid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  matchingpolicyid bigint,
  releaseddate timestamp without time zone,
  updateuserid bigint,
  reverseddate timestamp without time zone,
  commissionamounttoapply numeric(18,2),
  commissionamounttoapply_cur integer,
  currency integer,
  updatetime timestamp without time zone,
  grossamounttoapply numeric(18,2),
  grossamounttoapply_cur integer,
  paymentcomments character varying(255),
  subtype integer,
  policynumber character varying(255),
  id bigint,
  executeddate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_batchpayment (
  createuserid bigint,
  batchnumber character varying(50),
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  batchstatus integer,
  posteddate timestamp without time zone,
  remainingamount numeric(18,2),
  updateuserid bigint,
  remainingamount_cur integer,
  currency integer,
  updatetime timestamp without time zone,
  postedby bigint,
  amount numeric(18,2),
  amount_cur integer,
  id bigint,
  reversaldate timestamp without time zone,
  reversedbyuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_batchpaymententry (
  paymenttype integer,
  publicid character varying(64),
  invoiceid bigint,
  accountid bigint,
  paymentinstrumentid bigint,
  createtime timestamp without time zone,
  policyperiodid bigint,
  currency integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  refnumberdenorm character varying(510),
  id bigint,
  refnumber character varying(255),
  createuserid bigint,
  suspensepaymentid bigint,
  batchpaymentid bigint,
  beanversion integer,
  producerid bigint,
  updateuserid bigint,
  paymentdate timestamp without time zone,
  paymentmoneyreceivedid bigint,
  accountnumber character varying(255),
  policynumber character varying(255),
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bc_batchprocesslease (
  transferrequested bigint,
  publicid character varying(64),
  expired bigint,
  exclusivity bigint,
  created bigint,
  name character varying(255),
  lockingcolumn integer,
  acquired bigint,
  uniqueidlsb bigint,
  expirerequested bigint,
  uniqueidmsb bigint,
  initialarguments bytea,
  leaseowner character varying(255),
  retryfailover bigint,
  id bigint,
  transfertarget character varying(255),
  released bigint,
  failoverstate integer
);

CREATE TABLE IF NOT EXISTS public.bc_batchprocessleasehistory (
  terminationmessage character varying(1333),
  transferrequested bigint,
  terminated bigint,
  publicid character varying(64),
  expired bigint,
  terminationreason integer,
  created bigint,
  name character varying(255),
  lockingcolumn integer,
  replacementidlsb bigint,
  acquired bigint,
  replacementidmsb bigint,
  uniqueidlsb bigint,
  expirerequested bigint,
  uniqueidmsb bigint,
  leaseowner character varying(255),
  id bigint,
  transfertarget character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_beanversiondatadist (
  publicid character varying(64),
  beanversion integer,
  tabledatadistid bigint,
  id bigint,
  beancount bigint
);

CREATE TABLE IF NOT EXISTS public.bc_billinginstruction (
  loadcommandid bigint,
  assessedsurcharge_ext bigint,
  publicid character varying(64),
  holdunbilledpremiumcharges boolean,
  collateralrequirementid bigint,
  cancellationreason character varying(255),
  accountid bigint,
  createtime timestamp without time zone,
  paymentplanid bigint,
  modificationdate timestamp without time zone,
  issuanceaccountid bigint,
  policyid bigint,
  edwassocpolicyperiodid_ext bigint,
  executed boolean,
  renewalaccountid bigint,
  currency integer,
  premiumreportduedateid bigint,
  totalpremium boolean,
  associatedpolicyperiodid bigint,
  updatetime timestamp without time zone,
  priorpolicyperiodid bigint,
  policypaymentplanid bigint,
  id bigint,
  paymentduedate timestamp without time zone,
  specialhandling integer,
  billinginstructiondate timestamp without time zone,
  createuserid bigint,
  finalaudit boolean,
  offernumber character varying(255),
  depositrequirement numeric(18,2),
  depositrequirement_cur integer,
  paymentreceived boolean,
  periodenddate timestamp without time zone,
  beanversion integer,
  archivepartition bigint,
  newpolicyperiodid bigint,
  periodstartdate timestamp without time zone,
  updateuserid bigint,
  newrenewalaccountid bigint,
  subtype integer,
  rewriteaccountid bigint,
  segregatedcollreqid bigint,
  description character varying(255),
  cancellationtype integer,
  policyperiodforclaimid bigint,
  checkpublicid character varying(64),
  biclaimnumber character varying(255),
  payerproducercodeid bigint,
  claimtransactionuri character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bc_bizweek_nam_l10n (
  loadcommandid bigint,
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_blobcoldatadist (
  averagelength numeric(19,0),
  publicid character varying(64),
  minimumlength bigint,
  maximumlength bigint,
  tabledatadistid bigint,
  id bigint,
  numnonnull bigint,
  blobcolname character varying(30)
);

CREATE TABLE IF NOT EXISTS public.bc_booleancoldatadist (
  publicid character varying(64),
  numtrue bigint,
  tabledatadistid bigint,
  booleancolumnname character varying(30),
  id bigint,
  numfalse bigint,
  numnonnull bigint
);

CREATE TABLE IF NOT EXISTS public.bc_breakdownitem (
  createuserid bigint,
  publicid character varying(64),
  commissionable boolean,
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  chargeid bigint,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  subtype integer,
  invoiceitemid bigint,
  id bigint,
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_breakdownsnaptocategory (
  snapshotitemid bigint,
  publicid character varying(64),
  archivepartition bigint,
  categoryid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_breakdowntocategory (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  archivepartition bigint,
  createtime timestamp without time zone,
  retired bigint,
  categoryid bigint,
  id bigint,
  updateuserid bigint,
  breakdownitemid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_brkcattype_name_l10n (
  loadcommandid bigint,
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_broadcastbatch (
  seqno numeric(19,0),
  publicid character varying(64),
  timeinserted timestamp without time zone,
  clusterid character varying(255),
  id bigint,
  messages bytea,
  serverid character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_bulkrestorerecord (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  title character varying(64),
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  description character varying(1333),
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_businessweek (
  loadcommandid bigint,
  thursdaybusinessend timestamp without time zone,
  thursdaybusinessday boolean,
  saturdaybusinessend timestamp without time zone,
  saturdaybusinessday boolean,
  publicid character varying(64),
  wednesdaybusinessend timestamp without time zone,
  wednesdaybusinessday boolean,
  thursdaybusinessstart timestamp without time zone,
  saturdaybusinessstart timestamp without time zone,
  mondaybusinessend timestamp without time zone,
  sundaybusinessend timestamp without time zone,
  name character varying(255),
  mondaybusinessday boolean,
  sundaybusinessday boolean,
  wednesdaybusinessstart timestamp without time zone,
  appliestoallzones boolean,
  mondaybusinessstart timestamp without time zone,
  sundaybusinessstart timestamp without time zone,
  businessdaydemarcation timestamp without time zone,
  id bigint,
  fridaybusinessend timestamp without time zone,
  fridaybusinessday boolean,
  fridaybusinessstart timestamp without time zone,
  businessweekend integer,
  beanversion integer,
  tuesdaybusinessend timestamp without time zone,
  tuesdaybusinessday boolean,
  tuesdaybusinessstart timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_businessweek_zone (
  loadcommandid bigint,
  publicid character varying(64),
  zonetype integer,
  country integer,
  beanversion integer,
  codedenorm character varying(510),
  id bigint,
  code character varying(255),
  businessweekid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_cachestatsrollupsnap (
  averagenummisses bigint,
  publicid character varying(64),
  averagenummisseswhencachefull bigint,
  slicetimestamp timestamp without time zone,
  averagenumhits bigint,
  id bigint,
  averagespaceretained bigint,
  serverid character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_cancellationthshlddefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  delinquencyplanid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_category_name_l10n (
  loadcommandid bigint,
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_charge (
  skipinvoiceitemcreation boolean,
  loadcommandid bigint,
  overridingcmsnableamount_cur integer,
  reversed boolean,
  taccountcontainerid bigint,
  publicid character varying(64),
  writtendate timestamp without time zone,
  createtime timestamp without time zone,
  chargegroup character varying(255),
  billinginstructionid bigint,
  policysectionid bigint,
  currency integer,
  updatetime timestamp without time zone,
  holdreleasedate timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  id bigint,
  totalinstallments integer,
  overridinginvoicestreamid bigint,
  createuserid bigint,
  chargedate timestamp without time zone,
  overridingprimarycmsnrcvrid bigint,
  overridingcommissionableamount numeric(18,2),
  beanversion integer,
  archivepartition bigint,
  originalamount numeric(18,2),
  originalamount_cur integer,
  updateuserid bigint,
  overridingpayercontainerid bigint,
  holdstatus integer,
  layerparty bigint,
  chargepatternid bigint,
  coinsuranceparty bigint
);

CREATE TABLE IF NOT EXISTS public.bc_chargebreakdowncategory (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  categoryidentifier character varying(255),
  beanversion integer,
  categoryname character varying(255),
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  categorytypeid bigint,
  updatetime timestamp without time zone,
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_chargecommission (
  loadcommandid bigint,
  payablecriteria integer,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  chargeid bigint,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  policycommissionid bigint,
  hiddentaccountcontainerid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_chargeinstancecontext (
  loadcommandid bigint,
  createuserid bigint,
  directbillpaymentitemid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  writeoffid bigint,
  agencypaymentitemid bigint,
  chargeid bigint,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  fromproducerid bigint,
  transactionid bigint,
  subtype integer,
  invoiceitemid bigint,
  id bigint,
  fromaccountid bigint,
  chargecommission bigint
);

CREATE TABLE IF NOT EXISTS public.bc_chargeitem (
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_chargepattern (
  chargecode character varying(255),
  createuserid bigint,
  inuse boolean,
  publicid character varying(64),
  priority integer,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  invoicetreatment integer,
  updateuserid bigint,
  internalcharge boolean,
  includedinequitydating boolean,
  taccountownerpatternid bigint,
  periodicity integer,
  taccountslazyloaded boolean,
  reversible boolean,
  updatetime timestamp without time zone,
  chargepatternweight_ext integer,
  subtype integer,
  id bigint,
  category integer,
  chargename character varying(255),
  paymentarrangementeligible boolean
);

CREATE TABLE IF NOT EXISTS public.bc_chargeproratatx (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  earndate timestamp without time zone,
  beanversion integer,
  archivepartition bigint,
  createtime timestamp without time zone,
  chargeid bigint,
  updateuserid bigint,
  currency integer,
  status integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_chargept_nm_l10n (
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_chargereversal (
  createuserid bigint,
  publicid character varying(64),
  reason integer,
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  chargeid bigint,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  reversalrequestowner_ext integer,
  approvalstatus integer,
  updatetime timestamp without time zone,
  requestinguserid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_chargeslicingoverrides (
  loadcommandid bigint,
  downpaymentpercent numeric(5,2),
  downpaymentsecondinstallment integer,
  createuserid bigint,
  publicid character varying(64),
  daysfromrefdatetofirstinstall integer,
  beanversion integer,
  archivepartition bigint,
  createtime timestamp without time zone,
  retired bigint,
  daysfromrefdatetodownpayment integer,
  daysfromrefdatetoonetimecharge integer,
  daysfromrefdatetosecondinstall integer,
  chargeslicingmodifierid bigint,
  updateuserid bigint,
  firstinstallmentafter integer,
  onetimechargeafter integer,
  updatetime timestamp without time zone,
  secondinstallmentafter integer,
  downpaymentafter integer,
  maximumnumberofinstallments integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_checkerworkitem (
  processhistoryid bigint,
  checktype integer,
  publicid character varying(64),
  fingerprint character varying(16),
  priority integer,
  attempts integer,
  creationtime timestamp without time zone,
  lastupdatetime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  workdone boolean,
  dbconsistcheckrunid bigint,
  tablename character varying(63),
  workitemsetid bigint,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_chgbreakdowncategorytype (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  name character varying(255),
  code character varying(255),
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_chgproratatxworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  accountid bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_clearcmsnthresholddefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  agencybillplanid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_cleargrssthresholddefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  agencybillplanid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_clobcoldatadist (
  averagelength numeric(19,0),
  publicid character varying(64),
  minimumlength bigint,
  maximumlength bigint,
  tabledatadistid bigint,
  id bigint,
  numnonnull bigint,
  clobcolname character varying(30)
);

CREATE TABLE IF NOT EXISTS public.bc_clustermemberdata (
  connectionstarted timestamp without time zone,
  publicid character varying(64),
  bgtasksstopped timestamp without time zone,
  plannedshutdowntime timestamp without time zone,
  usersessions integer,
  data bytea,
  configfp character varying(255),
  env character varying(255),
  build character varying(255),
  connectionstopped timestamp without time zone,
  compatibilitywithsource character varying(255),
  plannedshutdowninitiated timestamp without time zone,
  logicalname character varying(255),
  clusterid character varying(255),
  runlevel character varying(255),
  id bigint,
  uuid character varying(36),
  roles character varying(1333),
  serverid character varying(255),
  serverstarted timestamp without time zone,
  lastupdate numeric(19,0)
);

CREATE TABLE IF NOT EXISTS public.bc_cmsnoverridesnapshot (
  rate numeric(5,2),
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  invcitemcancellationsnapshot bigint,
  updateuserid bigint,
  role integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_cmsnpayableworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  producerid bigint,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  policycommissionids text,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_cmsnpaymentworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  delayedcmsnpaymentid bigint,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_cmsnreduction (
  loadcommandid bigint,
  createuserid bigint,
  reversed boolean,
  publicid character varying(64),
  datewrittenoff timestamp without time zone,
  chargewrittenoffid bigint,
  beanversion integer,
  archivepartition bigint,
  createtime timestamp without time zone,
  retired bigint,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  commissionwriteoffid bigint,
  amount numeric(18,2),
  amount_cur integer,
  type integer,
  chargecommissionid bigint,
  id bigint,
  invoiceitemid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_cmsnsp_name_l10n (
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_cmsnsubplansectionrate (
  rate numeric(5,2),
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  role integer,
  updatetime timestamp without time zone,
  commissionsubplanid bigint,
  id bigint,
  sectiontype integer
);

CREATE TABLE IF NOT EXISTS public.bc_coinsuranceparty (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  coinsurancerole integer,
  party bigint,
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  fixedid character varying(64),
  coinsuranceshare numeric(5,2),
  partycode bigint,
  updatetime timestamp without time zone,
  overridingpayercode bigint,
  ourparty boolean,
  id bigint,
  coinsuranceagreement bigint
);

CREATE TABLE IF NOT EXISTS public.bc_collateral (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  accountid bigint,
  chargeheld boolean,
  retired bigint,
  createtime timestamp without time zone,
  totalcashvalueatrequirmnts_cur integer,
  updateuserid bigint,
  currency integer,
  totallocvalue numeric(18,2),
  updatetime timestamp without time zone,
  totallocvalue_cur integer,
  hiddentaccountcontainerid bigint,
  id bigint,
  compliance integer,
  totalcashvalueatrequirements numeric(18,2)
);

CREATE TABLE IF NOT EXISTS public.bc_collateralcontext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  collateralrequirementid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  sourcecollreqid bigint,
  collateralid bigint,
  updatetime timestamp without time zone,
  transactionid bigint,
  subtype integer,
  id bigint,
  disbursementid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_collateralrequirement (
  loadcommandid bigint,
  publicid character varying(64),
  locallocated numeric(18,2),
  locallocated_cur integer,
  createtime timestamp without time zone,
  policyid bigint,
  policyperiodid bigint,
  requirementname character varying(255),
  currency integer,
  collateralid bigint,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  hiddentaccountcontainerid bigint,
  id bigint,
  compliance integer,
  expirationdate timestamp without time zone,
  required numeric(18,2),
  required_cur integer,
  createuserid bigint,
  beanversion integer,
  retired bigint,
  updateuserid bigint,
  segregated boolean,
  cashallocated numeric(18,2),
  cashallocated_cur integer,
  requirementtype integer
);

CREATE TABLE IF NOT EXISTS public.bc_collectionagency (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  subtype integer,
  id bigint,
  name character varying(1333),
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_colleffectiveworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  collateralrequirement bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_collexpirationworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  collateralrequirementid bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_commissionablechargeitem (
  publicid character varying(64),
  chargepatternid bigint,
  beanversion integer,
  commissionsubplanid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_commissionoverride (
  rate numeric(5,2),
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  chargeid bigint,
  updateuserid bigint,
  currency integer,
  role integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  subtype integer,
  invoiceitemid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_commissionpayment (
  paymenttype integer,
  loadcommandid bigint,
  archivedplcycommissionpublicid character varying(64),
  publicid character varying(64),
  payon timestamp without time zone,
  createtime timestamp without time zone,
  paid boolean,
  commcheckrevreason_ext integer,
  city_ext character varying(60),
  producerpaymentid bigint,
  currency integer,
  paymenttime integer,
  comments_ext character varying(100),
  updatetime timestamp without time zone,
  standardproducercodeid bigint,
  amount numeric(18,2),
  memo1_ext character varying(38),
  amount_cur integer,
  requestinguserid bigint,
  producercodeid bigint,
  postalcode_ext character varying(60),
  id bigint,
  description_ext character varying(33),
  editpayee_ext boolean,
  createuserid bigint,
  tfpa_ovrridmsgcreation_ext boolean,
  expired boolean,
  beanversion integer,
  retired bigint,
  addressline1_ext character varying(60),
  addressline2_ext character varying(60),
  producerid bigint,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  maintainuntil timestamp without time zone,
  state_ext integer,
  payeename_ext character varying(74),
  approvalstatus integer,
  policycommissionid bigint,
  country_ext integer,
  subtype integer,
  couriercode_ext integer
);

CREATE TABLE IF NOT EXISTS public.bc_commissionplantier (
  tier integer,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  commissionplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_commissionsubplan (
  allsegments boolean,
  publicid character varying(64),
  subplanorder integer,
  suspendfordelinquency boolean,
  percentagetounearn numeric(5,2),
  allterms boolean,
  createtime timestamp without time zone,
  name character varying(255),
  policytype_ext integer,
  alljurisdictions boolean,
  updatetime timestamp without time zone,
  id bigint,
  assignedrisk integer,
  payablecriteria integer,
  createuserid bigint,
  beanversion integer,
  alllobcodes boolean,
  retired bigint,
  renewalset bigint,
  percentagetoearn numeric(5,2),
  commissionplanid bigint,
  updateuserid bigint,
  allevaluations boolean,
  alluwcompanies boolean,
  subtype integer
);

CREATE TABLE IF NOT EXISTS public.bc_commissionsubplanrate (
  rate numeric(5,2),
  publicid character varying(64),
  role integer,
  beanversion integer,
  commissionsubplanid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_commsubplanchargepattrate (
  rate numeric(5,2),
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  role integer,
  updatetime timestamp without time zone,
  chargepatternid bigint,
  commissionsubplanid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_condcmsnsubplanevaluation (
  publicid character varying(64),
  beanversion integer,
  id bigint,
  evaluation integer,
  condcmsnsubplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_condcmsnsubplanjurisdict (
  jurisdiction integer,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  condcmsnsubplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_condcmsnsubplanlobcode (
  publicid character varying(64),
  beanversion integer,
  id bigint,
  lobcode integer,
  condcmsnsubplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_condcmsnsubplansegment (
  segment integer,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  condcmsnsubplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_condcmsnsubplanuwcompany (
  publicid character varying(64),
  beanversion integer,
  id bigint,
  uwcompany integer,
  condcmsnsubplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_contact (
  loadcommandid bigint,
  preferred boolean,
  obfuscatedinternal boolean,
  vendortype integer,
  faxphonecountry integer,
  particle character varying(30),
  taxid character varying(30),
  namedenorm character varying(120),
  name character varying(60),
  vendornumber character varying(60),
  prefix integer,
  score integer,
  preferredcurrency integer,
  donotdestroy boolean,
  lastnamekanji character varying(30),
  taxfilingstatus integer,
  updatetime timestamp without time zone,
  id bigint,
  withholdingrate numeric(5,2),
  lastnamedenorm character varying(60),
  middlename character varying(30),
  lastname character varying(30),
  createuserid bigint,
  externalid character varying(60),
  beanversion integer,
  venuetype integer,
  retired bigint,
  validationlevel integer,
  primaryphone integer,
  updateuserid bigint,
  homephoneextension character varying(60),
  firstnamedenorm character varying(60),
  sexassignedatbirth integer,
  firstname character varying(30),
  firstnamekanji character varying(30),
  gender integer,
  notes text,
  numdependentsu18 integer,
  publicid character varying(64),
  pronounpossessivetext character varying(30),
  homephonecountry integer,
  createtime timestamp without time zone,
  licensenumber character varying(20),
  autosync integer,
  cellphonecountry integer,
  occupation character varying(80),
  cellphone character varying(30),
  primaryaddressid bigint,
  suffix integer,
  addressbookuid character varying(64),
  authorizationid character varying(64),
  pronounaggregate integer,
  loadrelatedcontacts boolean,
  emailaddress1 character varying(60),
  numdependents integer,
  dateofbirth timestamp without time zone,
  primarylanguage integer,
  emailaddress2 character varying(60),
  primarylocale integer,
  taxstatus integer,
  numdependentsu25 integer,
  pronounsubjectivetext character varying(30),
  workphoneextension character varying(60),
  maritalstatus integer,
  namekanji character varying(60),
  faxphoneextension character varying(60),
  homephone character varying(30),
  licensestate integer,
  faxphone character varying(30),
  cellphoneextension character varying(60),
  employeenumber character varying(255),
  workphonecountry integer,
  subtype integer,
  formername character varying(30),
  workphone character varying(30),
  pronounobjectivetext character varying(30)
);

CREATE TABLE IF NOT EXISTS public.bc_contactaddress (
  loadcommandid bigint,
  addressbookuid character varying(64),
  publicid character varying(64),
  beanversion integer,
  id bigint,
  contactid bigint,
  addressid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_contactcatsscore (
  loadcommandid bigint,
  obfuscatedinternal boolean,
  score integer,
  addressbookuid character varying(64),
  publicid character varying(64),
  reviewcategory integer,
  beanversion integer,
  id bigint,
  contactid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_contactcontact (
  loadcommandid bigint,
  sourcecontactid bigint,
  relatedcontactid bigint,
  addressbookuid character varying(64),
  publicid character varying(64),
  beanversion integer,
  relationship integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_contactdestructionreq (
  destructiondate timestamp without time zone,
  pddestructionrequest bigint,
  createuserid bigint,
  status integer,
  publicid character varying(64),
  contactpublicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_contactfingerprint (
  loadcommandid bigint,
  contact bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  addressbookfingerprint character varying(40),
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_contacttag (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  addressbookuid character varying(64),
  updatetime timestamp without time zone,
  type integer,
  contactid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_credential (
  loadcommandid bigint,
  obfuscatedinternal boolean,
  createuserid bigint,
  failedattempts integer,
  publicid character varying(64),
  active boolean,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  failedtime timestamp without time zone,
  updateuserid bigint,
  usernamedenorm character varying(508),
  username character varying(254),
  updatetime timestamp without time zone,
  lockdate timestamp without time zone,
  id bigint,
  password character varying(30)
);

CREATE TABLE IF NOT EXISTS public.bc_credit (
  loadcommandid bigint,
  createuserid bigint,
  reversed boolean,
  publicid character varying(64),
  unappliedfundid bigint,
  creditdate timestamp without time zone,
  beanversion integer,
  accountid bigint,
  createtime timestamp without time zone,
  retired bigint,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  currency integer,
  credittype integer,
  approvalstatus integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  requestinguserid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_creditcontext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  accountid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  creditid bigint,
  updatetime timestamp without time zone,
  transactionid bigint,
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_creditreversal (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  creditid bigint,
  creditreversaldate timestamp without time zone,
  approvalstatus integer,
  updatetime timestamp without time zone,
  requestinguserid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_customalpuser (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_customdatadistreq (
  disttype integer,
  publicid character varying(64),
  query text,
  tabledatadistid bigint,
  id bigint,
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bc_customddcolumns (
  columnname character varying(255),
  publicid character varying(64),
  columnorder integer,
  customdatadistrequestid bigint,
  returntypeclassname character varying(255),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_customddresults (
  publicid character varying(64),
  roworder integer,
  resultvalue character varying(255),
  columnorder integer,
  customdatadistrequestid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_databasedatadist (
  assignabledistsbydatecollected boolean,
  typekeydistscollected boolean,
  minorschemaversion integer,
  alltablescollected boolean,
  publicid character varying(64),
  beandistscollected boolean,
  stagingtabledistscollected boolean,
  forkeydistscollected boolean,
  typelisttabledistscollected boolean,
  adhocdistscollected boolean,
  clobdistscollected boolean,
  assignableforkeydistscollected boolean,
  id bigint,
  numthreads integer,
  endtime timestamp without time zone,
  starttime timestamp without time zone,
  appspecificdistscollected boolean,
  platformmajorschemaversion integer,
  booleancoldistscollected boolean,
  arraydistscollected boolean,
  platformminorschemaversion integer,
  blobdistscollected boolean,
  description character varying(1333),
  majorschemaversion integer
);

CREATE TABLE IF NOT EXISTS public.bc_databaseupdatestats (
  updatestatisticssql character varying(1333),
  minorschemaversion integer,
  extensionsschemaversion integer,
  publicid character varying(64),
  endtime timestamp without time zone,
  runnertype integer,
  starttime timestamp without time zone,
  platformmajorschemaversion integer,
  incrementalthresholdpercent integer,
  platformminorschemaversion integer,
  incremental boolean,
  id bigint,
  description character varying(1333),
  majorschemaversion integer
);

CREATE TABLE IF NOT EXISTS public.bc_datachange (
  externalreference character varying(64),
  status integer,
  createuserid bigint,
  executedate timestamp without time zone,
  publicid character varying(64),
  gosu text,
  createdate timestamp without time zone,
  id bigint,
  executeuserid bigint,
  description character varying(1333),
  result text
);

CREATE TABLE IF NOT EXISTS public.bc_datadistqueryexec (
  fingerprint character varying(255),
  publicid character varying(64),
  databasedatadistid bigint,
  endtime timestamp without time zone,
  starttime timestamp without time zone,
  duration numeric(10,3),
  querytext text,
  threadname character varying(1333),
  tablename character varying(63),
  id bigint,
  description text,
  numrows integer
);

CREATE TABLE IF NOT EXISTS public.bc_datageninfo (
  status integer,
  publicid character varying(64),
  action integer,
  buildversion character varying(255),
  id bigint,
  description character varying(1333),
  performdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_datageninfodetail (
  numindents integer,
  publicid character varying(64),
  id bigint,
  description character varying(1333),
  displayorder integer,
  datageninfoid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_dateanalysisdatadist (
  avgrowsperdate numeric(14,2),
  minrowsperdate bigint,
  numdistinctdates bigint,
  publicid character varying(64),
  mnth integer,
  numnonnullnonloadabledates bigint,
  tabledatadistid bigint,
  yr integer,
  id bigint,
  datetimecolumnname character varying(30),
  maxrowsperdate bigint
);

CREATE TABLE IF NOT EXISTS public.bc_datebinneddatadist (
  valuecolumnname character varying(255),
  publicid character varying(64),
  datatype integer,
  tabledatadistid bigint,
  id bigint,
  addlcolumnname character varying(255),
  description character varying(1333),
  datecolumnname character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_datebinneddddatebin (
  enddays integer,
  publicid character varying(64),
  datebinnedddvalueid bigint,
  startdays integer,
  id bigint,
  count bigint
);

CREATE TABLE IF NOT EXISTS public.bc_datebinnedddvalue (
  value character varying(60),
  publicid character varying(64),
  addlvalue character varying(60),
  nullvalues bigint,
  id bigint,
  minimumdate timestamp without time zone,
  maximumdate timestamp without time zone,
  datebinneddatadistid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_datecmsnpayableworkitem (
  loadcommandid bigint,
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  producerid bigint,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  policycommissionids text,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_datespandatadist (
  mindate timestamp without time zone,
  maxdate timestamp without time zone,
  publicid character varying(64),
  tabledatadistid bigint,
  id bigint,
  datecolname character varying(30)
);

CREATE TABLE IF NOT EXISTS public.bc_dbconsistcheckqueryexec (
  publicid character varying(64),
  fingerprint character varying(16),
  sqlfailuremsg text,
  querytoidentifyrows text,
  endtime timestamp without time zone,
  consistencychecktype integer,
  starttime timestamp without time zone,
  duration numeric(10,3),
  querytext text,
  tablename character varying(63),
  dbconsistcheckrunid bigint,
  id bigint,
  description text,
  numrows integer
);

CREATE TABLE IF NOT EXISTS public.bc_dbconsistcheckrun (
  minorschemaversion integer,
  extensionsschemaversion integer,
  publicid character varying(64),
  endtime timestamp without time zone,
  numberofthreads integer,
  totalnumchecks integer,
  starttime timestamp without time zone,
  platformmajorschemaversion integer,
  duration numeric(10,3),
  platformminorschemaversion integer,
  id bigint,
  description character varying(1333),
  majorschemaversion integer
);

CREATE TABLE IF NOT EXISTS public.bc_dbmoneyrcvdcontext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  accountid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  directbillmoneyrcvdid bigint,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  transactionid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_dbmsreport (
  zippedreport bytea,
  publicid character varying(64),
  capturedate timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_dbperfreport (
  perfdownload bytea,
  status integer,
  publicid character varying(64),
  errormessages text,
  endtime timestamp without time zone,
  id bigint,
  description character varying(1333),
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_dbstatsworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  data bytea,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  dbupdatestatsid bigint,
  workdone boolean,
  workitemsetid bigint,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_delinqprocdelayedtrigger (
  publicid character varying(64),
  delayedtriggerdate timestamp without time zone,
  delayedtrigger integer,
  delinquencyprocessid bigint,
  beanversion integer,
  archivepartition bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_delinquencyplanevent (
  delinquencyplanreason bigint,
  relativeorder integer,
  createuserid bigint,
  publicid character varying(64),
  eventname integer,
  triggerbasis integer,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  offsetdays integer,
  automatic boolean,
  updateuserid bigint,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_delinquencyplanreason (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  delinquencyreason integer,
  delinquencyplanid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  workflowtype integer,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_delinquencyprocess (
  loadcommandid bigint,
  previousgroupid bigint,
  publicid character varying(64),
  reason integer,
  accountid bigint,
  createtime timestamp without time zone,
  inceptiondate timestamp without time zone,
  assignedbyuserid bigint,
  exitdate timestamp without time zone,
  assignedgroupid bigint,
  policyperiodid bigint,
  startdate timestamp without time zone,
  currency integer,
  previousqueueid bigint,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  id bigint,
  previoususerid bigint,
  assignedqueueid bigint,
  createuserid bigint,
  helddate timestamp without time zone,
  closedate timestamp without time zone,
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  updateuserid bigint,
  status integer,
  assigneduserid bigint,
  delinquencyplanid bigint,
  subtype integer,
  phase integer,
  assignmentdate timestamp without time zone,
  assignmentstatus integer
);

CREATE TABLE IF NOT EXISTS public.bc_delinquencyprocessevent (
  loadcommandid bigint,
  createuserid bigint,
  relativeorder integer,
  publicid character varying(64),
  eventname integer,
  triggerbasis integer,
  beanversion integer,
  archivepartition bigint,
  createtime timestamp without time zone,
  retired bigint,
  completiontime timestamp without time zone,
  offsetdays integer,
  automatic boolean,
  updateuserid bigint,
  currentdelinquencyprocessid bigint,
  currency integer,
  approvalactivity bigint,
  updatetime timestamp without time zone,
  delinquencyprocessid bigint,
  id bigint,
  exacttargetdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_destinationlease (
  transferrequested bigint,
  publicid character varying(64),
  expired bigint,
  exclusivity bigint,
  created bigint,
  name character varying(255),
  lockingcolumn integer,
  acquired bigint,
  uniqueidlsb bigint,
  expirerequested bigint,
  uniqueidmsb bigint,
  initialarguments bytea,
  leaseowner character varying(255),
  retryfailover bigint,
  id bigint,
  transfertarget character varying(255),
  released bigint,
  failoverstate integer
);

CREATE TABLE IF NOT EXISTS public.bc_destinationleasehistory (
  terminationmessage character varying(1333),
  transferrequested bigint,
  terminated bigint,
  publicid character varying(64),
  expired bigint,
  terminationreason integer,
  created bigint,
  name character varying(255),
  lockingcolumn integer,
  replacementidlsb bigint,
  acquired bigint,
  replacementidmsb bigint,
  uniqueidlsb bigint,
  expirerequested bigint,
  uniqueidmsb bigint,
  leaseowner character varying(255),
  id bigint,
  transfertarget character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_disbfundssliceallocation (
  loadcommandid bigint,
  disbursement bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  unappliedfundslice bigint,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  ismanualallocation boolean,
  currency integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_disbthresholdoverride (
  loadcommandid bigint,
  jurisdiction integer,
  createuserid bigint,
  inuse boolean,
  publicid character varying(64),
  disbursementreason integer,
  thresholdtype integer,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  updateuserid bigint,
  product integer,
  paymentplan bigint,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  servicetier integer,
  id bigint,
  uwcompany integer,
  billingmethod integer,
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_disbthresholdoverrideamt (
  loadcommandid bigint,
  inuse boolean,
  createuserid bigint,
  disbthresholdoverride bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_disbursement (
  agencycyclepaymentid bigint,
  loadcommandid bigint,
  internalcomment character varying(255),
  publicid character varying(64),
  reason integer,
  disbtarget_ext integer,
  accountid bigint,
  paymentinstrumentid bigint,
  createtime timestamp without time zone,
  disbursementaddressid bigint,
  currency integer,
  collateralid bigint,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  voidreason integer,
  refnumberdenorm character varying(510),
  amount_cur integer,
  requestinguserid bigint,
  memo2_ext character varying(255),
  id bigint,
  refnumber character varying(255),
  paytodenorm character varying(510),
  createuserid bigint,
  duedate timestamp without time zone,
  payto character varying(255),
  unappliedfundid bigint,
  closedate timestamp without time zone,
  suspensepaymentid bigint,
  beanversion integer,
  retired bigint,
  disbursementnumber character varying(255),
  reportinggroupid bigint,
  producerid bigint,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  status integer,
  mailto character varying(255),
  address character varying(1333),
  approvalstatus integer,
  otherreason_ext character varying(255),
  memo character varying(255),
  subtype integer,
  phonenumber_ext character varying(18),
  couriercodetype_ext integer
);

CREATE TABLE IF NOT EXISTS public.bc_disbursementoverdefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  billingplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_disbursementworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  disbursementid bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_distcriterionfilter (
  publicid character varying(64),
  allocationplanid bigint,
  distributionfiltertype integer,
  beanversion integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_dlnqleadtimeoverride (
  loadcommandid bigint,
  jurisdiction integer,
  createuserid bigint,
  inuse boolean,
  leadtimetype integer,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  updateuserid bigint,
  product integer,
  paymentplan bigint,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  servicetier integer,
  delinquencyreason integer,
  dayunittype integer,
  id bigint,
  uwcompany integer,
  billingmethod integer,
  expirationdate timestamp without time zone,
  overrideintegervalue integer
);

CREATE TABLE IF NOT EXISTS public.bc_document (
  loadcommandid bigint,
  documentidentifierdenorm character varying(120),
  publicid character varying(64),
  documentidentifier character varying(60),
  portalsecurityrealm_ext character varying(60),
  authordenorm character varying(120),
  accountid bigint,
  namedenorm character varying(160),
  createtime timestamp without time zone,
  dms boolean,
  author character varying(60),
  name character varying(80),
  policyid bigint,
  updatetime timestamp without time zone,
  docuid character varying(255),
  language integer,
  obsolete boolean,
  recipient character varying(60),
  id bigint,
  createuserid bigint,
  section integer,
  beanversion integer,
  retired bigint,
  producerid bigint,
  mimetype character varying(80),
  updateuserid bigint,
  pendingdocuid character varying(255),
  status integer,
  datemodified timestamp without time zone,
  inbound boolean,
  datecreated timestamp without time zone,
  securitytype integer,
  type integer,
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_domaingraphpurgelock (
  publicid character varying(64),
  expires timestamp without time zone,
  id bigint,
  rootinfoid bigint,
  rootinfoname character varying(100)
);

CREATE TABLE IF NOT EXISTS public.bc_dpassignca (
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_dynamic_assign (
  createuserid bigint,
  publicid character varying(64),
  fingerprint character varying(40),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  grouponly boolean,
  lastactivityuserid bigint,
  lockingcolumn integer,
  lastdelinquencyprocessgrpid bigint,
  updateuserid bigint,
  lastreviewgrpid bigint,
  lastreviewuserid bigint,
  updatetime timestamp without time zone,
  lastdelinquencyprocessuserid bigint,
  id bigint,
  lastactivitygrpid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_efundstrackingsystemstate (
  loadcommandid bigint,
  createuserid bigint,
  status integer,
  publicid character varying(64),
  updatetime timestamp without time zone,
  active boolean,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_encryptedcolumnregistry (
  columnname character varying(30),
  tablename character varying(63)
);

CREATE TABLE IF NOT EXISTS public.bc_enhancedfuegrouping (
  loadcommandid bigint,
  createuserid bigint,
  fundssourceid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  context integer,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_enhancedfundssource (
  archivedtransactionpublicid character varying(64),
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  eventdate timestamp without time zone,
  retired bigint,
  createtime timestamp without time zone,
  historical boolean,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  transactionid bigint,
  amount_cur integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_enhancedfunduseevent (
  archivedtransactionpublicid character varying(64),
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  eventdate timestamp without time zone,
  unappliedfundslice bigint,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  context integer,
  currency integer,
  updatetime timestamp without time zone,
  eventgroupingid bigint,
  amount numeric(18,2),
  transactionid bigint,
  amount_cur integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_entityinrestorerec (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  bulkrestorerecordid bigint,
  createtime timestamp without time zone,
  retired bigint,
  bulkrestoreentityid bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_epdrextension (
  createuserid bigint,
  extendedobjectid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  data text,
  id bigint,
  extendedobjectentity character varying(255),
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_epdrobject (
  parenturi character varying(1333),
  createuserid bigint,
  parentobjectid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  data text,
  parententity character varying(255),
  updateuserid bigint,
  updatetime timestamp without time zone,
  resourcename character varying(255),
  id bigint,
  alternatekey character varying(1024)
);

CREATE TABLE IF NOT EXISTS public.bc_epdrpackage (
  createuserid bigint,
  definition text,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  code character varying(255),
  updateuserid bigint,
  controldefinition text
);

CREATE TABLE IF NOT EXISTS public.bc_epdrtypekeyidmapentry (
  typekeyid integer,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  typecode character varying(255),
  beanversion integer,
  typelist character varying(255),
  createtime timestamp without time zone,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_eventdatastorage (
  publicid character varying(64),
  eventdata text,
  eventid character varying(36),
  id bigint,
  creationtime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_eventsyncworkqueue (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  queuetype integer,
  targettype character varying(255),
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  target bigint,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_exchangerate (
  loadcommandid bigint,
  basecurrency integer,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  ratescale integer,
  updateuserid bigint,
  updatetime timestamp without time zone,
  normalizedrate numeric(7,6),
  pricecurrency integer,
  exchangeratesetid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_exchangerateset (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  name character varying(255),
  expiredate timestamp without time zone,
  updateuserid bigint,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  marketrates boolean,
  id bigint,
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bc_exitdelinqthreshlddefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  delinquencyplanid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_exportableadmindata (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  matrixformat character varying(255),
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  name character varying(255),
  updateuserid bigint,
  selectedonentry_ext boolean,
  followreferences_ext boolean,
  selectallrecords_ext boolean
);

CREATE TABLE IF NOT EXISTS public.bc_exportaudit (
  createuserid bigint,
  publicid character varying(64),
  importexportuser bigint,
  completetime timestamp without time zone,
  filename text,
  beanversion integer,
  createtime timestamp without time zone,
  filehash character varying(255),
  admindatafiletype integer,
  updateuserid bigint,
  totalnumberofbeansexported bigint,
  flattenifexcel boolean,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_exportauditdetailrecord (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  numberofbeansexported integer,
  exportaudit bigint,
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  entitytype character varying(255),
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_feeoverride (
  feetype integer,
  loadcommandid bigint,
  jurisdiction integer,
  createuserid bigint,
  inuse boolean,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  updateuserid bigint,
  product integer,
  paymentplan bigint,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  servicetier integer,
  id bigint,
  uwcompany integer,
  billingmethod integer,
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_feeoverrideamt (
  loadcommandid bigint,
  inuse boolean,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  feeoverride bigint,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_forkeydatadist (
  publicid character varying(64),
  foreignkeyname character varying(30),
  ratiofktopkvalues numeric(12,2),
  tabledatadistid bigint,
  foreignkeyentityname character varying(255),
  id bigint,
  numnonnull bigint,
  foreignkeytablename character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_frozenset (
  publicid character varying(64),
  id bigint,
  description character varying(255),
  freezetimestamp timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_ftunappliedfs (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_fullpaydscworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  policyperiodids character varying(1333),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_fundsallotment (
  createuserid bigint,
  publicid character varying(64),
  amountallotted numeric(18,2),
  amountallotted_cur integer,
  beanversion integer,
  createtime timestamp without time zone,
  fundssourcetrackerid bigint,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  fundsusetrackerid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_fundsallotmentworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  accountids character varying(1333),
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_fundstracker (
  trackableid bigint,
  createuserid bigint,
  amountallotteddenorm numeric(18,2),
  amountallotteddenorm_cur integer,
  publicid character varying(64),
  unappliedfundid bigint,
  beanversion integer,
  eventdate timestamp without time zone,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  fullyallotted boolean,
  trackablesourcetype integer,
  subtype integer,
  id bigint,
  trackableusetype integer,
  totalamount numeric(18,2),
  totalamount_cur integer,
  trackablepredatesfundstracking boolean
);

CREATE TABLE IF NOT EXISTS public.bc_fundstrackingenablemarker (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_fundstransfer (
  loadcommandid bigint,
  createuserid bigint,
  targetproducer bigint,
  publicid character varying(64),
  reason integer,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  sourceunappliedfundid bigint,
  sourceproducer bigint,
  updateuserid bigint,
  currency integer,
  approvaldate timestamp without time zone,
  targetunappliedfundid bigint,
  approvalstatus integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  transferdate timestamp without time zone,
  amount_cur integer,
  requestinguserid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_fundstransferreversal (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  fundstransfertransaction bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  reversalreason integer,
  approvalstatus integer,
  updatetime timestamp without time zone,
  requestinguserid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_fxexchangerate (
  rate numeric(15,10),
  loadcommandid bigint,
  basecurrency integer,
  createuserid bigint,
  publicid character varying(64),
  fxexchangeratesetid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  updatetime timestamp without time zone,
  marketdatetime timestamp without time zone,
  pricecurrency integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_fxexchangerateset (
  loadcommandid bigint,
  basecurrency integer,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  ratetype integer,
  id bigint,
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_genericgroupcolumndatadist (
  columnname character varying(30),
  genericgroupdatadistid bigint,
  publicid character varying(64),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_genericgroupcountdatadist (
  groupsize bigint,
  genericgroupdatadistid bigint,
  publicid character varying(64),
  id bigint,
  groupsizecount bigint
);

CREATE TABLE IF NOT EXISTS public.bc_genericgroupdatadist (
  extendeddescription character varying(1333),
  publicid character varying(64),
  optionalpredicate character varying(1333),
  tabledatadistid bigint,
  id bigint,
  description character varying(60)
);

CREATE TABLE IF NOT EXISTS public.bc_geocodeworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  addressid bigint,
  exception text,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_group (
  worldvisible boolean,
  createuserid bigint,
  supervisorid bigint,
  publicid character varying(64),
  securityzoneid bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  validationlevel integer,
  name character varying(100),
  namekanji character varying(100),
  organizationid bigint,
  updateuserid bigint,
  loadfactor integer,
  updatetime timestamp without time zone,
  grouptype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_group_assign (
  createuserid bigint,
  delinquencyprocessload integer,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  lastactivityuserid bigint,
  includesubgroups boolean,
  lockingcolumn integer,
  lastdelinquencyprocessgrpid bigint,
  updateuserid bigint,
  lastreviewgrpid bigint,
  lastreviewuserid bigint,
  activityload integer,
  updatetime timestamp without time zone,
  lastdelinquencyprocessuserid bigint,
  grouptype integer,
  groupid bigint,
  id bigint,
  lastactivitygrpid bigint,
  reviewload integer
);

CREATE TABLE IF NOT EXISTS public.bc_group_name_l10n (
  value character varying(100),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_groupregion (
  loadcommandid bigint,
  publicid character varying(64),
  beanversion integer,
  groupid bigint,
  id bigint,
  regionid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_groupuser (
  loadcommandid bigint,
  publicid character varying(64),
  textfield1 character varying(255),
  textfield2 character varying(255),
  textfield3 character varying(255),
  userid bigint,
  beanversion integer,
  manager boolean,
  loadfactortype integer,
  loadfactor integer,
  member boolean,
  groupid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_groupuser_assign (
  loadcommandid bigint,
  delinquencyprocessload integer,
  publicid character varying(64),
  activityload integer,
  userid bigint,
  beanversion integer,
  groupid bigint,
  id bigint,
  reviewload integer,
  similarassignablecredits integer
);

CREATE TABLE IF NOT EXISTS public.bc_history (
  loadcommandid bigint,
  publicid character varying(64),
  planid bigint,
  countsasactivity boolean,
  eventdate timestamp without time zone,
  accountid bigint,
  amountext numeric(18,2),
  amountext_cur integer,
  writeoffid bigint,
  policyperiodid bigint,
  roletransferred integer,
  ruleuid character varying(255),
  eventtype integer,
  id bigint,
  refnumber character varying(255),
  userid bigint,
  beanversion integer,
  archivepartition bigint,
  customtype integer,
  producerid bigint,
  policytransferid bigint,
  otheraccountid bigint,
  pcusernameext character varying(30),
  transactionid bigint,
  historyuserid bigint,
  subtype integer,
  type integer,
  eventtimestamp timestamp without time zone,
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bc_hold (
  createuserid bigint,
  previousgroupid bigint,
  publicid character varying(64),
  closedate timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  assignedbyuserid bigint,
  assignedgroupid bigint,
  updateuserid bigint,
  assigneduserid bigint,
  previousqueueid bigint,
  updatetime timestamp without time zone,
  id bigint,
  assignmentdate timestamp without time zone,
  previoususerid bigint,
  troubleticketid bigint,
  assignedqueueid bigint,
  assignmentstatus integer
);

CREATE TABLE IF NOT EXISTS public.bc_holdtypeentry (
  createuserid bigint,
  publicid character varying(64),
  releasedate timestamp without time zone,
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  holdtype integer,
  holdid bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_holiday (
  loadcommandid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  name character varying(255),
  appliestoallzones boolean,
  occurrencedate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_holiday_nam_l10n (
  loadcommandid bigint,
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_holiday_tag (
  loadcommandid bigint,
  holidayid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  holidaytagcode integer
);

CREATE TABLE IF NOT EXISTS public.bc_holiday_zone (
  loadcommandid bigint,
  holidayid bigint,
  publicid character varying(64),
  zonetype integer,
  country integer,
  beanversion integer,
  codedenorm character varying(510),
  id bigint,
  code character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_houranalysisdatadist (
  numdistinctdates bigint,
  maxrowsperhour bigint,
  publicid character varying(64),
  numnonnullnonloadabledates bigint,
  numdistincthoursinday bigint,
  mnth integer,
  minrowsperhour bigint,
  avgrowsperhour numeric(14,2),
  yr integer,
  tabledatadistid bigint,
  id bigint,
  datetimecolumnname character varying(30)
);

CREATE TABLE IF NOT EXISTS public.bc_ilconfig (
  enabled boolean,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  singleton boolean
);

CREATE TABLE IF NOT EXISTS public.bc_ilelementconfig (
  enabled boolean,
  publicid character varying(64),
  beanversion integer,
  identifier character varying(255),
  type integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_importaudit (
  createuserid bigint,
  publicid character varying(64),
  importexportuser bigint,
  completetime timestamp without time zone,
  filename text,
  beanversion integer,
  createtime timestamp without time zone,
  filehash character varying(255),
  admindatafiletype integer,
  updateuserid bigint,
  updatetime timestamp without time zone,
  id bigint,
  deleteifmissing boolean
);

CREATE TABLE IF NOT EXISTS public.bc_importauditdetailrecord (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  numupdated integer,
  importaudit bigint,
  updatetime timestamp without time zone,
  numremoved integer,
  id bigint,
  entitytype character varying(255),
  numinserted integer
);

CREATE TABLE IF NOT EXISTS public.bc_inboundchunkworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  inboundrecords bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_inboundfile (
  config character varying(40),
  createuserid bigint,
  checksum character varying(256),
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  status integer,
  loaddate timestamp without time zone,
  updatetime timestamp without time zone,
  archivelocation character varying(512),
  purgedate timestamp without time zone,
  id bigint,
  inputlocation character varying(512),
  errormessage character varying(1024)
);

CREATE TABLE IF NOT EXISTS public.bc_inboundfileconfig (
  createuserid bigint,
  inputdirectory character varying(512),
  publicid character varying(64),
  apicallattempttimeoutsec integer,
  apicalltimeoutsec integer,
  beanversion integer,
  createtime timestamp without time zone,
  filehandlerclass character varying(256),
  archivedirectory character varying(512),
  name character varying(40),
  archives3bucket character varying(128),
  chunksize integer,
  updateuserid bigint,
  archives3prefix character varying(512),
  inputs3bucket character varying(128),
  profilename character varying(128),
  updatetime timestamp without time zone,
  subtype integer,
  id bigint,
  inputs3prefix character varying(512),
  daystillpurge integer
);

CREATE TABLE IF NOT EXISTS public.bc_inboundfilepurgeworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  inboundfile bigint,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_inboundhistory (
  servicename character varying(255),
  traceabilityid character varying(64),
  publicid character varying(64),
  completedate timestamp without time zone,
  servername character varying(255),
  startdate timestamp without time zone,
  swaggerapi character varying(255),
  operationname character varying(255),
  profilerdata bytea,
  gosuservlettype character varying(255),
  subtype integer,
  id bigint,
  serverid character varying(255),
  pluginname character varying(255),
  httpoperation character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_inboundrecord (
  config character varying(40),
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  status integer,
  inboundchunk bigint,
  inboundfile bigint,
  updatetime timestamp without time zone,
  content text,
  id bigint,
  linenumber integer,
  errormessage character varying(1024)
);

CREATE TABLE IF NOT EXISTS public.bc_inboundrecords (
  status integer,
  publicid character varying(64),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_inboundsubrecord (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  content text,
  inboundrecord bigint,
  id bigint,
  linenumber integer,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_incentive (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  threshold numeric(18,2),
  threshold_cur integer,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  commissionsubplanid bigint,
  bonuspercentage numeric(5,2),
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_incomingproducerpayment (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  paymentinstrumentid bigint,
  retired bigint,
  createtime timestamp without time zone,
  producerid bigint,
  updateuserid bigint,
  currency integer,
  reversalreason integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  refnumberdenorm character varying(510),
  id bigint,
  reversaldate timestamp without time zone,
  refnumber character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_installmentfeedefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  paymentplanid bigint,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_instrumentedmessage (
  profilerdata bytea,
  publicid character varying(64),
  endtime timestamp without time zone,
  destinationid integer,
  id bigint,
  serverid character varying(255),
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_instrumentedworkertask (
  processhistoryid bigint,
  workitemsskipped integer,
  publicid character varying(64),
  orphansadopted integer,
  exceptions integer,
  instrumentedworkexecutorid bigint,
  workitemsprocessedaftercdc integer,
  custominstrumentationdata character varying(1333),
  endtime timestamp without time zone,
  workelapsed bigint,
  workitemsprocessedaftererror integer,
  workitemsfailed integer,
  consecutiveexceptions integer,
  starttime timestamp without time zone,
  cdcs integer,
  profilerdata bytea,
  rantocompletion boolean,
  workitemscheckedout integer,
  managementelapsed bigint,
  id bigint,
  instancenumber integer,
  workitemsprocessed integer
);

CREATE TABLE IF NOT EXISTS public.bc_instrumentedworkexecutor (
  maxnumberofworkers integer,
  publicid character varying(64),
  endtime timestamp without time zone,
  stopinitiated timestamp without time zone,
  id bigint,
  workqueueid integer,
  starttime timestamp without time zone,
  appservername character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_invcitembrkcancelsnapshot (
  currency integer,
  publicid character varying(64),
  archivepartition bigint,
  amount numeric(18,2),
  amount_cur integer,
  id bigint,
  invcitemcancellationsnapshot bigint
);

CREATE TABLE IF NOT EXISTS public.bc_invcitemcancelsnapshot (
  loadcommandid bigint,
  installmentnumber integer,
  invoicebilldate timestamp without time zone,
  producerpayer bigint,
  publicid character varying(64),
  archivepartition bigint,
  eventdate timestamp without time zone,
  accountpayer bigint,
  chargegroup character varying(255),
  invoicestream bigint,
  currency integer,
  primarycommissionearner bigint,
  policyperiod bigint,
  adhocinvoice boolean,
  invoiceduedate timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  type integer,
  id bigint,
  chargepattern bigint
);

CREATE TABLE IF NOT EXISTS public.bc_invoice (
  loadcommandid bigint,
  netamountpaid numeric(18,2),
  netamountpaid_cur integer,
  accountid bigint,
  issurchargeinvoicecredited_ext boolean,
  currency integer,
  originalduedate_ext timestamp without time zone,
  updatetime timestamp without time zone,
  id bigint,
  amountdue numeric(18,2),
  colunappliedamount numeric(18,2),
  unappliedamount numeric(18,2),
  amountdue_cur integer,
  colunappliedamount_cur integer,
  unappliedamount_cur integer,
  createuserid bigint,
  colremainingbalance numeric(18,2),
  remainingbalance numeric(18,2),
  colremainingbalance_cur integer,
  remainingbalance_cur integer,
  beanversion integer,
  retired bigint,
  updateuserid bigint,
  netamount numeric(18,2),
  netamount_cur integer,
  invoicenumber character varying(255),
  adhoc boolean,
  publicid character varying(64),
  allinvoiceitemsexactlypaid boolean,
  eventdate timestamp without time zone,
  invoicestreamid bigint,
  createtime timestamp without time zone,
  numresends integer,
  issurchargeinvoice boolean,
  dpssupressdocgen_ext boolean,
  amount numeric(18,2),
  amount_cur integer,
  paymentduedate timestamp without time zone,
  surremaindernoticesent_ext boolean,
  frozenbyarchiving boolean,
  originalbilldate_ext timestamp without time zone,
  primarydirectbillearned numeric(18,2),
  primarydirectbillearned_cur integer,
  netamountwrittenoff numeric(18,2),
  netamountwrittenoff_cur integer,
  status integer,
  coloutstandingamount numeric(18,2),
  outstandingamount numeric(18,2),
  invoicenumberdenorm character varying(510),
  coloutstandingamount_cur integer,
  outstandingamount_cur integer,
  subtype integer,
  description character varying(1333),
  frompaymentarrangement boolean
);

CREATE TABLE IF NOT EXISTS public.bc_invoicebilledworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  accountinvoiceids text,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_invoicedueworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  accountinvoiceids text,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_invoicefeedefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  billingplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_invoiceitem (
  loadcommandid bigint,
  overridingcmsnableamount_cur integer,
  installmentnumber integer,
  primarycommissionamount numeric(18,2),
  primarycommissionamount_cur integer,
  invoiceid bigint,
  lineitemnumber integer,
  currency integer,
  grossamountwrittenoff numeric(18,2),
  grossamountwrittenoff_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  createuserid bigint,
  paidamount numeric(18,2),
  paidamount_cur integer,
  invoicedateoverride integer,
  beanversion integer,
  retired bigint,
  haschargebilledtransaction boolean,
  custompaymentgroup character varying(1333),
  updateuserid bigint,
  promisedandpaidamount numeric(18,2),
  promisedandpaidamount_cur integer,
  canbepromisedmorebyagencybill boolean,
  paymentexceptionlock integer,
  grosssettled boolean,
  paymentexceptiondate timestamp without time zone,
  haschargeduetransaction boolean,
  type integer,
  promiseexceptionlock integer,
  primarywrittenoffcmsn_cur integer,
  promiseexceptiondate timestamp without time zone,
  reversed boolean,
  exceptioncomments character varying(1333),
  publicid character varying(64),
  eventdate timestamp without time zone,
  createtime timestamp without time zone,
  policyperiodid bigint,
  chargeid bigint,
  hasbeenpaymentexception boolean,
  promisedcommission numeric(18,2),
  promisedcommission_cur integer,
  canbepaidmorebyagencybill boolean,
  amount numeric(18,2),
  amount_cur integer,
  paymentexceptionlockdate timestamp without time zone,
  primarywrittenoffcommission numeric(18,2),
  overridingcommissionableamount numeric(18,2),
  archivepartition bigint,
  primarydirectbillearned numeric(18,2),
  primarydirectbillearned_cur integer,
  promiseexceptionlockdate timestamp without time zone,
  primaryagencybillretained numeric(18,2),
  primaryagencybillretained_cur integer,
  comments character varying(1333),
  description character varying(1333),
  frompaymentarrangement boolean
);

CREATE TABLE IF NOT EXISTS public.bc_invoiceitemordering (
  publicid character varying(64),
  priority integer,
  allocationplanid bigint,
  beanversion integer,
  id bigint,
  invoiceitemorderingtype integer
);

CREATE TABLE IF NOT EXISTS public.bc_invoiceleadtimeoverride (
  loadcommandid bigint,
  jurisdiction integer,
  createuserid bigint,
  inuse boolean,
  leadtimetype integer,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  updateuserid bigint,
  product integer,
  paymentplan bigint,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  servicetier integer,
  dayunittype integer,
  id bigint,
  uwcompany integer,
  billingmethod integer,
  expirationdate timestamp without time zone,
  overrideintegervalue integer
);

CREATE TABLE IF NOT EXISTS public.bc_invoicestream (
  loadcommandid bigint,
  overrideinstrumentdate_ext timestamp without time zone,
  publicid character varying(64),
  accountid bigint,
  createtime timestamp without time zone,
  overridingbillorduedatebilling integer,
  policyid bigint,
  creationorder integer,
  currency integer,
  isuioverridden_ext boolean,
  updatetime timestamp without time zone,
  id bigint,
  overridingpaymentinstrumentid bigint,
  overridingsecondanchordate timestamp without time zone,
  createuserid bigint,
  ruleoverrideleadtimedaycount integer,
  unappliedfundid bigint,
  overridingleadtimedaycount integer,
  beanversion integer,
  retired bigint,
  overridingfirstanchordate timestamp without time zone,
  producerid bigint,
  updateuserid bigint,
  periodicity integer,
  subtype integer,
  description character varying(1333),
  autodraftaddeddate_ext timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_itemcommission (
  loadcommandid bigint,
  reversed boolean,
  commissionamount numeric(18,2),
  publicid character varying(64),
  commissionamount_cur integer,
  active boolean,
  createtime timestamp without time zone,
  currency integer,
  updatetime timestamp without time zone,
  invoiceitemid bigint,
  id bigint,
  payablecriteria integer,
  createuserid bigint,
  writtenoffcommission numeric(18,2),
  writtenoffcommission_cur integer,
  directbillearned numeric(18,2),
  directbillearned_cur integer,
  policyrole integer,
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  updateuserid bigint,
  agencybillretained numeric(18,2),
  agencybillretained_cur integer,
  policycommissionid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_itemevent (
  loadcommandid bigint,
  publicid character varying(64),
  eventdate timestamp without time zone,
  createtime timestamp without time zone,
  currency integer,
  eventtype integer,
  updatetime timestamp without time zone,
  grossamountchanged numeric(18,2),
  grossamountchanged_cur integer,
  invoiceitemid bigint,
  id bigint,
  frominvoiceid bigint,
  transferrole integer,
  frompolicycommissionid bigint,
  createuserid bigint,
  archivepartition bigint,
  beanversion integer,
  toinvoiceid bigint,
  updateuserid bigint,
  topolicycommissionid bigint,
  policycommissionid bigint,
  transactionid bigint,
  cmsnreservechanged numeric(18,2),
  cmsnreservechanged_cur integer
);

CREATE TABLE IF NOT EXISTS public.bc_latefeeamountdefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  delinquencyplanid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_layercommissionoverride (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  layerid bigint,
  overriderate numeric(5,2),
  updateuserid bigint,
  role integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_layerparty (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  coinsurancerole integer,
  party bigint,
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  fixedid character varying(64),
  layer bigint,
  coinsuranceshare numeric(5,2),
  partycode bigint,
  updatetime timestamp without time zone,
  overridingpayercode bigint,
  ourparty boolean,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_lbthresholdoverrideamt (
  loadcommandid bigint,
  inuse boolean,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  lowbalthresholdoverride bigint
);

CREATE TABLE IF NOT EXISTS public.bc_legacyagblworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  agencycycleprocessid bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_legacycollateralworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  collateralid bigint,
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_legacydlnqworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  delinquencyprocessid bigint,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_letterofcredit (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  bankname character varying(255),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  collateralid bigint,
  status integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  id bigint,
  locid character varying(255),
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_letterofcreditworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  letterofcreditid bigint,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_lineitem (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  archivepartition bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  taccountid bigint,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  transactionid bigint,
  amount_cur integer,
  type integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_loadcallback (
  loadcommandid bigint,
  publicid character varying(64),
  executiontime integer,
  executionorder integer,
  endtime timestamp without time zone,
  id bigint,
  name character varying(255),
  loadoperationid bigint,
  description text,
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_loadcallbackresult (
  publicid character varying(64),
  executionorder integer,
  loadcallbackid bigint,
  endtime timestamp without time zone,
  affectedrowcount integer,
  id bigint,
  sqltext text,
  name character varying(255),
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_loadcommand (
  publicid character varying(64),
  commandtype integer,
  rereateindexesprocessid bigint,
  errorcount integer,
  endtime timestamp without time zone,
  callinguserid bigint,
  id bigint,
  description character varying(1333),
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_loaddbstatisticscommand (
  loadcommandid bigint,
  publicid character varying(64),
  tablename character varying(63),
  id bigint,
  statscommand text
);

CREATE TABLE IF NOT EXISTS public.bc_loadencryptchunk (
  publicid character varying(64),
  endtime timestamp without time zone,
  loadencrypttableid bigint,
  id bigint,
  chunksize integer,
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_loadencrypttable (
  loadcommandid bigint,
  updatestmt text,
  publicid character varying(64),
  selectstmt text,
  endtime timestamp without time zone,
  affectedrowcount integer,
  sizeoftimedchuck integer,
  tablename character varying(63),
  id bigint,
  columnstoencrypt character varying(255),
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_loaderror (
  errorid integer,
  query text,
  tablename character varying(63),
  loaderrortype integer,
  errormessage text
);

CREATE TABLE IF NOT EXISTS public.bc_loaderrorrow (
  rownumber bigint,
  errorid integer,
  luwid character varying(64),
  errorrowid integer
);

CREATE TABLE IF NOT EXISTS public.bc_loadexclusion (
  luwid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bc_loadinsertselect (
  loadcommandid bigint,
  publicid character varying(64),
  executionorder integer,
  endtime timestamp without time zone,
  query text,
  fkenablingduration bigint,
  affectedrowcount bigint,
  id bigint,
  loadoperationid bigint,
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_loadintegritycheck (
  loadcommandid bigint,
  publicid character varying(64),
  threadname character varying(1333),
  executionorder integer,
  endtime timestamp without time zone,
  query text,
  id bigint,
  loadintegritychecktype integer,
  loadoperationid bigint,
  description text,
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_loadoperation (
  publicid character varying(64),
  executionorder integer,
  errorcount integer,
  endtime timestamp without time zone,
  affectedrowcount bigint,
  tablename character varying(63),
  id bigint,
  lowestid bigint,
  loadstepid bigint,
  starttime timestamp without time zone,
  highestid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_loadparameter (
  loadcommandid bigint,
  publicid character varying(64),
  parametername character varying(255),
  parametervalue text,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_loadparentstep (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_loadrowcount (
  loadcommandid bigint,
  stagingrowcount bigint,
  sourcerowcount bigint,
  publicid character varying(64),
  id bigint,
  stagingblockcount integer,
  sourceblockcount integer,
  stagingtablename character varying(63),
  sourcetablename character varying(63)
);

CREATE TABLE IF NOT EXISTS public.bc_loadstep (
  loadcommandid bigint,
  publicid character varying(64),
  executionorder integer,
  steptype integer,
  endtime timestamp without time zone,
  id bigint,
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_loadupdatestatisticsselect (
  loadcommandid bigint,
  publicid character varying(64),
  executionorder integer,
  endtime timestamp without time zone,
  query text,
  tablename character varying(63),
  id bigint,
  loadoperationid bigint,
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_lowbalthresholddefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  billingplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_lowbalthresholdoverride (
  loadcommandid bigint,
  jurisdiction integer,
  createuserid bigint,
  inuse boolean,
  publicid character varying(64),
  thresholdtype integer,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  lowbalancemethod integer,
  updateuserid bigint,
  product integer,
  paymentplan bigint,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  servicetier integer,
  id bigint,
  uwcompany integer,
  billingmethod integer,
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_markpurgereadyworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  item bigint,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_maxkey (
  entitytablename character varying(63),
  maxkey bigint,
  lockingcolumn integer
);

CREATE TABLE IF NOT EXISTS public.bc_message (
  objectkey character varying(60),
  sendlocktime timestamp without time zone,
  publicid character varying(64),
  errorcategory integer,
  sendorder integer,
  accountid bigint,
  policyperiodid bigint,
  payload text,
  optionalint integer,
  beforesendtime timestamp without time zone,
  sendtime timestamp without time zone,
  querytime timestamp without time zone,
  latebound boolean,
  senderrefid character varying(64),
  id bigint,
  primaryobjectid bigint,
  keymap text,
  beforesendlockedtime timestamp without time zone,
  sendlockedtime timestamp without time zone,
  traceabilityid character varying(64),
  optionalmoney numeric(18,2),
  eventrootkey character varying(60),
  duplicatecount integer,
  eventname character varying(255),
  userid bigint,
  ackcount integer,
  retrycount integer,
  destinationid integer,
  creationtime timestamp without time zone,
  producerid bigint,
  lockingcolumn integer,
  optionalstring character varying(255),
  aftersendtime timestamp without time zone,
  status integer,
  messagecode character varying(255),
  errordescription character varying(255),
  retrytime timestamp without time zone,
  ackcode character varying(255),
  contactid bigint,
  description character varying(255),
  bound boolean,
  beforesendlocktime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_messagehistory (
  objectkey character varying(60),
  sendlocktime timestamp without time zone,
  publicid character varying(64),
  errorcategory integer,
  sendorder integer,
  accountid bigint,
  policyperiodid bigint,
  payload text,
  optionalint integer,
  beforesendtime timestamp without time zone,
  sendtime timestamp without time zone,
  querytime timestamp without time zone,
  latebound boolean,
  senderrefid character varying(64),
  id bigint,
  primaryobjectid bigint,
  keymap text,
  beforesendlockedtime timestamp without time zone,
  sendlockedtime timestamp without time zone,
  traceabilityid character varying(64),
  optionalmoney numeric(18,2),
  eventrootkey character varying(60),
  duplicatecount integer,
  eventname character varying(255),
  userid bigint,
  ackcount integer,
  retrycount integer,
  destinationid integer,
  creationtime timestamp without time zone,
  producerid bigint,
  lockingcolumn integer,
  optionalstring character varying(255),
  aftersendtime timestamp without time zone,
  status integer,
  messagecode character varying(255),
  errordescription character varying(255),
  retrytime timestamp without time zone,
  ackedtime timestamp without time zone,
  ackcode character varying(255),
  contactid bigint,
  origmsgid bigint,
  description character varying(255),
  bound boolean,
  beforesendlocktime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_messagerequestlease (
  transferrequested bigint,
  publicid character varying(64),
  expired bigint,
  exclusivity bigint,
  created bigint,
  name character varying(255),
  lockingcolumn integer,
  acquired bigint,
  uniqueidlsb bigint,
  expirerequested bigint,
  uniqueidmsb bigint,
  initialarguments bytea,
  leaseowner character varying(255),
  retryfailover bigint,
  id bigint,
  transfertarget character varying(255),
  released bigint,
  failoverstate integer
);

CREATE TABLE IF NOT EXISTS public.bc_messagerequestleasehistory (
  terminationmessage character varying(1333),
  transferrequested bigint,
  terminated bigint,
  publicid character varying(64),
  expired bigint,
  terminationreason integer,
  created bigint,
  name character varying(255),
  lockingcolumn integer,
  replacementidlsb bigint,
  acquired bigint,
  replacementidmsb bigint,
  uniqueidlsb bigint,
  expirerequested bigint,
  uniqueidmsb bigint,
  leaseowner character varying(255),
  id bigint,
  transfertarget character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_mixedcurrencypolpergroup (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  mainpolicyperiodid bigint,
  beanversion integer,
  archivepartition bigint,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_moddist (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_modifiedfrombsdi (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_modifiedfromdi (
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_modifiedfrompmr (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_movedfrompaymentmoneyreceived (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_movedfrompmr (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_movedtosuspensepayment (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_negativewriteoff (
  loadcommandid bigint,
  createuserid bigint,
  reversed boolean,
  channel integer,
  unappliedfundid bigint,
  publicid character varying(64),
  executiondate timestamp without time zone,
  accountid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  producerid bigint,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  currency integer,
  approvalstatus integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  requestinguserid bigint,
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_negativewriteoffrev (
  negativewriteoffid bigint,
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  approvalstatus integer,
  updatetime timestamp without time zone,
  requestinguserid bigint,
  id bigint,
  reversaldate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_negwrtoffsliceallocation (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  negativewriteoff bigint,
  beanversion integer,
  unappliedfundslice bigint,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  ismanualallocation boolean,
  currency integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_netthshldfrsupstmtdefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  agencybillplanid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_newpaymentworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  moneyrcvdids text,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_nonreceivableitemctx (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  accountwithsuspenseid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  basenonreceivabledistitemid bigint,
  producerwithsuspenseid bigint,
  updateuserid bigint,
  currency integer,
  collateralid bigint,
  updatetime timestamp without time zone,
  transactionid bigint,
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_note (
  loadcommandid bigint,
  publicid character varying(64),
  accountid bigint,
  confidential boolean,
  createtime timestamp without time zone,
  policyid bigint,
  updatetime timestamp without time zone,
  language integer,
  id bigint,
  troubleticketid bigint,
  body text,
  createuserid bigint,
  authoringdate timestamp without time zone,
  authorid bigint,
  relatedto integer,
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  activityid bigint,
  subject character varying(255),
  producerid bigint,
  topic integer,
  updateuserid bigint,
  securitytype integer
);

CREATE TABLE IF NOT EXISTS public.bc_nullablecolumndatadist (
  numnonnullvalues bigint,
  publicid character varying(64),
  numvalues bigint,
  tabledatadistid bigint,
  nullablecolname character varying(30),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_officialid (
  officialidtype integer,
  loadcommandid bigint,
  obfuscatedinternal boolean,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  officialidvalue character varying(255),
  updateuserid bigint,
  state integer,
  updatetime timestamp without time zone,
  subtype integer,
  id bigint,
  contactid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_offsetorigbi (
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_onsetinvoiceitem (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_onsetorigbi (
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_organization (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  namedenorm character varying(120),
  retired bigint,
  createtime timestamp without time zone,
  name character varying(60),
  namekanji character varying(120),
  masteradmin boolean,
  updateuserid bigint,
  updatetime timestamp without time zone,
  carrier boolean,
  type integer,
  id bigint,
  contactid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_organizationzoneadmin (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  zonetype integer,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  organizationid bigint,
  updateuserid bigint,
  country integer,
  updatetime timestamp without time zone,
  zonecode character varying(255),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_orggroup (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_origchcmsn (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_outboundfile (
  config bigint,
  createuserid bigint,
  publicid character varying(64),
  filename character varying(512),
  beanversion integer,
  createtime timestamp without time zone,
  createdate timestamp without time zone,
  updateuserid bigint,
  batchid character varying(256),
  updatetime timestamp without time zone,
  purgedate timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_outboundfileconfig (
  destinations3prefix character varying(512),
  createuserid bigint,
  publicid character varying(64),
  apicallattempttimeoutsec integer,
  apicalltimeoutsec integer,
  beanversion integer,
  createtime timestamp without time zone,
  filehandlerclass character varying(512),
  name character varying(40),
  updateuserid bigint,
  prefix character varying(10),
  profilename character varying(128),
  updatetime timestamp without time zone,
  destinations3bucket character varying(128),
  subtype integer,
  id bigint,
  temporarydirectory character varying(512),
  permanentdirectory character varying(512),
  extension character varying(10),
  daystillpurge integer
);

CREATE TABLE IF NOT EXISTS public.bc_outboundfilepurgeworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  outboundfile bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_outboundrecord (
  config bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  createdate timestamp without time zone,
  outboundfile bigint,
  updateuserid bigint,
  status integer,
  batchid character varying(256),
  updatetime timestamp without time zone,
  content text,
  purgedate timestamp without time zone,
  id bigint,
  errormessage character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bc_outboundrecpurgeworkitem (
  processhistoryid bigint,
  outboundrecord bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_outgoingpayment (
  loadcommandid bigint,
  mailtoaddress character varying(255),
  publicid character varying(64),
  issuedate timestamp without time zone,
  paymentinstrumentid bigint,
  createtime timestamp without time zone,
  producerpaymentid bigint,
  currency integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  refnumberdenorm character varying(510),
  id bigint,
  refnumber character varying(255),
  paytodenorm character varying(510),
  createuserid bigint,
  payto character varying(255),
  beanversion integer,
  retired bigint,
  rejecteddate timestamp without time zone,
  updateuserid bigint,
  status integer,
  mailto character varying(255),
  subtype integer,
  memo character varying(255),
  paiddate timestamp without time zone,
  disbursementid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_parameter (
  stringvalue character varying(255),
  intvalue integer,
  createuserid bigint,
  parametertype integer,
  datevalue timestamp without time zone,
  publicid character varying(64),
  beanversion integer,
  longtextvalue text,
  booleanvalue boolean,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  parametername character varying(255),
  updatetime timestamp without time zone,
  componenttype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_parentacct (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_parentgroup (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_paymentinstrument (
  loadcommandid bigint,
  acipaymentmethod integer,
  immutable boolean,
  publicid character varying(64),
  accountid bigint,
  createtime timestamp without time zone,
  bankaccounttype_ext integer,
  bankaccountcategory_ext integer,
  detail character varying(255),
  onetimeuse_ext boolean,
  updatetime timestamp without time zone,
  accountnumber_ext character varying(64),
  id bigint,
  createuserid bigint,
  paymentmethod integer,
  beanversion integer,
  retired bigint,
  producerid bigint,
  updateuserid bigint,
  routingnumber_ext character varying(9),
  guidewireaccountnumber_ext character varying(255),
  token character varying(255),
  description character varying(255),
  expirationdate_ext timestamp without time zone,
  active_ext boolean
);

CREATE TABLE IF NOT EXISTS public.bc_paymentitemaction (
  paymentitemgroupid bigint,
  createuserid bigint,
  publicid character varying(64),
  directbillpaymentitemid bigint,
  archivepartition bigint,
  beanversion integer,
  createtime timestamp without time zone,
  actionkind integer,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  id bigint,
  collateralpaymentitemid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_paymentitemgroup (
  createuserid bigint,
  impactedbyarchiving boolean,
  publicid character varying(64),
  unappliedfundid bigint,
  reason integer,
  beanversion integer,
  eventdate timestamp without time zone,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  policyperiod bigint,
  updatetime timestamp without time zone,
  collateral bigint,
  totalamountdenorm numeric(18,2),
  totalamountdenorm_cur integer,
  owneraccount bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_paymentplanmodifier (
  policybillinginstructionid bigint,
  loadcommandid bigint,
  downpaymentpercent numeric(5,2),
  createuserid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  paymentplanid bigint,
  billinginstructiontype integer,
  updateuserid bigint,
  updatetime timestamp without time zone,
  maximumnumberofinstallments integer,
  referencechargeid bigint,
  subtype integer,
  id bigint,
  applicationorder integer
);

CREATE TABLE IF NOT EXISTS public.bc_paymentrequest (
  loadcommandid bigint,
  publicid character varying(64),
  invoiceid bigint,
  accountid bigint,
  paymentinstrumentid bigint,
  invoicestreamid bigint,
  createtime timestamp without time zone,
  draftdate timestamp without time zone,
  currency integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  id bigint,
  statusdate timestamp without time zone,
  confirmationnumber_ext character varying(255),
  errormessage_ext text,
  duedate timestamp without time zone,
  createuserid bigint,
  senttopaymentsystem_ext boolean,
  beanversion integer,
  retired bigint,
  fixedamount_ext_cur integer,
  updateuserid bigint,
  status integer,
  processedinpayconnexion_ext boolean,
  fixedamount_ext_amt numeric(18,2),
  requestdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_paymentrequestworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  paymentrequestids character varying(1333),
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_paymentreversalfeedefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  billingplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_payplanavailoverride (
  loadcommandid bigint,
  overridebit boolean,
  jurisdiction integer,
  createuserid bigint,
  inuse boolean,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  updateuserid bigint,
  product integer,
  paymentplan bigint,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  servicetier integer,
  id bigint,
  uwcompany integer,
  billingmethod integer,
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_pcjobpaymentplanchange (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  jobnumber character varying(30),
  stepid integer,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_pddestructionrequest (
  createuserid bigint,
  addressbookuid character varying(64),
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  updateuserid bigint,
  requestersnotified boolean
);

CREATE TABLE IF NOT EXISTS public.bc_pddestructrequester (
  pddestructionrequest bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  requesterid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_phonenormalizerworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  targetids text,
  entitytypename character varying(60),
  queuetype integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_plan (
  daysuntilfirstdunningsent integer,
  holdinvoicingondlnqpolicies boolean,
  availabledisbamttype integer,
  daysfromrefdatetofirstinstall integer,
  graceperioddayunit integer,
  autoprocesswhenpaymentmatches boolean,
  namedenorm character varying(510),
  name character varying(255),
  invoiceitemplacementcutofftype integer,
  lowcommissioncleared boolean,
  suppresslowbalinvoices boolean,
  onetimechargeafter integer,
  updatetime timestamp without time zone,
  maximumnumberofinstallments integer,
  id bigint,
  downpaymentpercent numeric(5,2),
  paymentexceptionssent boolean,
  createuserid bigint,
  skipfeefordownpayment boolean,
  delaydisbursement integer,
  equitywarningsenabled boolean,
  exceptionforpastduestatement boolean,
  beanversion integer,
  retired bigint,
  daysfromrefdatetodownpayment integer,
  seconddunningsentifnotpaid boolean,
  reporting boolean,
  createoffsetsonbilledinvoices boolean,
  updateuserid bigint,
  firstinstallmentafter integer,
  westernmethod boolean,
  periodicity integer,
  autodraft_ext boolean,
  promisedueindays integer,
  downpaymentafter integer,
  listbillaccountexcesstreatment integer,
  chargequalification integer,
  lowgrosscleared boolean,
  allowmodofmandisb boolean,
  applicablesegments integer,
  cycleclosedayofmonth integer,
  aligninstallmentstoinvoices boolean,
  changedeadlineintervaldaycount integer,
  inuse boolean,
  publicid character varying(64),
  equitybuffer integer,
  planorder integer,
  statementswithlownetsuppressed boolean,
  statementsentaftercycleclose boolean,
  skipinstallmentfees boolean,
  requestintervaldaycount integer,
  uservisible boolean,
  createtime timestamp without time zone,
  daysuntilseconddunningsent integer,
  graceperioddays integer,
  invoicingblackouttype integer,
  cancellationtarget integer,
  effectivedate timestamp without time zone,
  leadtimedayunit integer,
  draftintervaldaycount integer,
  reinstatewithlapsefee_ext numeric(18,2),
  clearinglogictarget integer,
  sendautodisbawaitingapproval boolean,
  reinstatewithlapsefee_ext_cur integer,
  expirationdate timestamp without time zone,
  daysuntilpromiseremindersent integer,
  remindersentifpromisenotrcvd boolean,
  daysbeforeplcyexpforinvblckout integer,
  downpaymentsecondinstallment integer,
  aggregation integer,
  draftdaylogic integer,
  exceptionifpromisenotreceived boolean,
  snapshotnonpastdueitems boolean,
  createappractforautodisb boolean,
  workflowplan integer,
  upgradedfrombefore9 boolean,
  reinstatementwindow_ext integer,
  firstdunningsentifnotpaid boolean,
  lowbalancemethod integer,
  daysfromrefdatetosecondinstall integer,
  daysfromrefdatetoonetimecharge integer,
  statement integer,
  paymentduedaylogic integer,
  billdateorduedatebilling integer,
  paymentdueinterval integer,
  nonresponsivepmntdueinterval integer,
  promiseexceptionssent boolean,
  secondinstallmentafter integer,
  pmntschdchngoffsetsonbilled boolean,
  daysaftercycleclosetosendstmnt integer,
  subtype integer,
  description character varying(1333),
  paymenttermsindays integer,
  mortgage_ext boolean,
  cycleclosedayofmonthlogic integer
);

CREATE TABLE IF NOT EXISTS public.bc_plan_desc_l10n (
  value character varying(1333),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_plan_name_l10n (
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_plancurrency (
  currency integer,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  multicurrencyplanid bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_plcycmsnarchivesummary (
  policycmsnexpense numeric(18,2),
  policycmsnexpense_cur integer,
  publicid character varying(64),
  beanversion integer,
  primarypolicyperiodid bigint,
  chargecmsnwrittenoff numeric(18,2),
  currency integer,
  policyperiodarchivesummaryid bigint,
  chargecmsnwrittenoff_cur integer,
  chargecmsnearnedretained numeric(18,2),
  chargecmsnearnedretained_cur integer,
  role integer,
  defaultforpolicy boolean,
  producercodeid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_plcycorrespondenceentry (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  plcycorrespondencetype integer,
  beanversion integer,
  policyperiodcontactid bigint,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_pluginlease (
  transferrequested bigint,
  publicid character varying(64),
  expired bigint,
  exclusivity bigint,
  created bigint,
  name character varying(255),
  lockingcolumn integer,
  acquired bigint,
  uniqueidlsb bigint,
  expirerequested bigint,
  uniqueidmsb bigint,
  initialarguments bytea,
  leaseowner character varying(255),
  retryfailover bigint,
  id bigint,
  transfertarget character varying(255),
  released bigint,
  failoverstate integer
);

CREATE TABLE IF NOT EXISTS public.bc_pluginleasehistory (
  terminationmessage character varying(1333),
  transferrequested bigint,
  terminated bigint,
  publicid character varying(64),
  expired bigint,
  terminationreason integer,
  created bigint,
  name character varying(255),
  lockingcolumn integer,
  replacementidlsb bigint,
  acquired bigint,
  replacementidmsb bigint,
  uniqueidlsb bigint,
  expirerequested bigint,
  uniqueidmsb bigint,
  leaseowner character varying(255),
  id bigint,
  transfertarget character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_polentdelinqthshlddefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  delinquencyplanid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_policy (
  loadcommandid bigint,
  heldforinvoicesending boolean,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  accountid bigint,
  retired bigint,
  createtime timestamp without time zone,
  lobcode integer,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  pcpublicid character varying(255),
  donotarchive boolean,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_policyclosureworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  policyperiodid bigint,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_policycommission (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  archivepartition bigint,
  createtime timestamp without time zone,
  retired bigint,
  enddate timestamp without time zone,
  policyperiodid bigint,
  updateuserid bigint,
  startdate timestamp without time zone,
  primarypolicyperiodid bigint,
  currency integer,
  cmsnplanoverridepercentage numeric(5,2),
  updatetime timestamp without time zone,
  role integer,
  commissionsubplanid bigint,
  hiddentaccountcontainerid bigint,
  defaultforpolicy boolean,
  producercodeid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_policyperiod (
  loadcommandid bigint,
  heldforinvoicesending boolean,
  underaudit boolean,
  securityzoneid bigint,
  pendingreindex boolean,
  policypereffdate timestamp without time zone,
  paymentplanid bigint,
  archivestate integer,
  archiveschemainfo bigint,
  currency integer,
  updatetime timestamp without time zone,
  hiddentaccountcontainerid bigint,
  id bigint,
  uwcompany integer,
  holdinvoicingwhendelinquent boolean,
  billingmethod integer,
  overridingpayeraccountid bigint,
  assignedrisk boolean,
  excludereason character varying(255),
  overridinginvoicestreamid bigint,
  createuserid bigint,
  archivefailureid bigint,
  dba character varying(255),
  fullpaydiscountuntil timestamp without time zone,
  policyperioddelinquencyplanid bigint,
  offernumber character varying(255),
  equitywarningsenabled boolean,
  closedate timestamp without time zone,
  nextarchivecheckdate timestamp without time zone,
  beanversion integer,
  eligibleforfullpaydiscount boolean,
  retrieved boolean,
  retired bigint,
  bounddate timestamp without time zone,
  updateuserid bigint,
  fullpaydiscountevaluated boolean,
  westernmethod boolean,
  archivedentitypurgedate timestamp without time zone,
  termnumber integer,
  archivetacctcontainerid bigint,
  pendingremainingbalancefix boolean,
  cancellationtype integer,
  cancelreason character varying(255),
  publicid character varying(64),
  priorpolicynumber character varying(40),
  equitybuffer integer,
  discountedpaymentthreshold numeric(18,2),
  discountedpaymentthreshold_cur integer,
  createtime timestamp without time zone,
  underwriter character varying(255),
  policyid bigint,
  excludedfromarchive boolean,
  policytype_ext integer,
  riskjurisdiction integer,
  archivefailuredetailsid bigint,
  emailsentfor10paynotenrolled boolean,
  archivepartition bigint,
  policyperexpirdate timestamp without time zone,
  chargeheld boolean,
  returnpremiumplanid bigint,
  cancelstatus integer,
  closurestatus integer,
  archivedate timestamp without time zone,
  confirmationnotificationstate integer,
  termconfirmed boolean,
  policynumberlongdenorm character varying(510),
  policynumberlong character varying(255),
  paymentdistributionenabled boolean,
  policynumberdenorm character varying(80),
  policynumber character varying(40),
  primarycoveragecurrency integer,
  processundistpayments_ext boolean
);

CREATE TABLE IF NOT EXISTS public.bc_policyperiodarchivesmmry (
  publicid character varying(64),
  beanversion integer,
  premiumcharges numeric(18,2),
  premiumcharges_cur integer,
  paid numeric(18,2),
  paid_cur integer,
  policyperiodid bigint,
  othercharges numeric(18,2),
  othercharges_cur integer,
  currency integer,
  cancellationdate timestamp without time zone,
  writtenoff numeric(18,2),
  openactivitiescount integer,
  writtenoff_cur integer,
  id bigint,
  delinquencycount integer
);

CREATE TABLE IF NOT EXISTS public.bc_policyperiodciagreement (
  loadcommandid bigint,
  createuserid bigint,
  ourrole integer,
  publicid character varying(64),
  agreementfixedid character varying(64),
  beanversion integer,
  archivepartition bigint,
  createtime timestamp without time zone,
  model integer,
  retired bigint,
  policynumbersuffix character varying(8),
  ownerid bigint,
  updateuserid bigint,
  ourshare numeric(5,2),
  updatetime timestamp without time zone,
  foreignentity bigint,
  subtype integer,
  id bigint,
  leadersfee numeric(5,2)
);

CREATE TABLE IF NOT EXISTS public.bc_policyperiodcontact (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  policyperiodid bigint,
  updateuserid bigint,
  primarypolicyperiodid bigint,
  updatetime timestamp without time zone,
  contactid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_policyperiodcurrencygroup (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  currencyingroup integer,
  retired bigint,
  createtime timestamp without time zone,
  ownerid bigint,
  updateuserid bigint,
  foreignentityid bigint,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_policyperiodlayer (
  loadcommandid bigint,
  ourrole integer,
  publicid character varying(64),
  createtime timestamp without time zone,
  policynumbersuffix character varying(8),
  excessamount numeric(18,2),
  ownerid bigint,
  excessamount_cur integer,
  limitamount numeric(18,2),
  ourshare numeric(5,2),
  limitamount_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  layerfixedid character varying(64),
  createuserid bigint,
  archivepartition bigint,
  beanversion integer,
  model integer,
  retired bigint,
  updateuserid bigint,
  foreignentity bigint,
  subtype integer,
  leadersfee numeric(5,2),
  coinsured boolean
);

CREATE TABLE IF NOT EXISTS public.bc_policyperiodprogram (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  mainpolicyperiodid bigint,
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  updatetime timestamp without time zone,
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_policyperiodretrievereq (
  createuserid bigint,
  reason character varying(255),
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  policyperiodid bigint,
  updateuserid bigint,
  updatetime timestamp without time zone,
  id bigint,
  shouldcreateactivity boolean,
  requestinguser bigint
);

CREATE TABLE IF NOT EXISTS public.bc_policyperiodtower (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  towerfixedid character varying(64),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  towergrouping bigint,
  updateuserid bigint,
  updatetime timestamp without time zone,
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_policysection (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  archivepartition bigint,
  tower bigint,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  fixedid character varying(64),
  currency integer,
  policyperiod bigint,
  updatetime timestamp without time zone,
  id bigint,
  coinsuranceagreement bigint,
  sectiontype integer
);

CREATE TABLE IF NOT EXISTS public.bc_policytransfer (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  transferred boolean,
  archivepartition bigint,
  beanversion integer,
  destinationproducercodeid bigint,
  retired bigint,
  createtime timestamp without time zone,
  commissiontransferoption integer,
  policyperiodid bigint,
  updateuserid bigint,
  currency integer,
  sourceproducercodeid bigint,
  updatetime timestamp without time zone,
  subtype integer,
  id bigint,
  roletotransfer integer
);

CREATE TABLE IF NOT EXISTS public.bc_polperiodcontactrole (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  policyperiodcontactid bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  role integer,
  updatetime timestamp without time zone,
  poladdlcontactdetail bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_poltransferpolicyperiod (
  loadcommandid bigint,
  currency integer,
  publicid character varying(64),
  beanversion integer,
  archivepartition bigint,
  policytransferid bigint,
  id bigint,
  policyperiodid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_postbatchpmntsworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  batchpayment bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_prdcrwrofthresholddefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  agencybillplanid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_premiumreportddworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  premiumreportduedateid bigint,
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_premiumreportduedate (
  loadcommandid bigint,
  duedate timestamp without time zone,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  periodenddate timestamp without time zone,
  archivepartition bigint,
  createtime timestamp without time zone,
  completed boolean,
  periodstartdate timestamp without time zone,
  updateuserid bigint,
  updatetime timestamp without time zone,
  delinquencyprocessid bigint,
  premiumreportddpolicyperiodid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_privilege (
  roleid bigint,
  publicid character varying(64),
  importdate_ext timestamp without time zone,
  beanversion integer,
  id bigint,
  permission integer
);

CREATE TABLE IF NOT EXISTS public.bc_processhistory (
  returnvalue character varying(255),
  notificationsent boolean,
  publicid character varying(64),
  completedate timestamp without time zone,
  processtype integer,
  scheduled boolean,
  creationdate timestamp without time zone,
  internalfailure boolean,
  opsperformed integer,
  failurereason character varying(1333),
  startdate timestamp without time zone,
  profilerdata bytea,
  leaseid character varying(36),
  failedops integer,
  rantocompletion boolean,
  id bigint,
  description character varying(255),
  serverid character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_prodcoderoleentry (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  producerid bigint,
  billinginstructionid bigint,
  updateuserid bigint,
  currency integer,
  cmsnplanoverridepercentage numeric(5,2),
  role integer,
  updatetime timestamp without time zone,
  producercodeid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_prodcollctngstmt (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_prodcorrespondenceentry (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  producercontactid bigint,
  id bigint,
  prodcorrespondencetype integer,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_prodcurrencygrp (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  currencyingroup integer,
  retired bigint,
  createtime timestamp without time zone,
  ownerid bigint,
  updateuserid bigint,
  foreignentityid bigint,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_prodpmntinst (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_producer (
  loadcommandid bigint,
  publicid character varying(64),
  createartifacts_ext boolean,
  securityzoneid bigint,
  namedenorm character varying(510),
  createtime timestamp without time zone,
  totalcommissionexpense numeric(18,2),
  totalcommissionexpense_cur integer,
  name character varying(255),
  agencybillplanid bigint,
  holdstatement boolean,
  currency integer,
  updatetime timestamp without time zone,
  initialrecurdate timestamp without time zone,
  hiddentaccountcontainerid bigint,
  recurdayofmonth integer,
  id bigint,
  istaxlevy_ext boolean,
  createuserid bigint,
  tier integer,
  finalrecurdate timestamp without time zone,
  recurperiodicity integer,
  beanversion integer,
  taxid_ext character varying(30),
  retired bigint,
  combinedstatements boolean,
  namekanji character varying(255),
  reportinggroupid bigint,
  totalcommissionreserve numeric(18,2),
  totalcommissionreserve_cur integer,
  updateuserid bigint,
  totalcommissionpayable numeric(18,2),
  statementholdpositivelimit numeric(18,2),
  totalcommissionpayable_cur integer,
  statementholdpositivelimit_cur integer,
  statementholdnegativelimit numeric(18,2),
  statementholdnegativelimit_cur integer,
  uwcompany_ext integer
);

CREATE TABLE IF NOT EXISTS public.bc_produceracctrep (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_producercode (
  loadcommandid bigint,
  createuserid bigint,
  contact_ext bigint,
  publicid character varying(64),
  active boolean,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  codedenorm character varying(510),
  code character varying(255),
  producerid bigint,
  updateuserid bigint,
  commissionplanid bigint,
  currency integer,
  updatetime timestamp without time zone,
  hiddentaccountcontainerid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_producercontact (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  producerid bigint,
  primaryproducerid bigint,
  updateuserid bigint,
  updatetime timestamp without time zone,
  contactid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_producercontactrole (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  role integer,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  producercontactid bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_producercontext (
  agencycyclepaymentid bigint,
  loadcommandid bigint,
  publicid character varying(64),
  chargewrittenoffid bigint,
  createtime timestamp without time zone,
  statementid bigint,
  producerpaymentid bigint,
  currency integer,
  distitemid bigint,
  updatetime timestamp without time zone,
  prodnegativewriteoffid bigint,
  creditspayableofid bigint,
  producercodeid bigint,
  invoiceitemid bigint,
  id bigint,
  payablecriteria integer,
  createuserid bigint,
  producerpayablexferid bigint,
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  writeoffcontainerid bigint,
  producerid bigint,
  commissionwriteoffdistitemid bigint,
  updateuserid bigint,
  policycommissionid bigint,
  payablereceiverstatementid bigint,
  transactionid bigint,
  subtype integer,
  chargecommissionid bigint,
  incomingpaymentid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_producergroup (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  mainproducerid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_producerpayabletransfer (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  debitspayableofid bigint,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  currency integer,
  approvalstatus integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  requestinguserid bigint,
  creditspayableofid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_producerpayment (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  reportinggroupid bigint,
  producerid bigint,
  updateuserid bigint,
  currency integer,
  status integer,
  reversalreason integer,
  updatetime timestamp without time zone,
  subtype integer,
  id bigint,
  reversaldate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_producerpaymentworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  producerid bigint,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_producerstatement (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  previousbalance numeric(18,2),
  previousbalance_cur integer,
  beanversion integer,
  createtime timestamp without time zone,
  netamountsentandreceived numeric(18,2),
  netamountsentandreceived_cur integer,
  producerid bigint,
  processed boolean,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  statementnumber character varying(255),
  type integer,
  id bigint,
  statementname_ext character varying(255),
  balance numeric(18,2),
  statementdate timestamp without time zone,
  balance_cur integer
);

CREATE TABLE IF NOT EXISTS public.bc_prodwriteoffcontainerunappliedfundslice (
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_profilerconfig (
  diffdbmscounters boolean,
  individualstacks boolean,
  publicid character varying(64),
  beanversion integer,
  hiresclock boolean,
  extendedquerytracing boolean,
  stacktracetracking boolean,
  queryoptimizertracing boolean,
  profilerenabled boolean,
  dbmscounterthresholdms integer,
  subtype integer,
  id bigint,
  entrypoint character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_purgedrootinfo (
  purgedentitypublicid character varying(64),
  createuserid bigint,
  publicid character varying(64),
  purgetype integer,
  updatetime timestamp without time zone,
  purgedentitytype character varying(255),
  beanversion integer,
  createtime timestamp without time zone,
  purgedate timestamp without time zone,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_recapchrgslicejoin (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  recapturecharge bigint,
  archivepartition bigint,
  beanversion integer,
  unappliedfundslice bigint,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_region (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  name character varying(255),
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_region_name_l10n (
  loadcommandid bigint,
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_region_zone (
  loadcommandid bigint,
  publicid character varying(64),
  country integer,
  zonetype integer,
  beanversion integer,
  codedenorm character varying(510),
  id bigint,
  code character varying(255),
  regionid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_reinstatemntfeeamtdefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  delinquencyplanid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_relatedactivity (
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_releasechgholdworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  chargeid bigint,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_releaseholdsworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  holdtypeentryid bigint,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_reportinggroup (
  loadcommandid bigint,
  jurisdiction integer,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  product integer,
  updateuserid bigint,
  updatetime timestamp without time zone,
  uwcompany integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_retpremhandlingscheme (
  excesstreatment integer,
  publicid character varying(64),
  priority integer,
  startdateoption integer,
  handlingcondition integer,
  allocatetiming integer,
  beanversion integer,
  id bigint,
  returnpremiumplanid bigint,
  allocatemethod integer
);

CREATE TABLE IF NOT EXISTS public.bc_retrieveplcyprdworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  policyperiod bigint,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_revcharge (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_revcmsnred (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_revcredit (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_reversebatchpmntsworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  batchpaymentid bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_revfeedecisionoverride (
  loadcommandid bigint,
  paymentrevreason integer,
  overridebit boolean,
  jurisdiction integer,
  createuserid bigint,
  inuse boolean,
  publicid character varying(64),
  paymentmethod integer,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  updateuserid bigint,
  product integer,
  paymentplan bigint,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  servicetier integer,
  id bigint,
  uwcompany integer,
  billingmethod integer,
  expirationdate timestamp without time zone,
  shouldcreateactivity boolean
);

CREATE TABLE IF NOT EXISTS public.bc_reviewdisburseoverdefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  billingplanid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_revinvoiceitem (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_revitemcmsn (
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_revnegwriteoff (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_revtrans (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_revwriteoff (
  loadcommandid bigint,
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_role (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  carrierinternalrole boolean,
  name character varying(60),
  updateuserid bigint,
  roletype integer,
  updatetime timestamp without time zone,
  id bigint,
  description text
);

CREATE TABLE IF NOT EXISTS public.bc_role_desc_l10n (
  value text,
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_role_name_l10n (
  value character varying(60),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_rolling (
  config bytea,
  source boolean,
  configfp character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_rolling_dm (
  changes text,
  publicid character varying(64),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_runtimeproperty (
  value character varying(1024),
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  propertygroup integer,
  id bigint,
  name character varying(256),
  description character varying(1024),
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_scheduledjob (
  nexttime bigint,
  publicid character varying(64),
  actualschedule character varying(1333),
  version integer,
  configschedule character varying(1333),
  processtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_scriptparameter (
  decimalvalue character varying(255),
  riskvalue numeric(6,2),
  phonevalue character varying(30),
  publicid character varying(64),
  bitvalue boolean,
  createtime timestamp without time zone,
  percentagedecvalue numeric(5,2),
  speedvalue integer,
  varcharvalue character varying(255),
  yearvalue integer,
  updatetime timestamp without time zone,
  datetimevalue timestamp without time zone,
  weeklyfrequencyvalue integer,
  percentagevalue integer,
  groupid bigint,
  id bigint,
  createuserid bigint,
  monthlyfrequencyvalue integer,
  parametertype integer,
  userid bigint,
  beanversion integer,
  retired bigint,
  positivemoneyvalue numeric(18,2),
  positiveintegervalue integer,
  updateuserid bigint,
  moneyvalue numeric(18,2),
  nonnegativemoneyvalue numeric(18,2),
  integervalue integer,
  parametername character varying(255),
  nonnegativeintegervalue integer,
  postalcodevalue character varying(60)
);

CREATE TABLE IF NOT EXISTS public.bc_sectioncommissionoverride (
  sectionid bigint,
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  overriderate numeric(5,2),
  updateuserid bigint,
  currency integer,
  role integer,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_securityzone (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  name character varying(60),
  description text,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_seczone_dsc_l10n (
  value text,
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_seczone_nam_l10n (
  value character varying(60),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_sequence (
  publicid character varying(64),
  beanversion integer,
  sequencenumber bigint,
  id bigint,
  sequencekey character varying(26)
);

CREATE TABLE IF NOT EXISTS public.bc_snapshotinvoiceitem (
  loadcommandid bigint,
  primarywrittenoffcmsn_cur integer,
  publicid character varying(64),
  primarycommissionamount numeric(18,2),
  primarycommissionamount_cur integer,
  createtime timestamp without time zone,
  lineitemnumber integer,
  currency integer,
  promisedcommission numeric(18,2),
  promisedcommission_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  invoiceitemid bigint,
  createuserid bigint,
  paidamount numeric(18,2),
  paidamount_cur integer,
  primarywrittenoffcommission numeric(18,2),
  beanversion integer,
  archivepartition bigint,
  primarydirectbillearned numeric(18,2),
  retired bigint,
  primarydirectbillearned_cur integer,
  updateuserid bigint,
  primaryagencybillretained numeric(18,2),
  status integer,
  promisedandpaidamount numeric(18,2),
  primaryagencybillretained_cur integer,
  promisedandpaidamount_cur integer,
  statementinvoiceid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_spclstsvcparent (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_specialistservice (
  createuserid bigint,
  publicid character varying(64),
  active boolean,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  name character varying(255),
  code character varying(255),
  updateuserid bigint,
  updatetime timestamp without time zone,
  id bigint,
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_specsvcdesc_l10n (
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_specsvcname_l10n (
  value character varying(255),
  owner bigint,
  publicid character varying(64),
  beanversion integer,
  language integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_standardworkqueue (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  queuetype integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  target bigint,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_statementbilledworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  producerid bigint,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_statementdueworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  producerid bigint,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_subrogation (
  loadcommandid bigint,
  claimnumberdenorm character varying(510),
  createuserid bigint,
  publicid character varying(64),
  claimnumber character varying(255),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  sourceaccountid bigint,
  updateuserid bigint,
  chargeid bigint,
  currency integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_subworkflows (
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_suspensepayment (
  policyperiodappliedtoid bigint,
  producerappliedtoid bigint,
  publicid character varying(64),
  accountappliedtoid bigint,
  paymentinstrumentid bigint,
  createtime timestamp without time zone,
  currency integer,
  offeroption character varying(255),
  reverseddate_ext timestamp without time zone,
  associatedaccountnumber_ext character varying(255),
  reversepaymentreason_sp integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  refnumberdenorm character varying(510),
  amount_cur integer,
  hiddentaccountcontainerid bigint,
  producernamedenorm character varying(510),
  id bigint,
  refnumber character varying(255),
  producername character varying(255),
  createuserid bigint,
  offernumber character varying(255),
  beanversion integer,
  retired bigint,
  reportinggroupid bigint,
  updateuserid bigint,
  batchpayment_sp bigint,
  status integer,
  accountnumberdenorm character varying(510),
  paymentdate timestamp without time zone,
  integrationerrormessage_ext character varying(1333),
  boacoupontype_ext character varying(255),
  invoicenumber character varying(255),
  accountnumber character varying(255),
  paymentmoneyreceivedid bigint,
  policynumberdenorm character varying(510),
  issuspadjustment_ext boolean,
  appliedbyuserid bigint,
  policynumber character varying(255),
  description character varying(1333),
  susppayreversalreason_ext integer,
  uwcompany_ext integer,
  reversedbyuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_suspensepaymentworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  suspensepaymentid bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_susppymtcontext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  suspensepaymentid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  transactionid bigint,
  subtype integer,
  id bigint,
  disbursementid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_systemparameter (
  value character varying(300),
  name character varying(120)
);

CREATE TABLE IF NOT EXISTS public.bc_tabledatadist (
  publicid character varying(64),
  numupdates bigint,
  databasedatadistid bigint,
  entityname character varying(255),
  numupdatedrows bigint,
  tablename character varying(63),
  stagingtabledist boolean,
  id bigint,
  platformtable boolean,
  numretiredrows bigint,
  typelisttabledist boolean,
  numloadedthrustagingtables bigint,
  numrows bigint,
  admintable boolean
);

CREATE TABLE IF NOT EXISTS public.bc_tableparent (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_tableupdatestats (
  publicid character varying(64),
  databaseupdatestatsid bigint,
  endtime timestamp without time zone,
  tablename character varying(63),
  id bigint,
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_tableupdatestatsstatement (
  updatestatstype integer,
  tableupdatestatsid bigint,
  publicid character varying(64),
  updatestatsstatement text,
  objectname character varying(255),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_taccount (
  loadcommandid bigint,
  createuserid bigint,
  taccountcontainerid bigint,
  publicid character varying(64),
  beanversion integer,
  archivepartition bigint,
  createtime timestamp without time zone,
  creationorder integer,
  updateuserid bigint,
  currency integer,
  taccountpatternid bigint,
  updatetime timestamp without time zone,
  balancedenorm numeric(18,2),
  subtype integer,
  balancedenorm_cur integer,
  id bigint,
  description character varying(255),
  fundssourceid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_taccountcontainer (
  loadcommandid bigint,
  publicid character varying(64),
  createtime timestamp without time zone,
  unearneddenorm numeric(18,2),
  unearneddenorm_cur integer,
  currency integer,
  expensedenorm numeric(18,2),
  updatetime timestamp without time zone,
  expensedenorm_cur integer,
  revenuedenorm numeric(18,2),
  revenuedenorm_cur integer,
  id bigint,
  createuserid bigint,
  negativewriteoffdenorm numeric(18,2),
  billeddenorm numeric(18,2),
  negativewriteoffdenorm_cur integer,
  billeddenorm_cur integer,
  writeoffexpensedenorm numeric(18,2),
  writeoffexpensedenorm_cur integer,
  archivepartition bigint,
  beanversion integer,
  updateuserid bigint,
  duedenorm numeric(18,2),
  duedenorm_cur integer,
  reservedenorm numeric(18,2),
  subtype integer,
  reservedenorm_cur integer,
  unbilleddenorm numeric(18,2),
  unbilleddenorm_cur integer
);

CREATE TABLE IF NOT EXISTS public.bc_taccountpattern (
  createuserid bigint,
  taccountname character varying(255),
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  suffix integer,
  taccountownerpatternid bigint,
  taccountlazyloaded boolean,
  taccounttype integer,
  updatetime timestamp without time zone,
  chargepatternid bigint,
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_tacctownerpattern (
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  taccountowner character varying(255),
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_tempnewpolicycmsnpayable (
  currency integer,
  transactionnumber character varying(255),
  amount numeric(18,2),
  transactionid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_tempowneridtacctidnewbal (
  currency integer,
  cmsnpayabletacctid bigint,
  policycommissionid bigint,
  newbalancedenorm numeric(18,2),
  chargecommissionid bigint,
  producerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_tmpcontactaddresslink (
  publicid character varying(64),
  id bigint,
  tempaddressid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_tmphaschargebilledanddue (
  haschargeduetransaction boolean,
  haschargebilledtransaction boolean,
  invoiceitemid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_tmpmodifier (
  modifierid bigint,
  publicid character varying(64),
  id bigint,
  chargeid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_tmppolicytaccount (
  publicid character varying(64),
  taccountname character varying(255),
  plcytaccountid bigint,
  accttaccountid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_tmpsearchcolumns (
  intvalue integer,
  varcharvalue character varying(1333),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_tmpstginvitemdenorms (
  invoicepublicid character varying(64),
  primaryagencybillretained numeric(18,2),
  grossamountwrittenoff numeric(18,2),
  paidamount numeric(18,2),
  invoiceitempublicid character varying(64),
  primarywrittenoffcommission numeric(18,2),
  primarycommissionamount numeric(18,2),
  grosssettled boolean,
  canbepaidmorebyagencybill boolean,
  amount numeric(18,2),
  primarydirectbillearned numeric(18,2)
);

CREATE TABLE IF NOT EXISTS public.bc_tmpstgtacctcontdenorms (
  duedenorm numeric(18,2),
  negativewriteoffdenorm numeric(18,2),
  billeddenorm numeric(18,2),
  writeoffexpensedenorm numeric(18,2),
  expensedenorm numeric(18,2),
  containerpublicid character varying(64),
  revenuedenorm numeric(18,2),
  reservedenorm numeric(18,2),
  unbilleddenorm numeric(18,2),
  unearneddenorm numeric(18,2)
);

CREATE TABLE IF NOT EXISTS public.bc_tmptaccount (
  publicid character varying(64),
  taccountid bigint,
  id bigint,
  balance numeric(18,2)
);

CREATE TABLE IF NOT EXISTS public.bc_transaction (
  loadcommandid bigint,
  reversed boolean,
  commissionamount numeric(18,2),
  publicid character varying(64),
  commissionamount_cur integer,
  reason integer,
  createtime timestamp without time zone,
  transactiondate timestamp without time zone,
  commissionamountchanged numeric(18,2),
  currency integer,
  commissionamountchanged_cur integer,
  reversalreason integer,
  writeoffchannel integer,
  cmsnadjustment_ext bigint,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  id bigint,
  createuserid bigint,
  transactionnumberdenorm character varying(510),
  transactionnumber character varying(255),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  updateuserid bigint,
  subtype integer,
  basis numeric(18,2),
  basis_cur integer
);

CREATE TABLE IF NOT EXISTS public.bc_transactionid (
  creationtime timestamp without time zone,
  tid character varying(128)
);

CREATE TABLE IF NOT EXISTS public.bc_transfertxcontext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  targetunappliedtaccountid bigint,
  beanversion integer,
  sourceproducerid bigint,
  createtime timestamp without time zone,
  sourceaccountid bigint,
  updateuserid bigint,
  currency integer,
  fundstransferid bigint,
  updatetime timestamp without time zone,
  targetaccountid bigint,
  transactionid bigint,
  id bigint,
  sourceunappliedtaccountid bigint,
  targetproducerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_troubleticket (
  escalationdate timestamp without time zone,
  previousgroupid bigint,
  publicid character varying(64),
  tickettype integer,
  troubleticketnumberdenorm character varying(510),
  createtime timestamp without time zone,
  assignedbyuserid bigint,
  troubleticketnumber character varying(255),
  detaileddescription character varying(1333),
  assignedgroupid bigint,
  titledenorm character varying(510),
  previousqueueid bigint,
  updatetime timestamp without time zone,
  title character varying(255),
  id bigint,
  previoususerid bigint,
  closeuserid bigint,
  assignedqueueid bigint,
  createuserid bigint,
  priority integer,
  closedate timestamp without time zone,
  beanversion integer,
  retired bigint,
  updateuserid bigint,
  escalated boolean,
  assigneduserid bigint,
  assignmentdate timestamp without time zone,
  targetdate timestamp without time zone,
  assignmentstatus integer
);

CREATE TABLE IF NOT EXISTS public.bc_troubleticketjoinentity (
  archivedtransactionpublicid character varying(64),
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  accountid bigint,
  retired bigint,
  createtime timestamp without time zone,
  policyid bigint,
  producerid bigint,
  policyperiodid bigint,
  updateuserid bigint,
  updatetime timestamp without time zone,
  transactionid bigint,
  id bigint,
  troubleticketid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_ttescalationworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  subtype integer,
  id bigint,
  troubleticketid bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_typecodecountdatadist (
  typekeydatadistid bigint,
  publicid character varying(64),
  typecode character varying(50),
  typecodecount bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_typecodeusagerpt (
  columnname character varying(255),
  publicid character varying(64),
  reportitem text,
  typelist character varying(255),
  tablename character varying(63),
  id bigint,
  count bigint
);

CREATE TABLE IF NOT EXISTS public.bc_typekeydatadist (
  typekeyname character varying(30),
  publicid character varying(64),
  tabledatadistid bigint,
  id bigint,
  numnonnull bigint
);

CREATE TABLE IF NOT EXISTS public.bc_unappliedfund (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  defaultaccountid bigint,
  beanversion integer,
  accountid bigint,
  createtime timestamp without time zone,
  reportinggroupid bigint,
  policyid bigint,
  updateuserid bigint,
  currency integer,
  taccountid bigint,
  updatetime timestamp without time zone,
  id bigint,
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_unappliedfundslice (
  loadcommandid bigint,
  createuserid bigint,
  historicalamount numeric(18,2),
  historicalamount_cur integer,
  publicid character varying(64),
  beanversion integer,
  eventdate timestamp without time zone,
  createtime timestamp without time zone,
  fundssource bigint,
  retired bigint,
  historical boolean,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  taccount bigint,
  amount_cur integer,
  id bigint,
  archivedtaccountpublicid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bc_unctmpnewplcycmsnpayable (
  currency integer,
  oldtransactionid bigint,
  amount numeric(18,2),
  newtransactionid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_upgradedatamodelinfo (
  loadcommandid bigint,
  platformminorvers integer,
  publicid character varying(64),
  extensionsvers integer,
  applicationminorvers integer,
  platformmajorvers integer,
  applicationmajorvers integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_upgradedbstorageset (
  afterupgrade boolean,
  publicid character varying(64),
  timetaken timestamp without time zone,
  id bigint,
  name character varying(255),
  upgradedbstoragesettype integer,
  upgradeinstanceid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_upgradedbstoragesetcolumns (
  columnname character varying(255),
  columnclass character varying(255),
  publicid character varying(64),
  keycolumn boolean,
  columnorder integer,
  id bigint,
  comparecolumn boolean,
  upgradedbstoragesetid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_upgradedbstoragesetresults (
  value character varying(255),
  publicid character varying(64),
  roworder integer,
  columnorder integer,
  id bigint,
  upgradedbstoragesetid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_upgradeinstance (
  numdefdtaskscompleted integer,
  publicid character varying(64),
  sourcebuildversion character varying(255),
  rolling boolean,
  backedout boolean,
  sourceextensionsversion integer,
  finalizesteps bytea,
  proposedupgradeschemareport bytea,
  targetplmajorversion integer,
  databaseendtime timestamp without time zone,
  targetplminorversion integer,
  targetextensionsversion integer,
  profilerdata bytea,
  databasestarttime timestamp without time zone,
  targetchecksum character varying(255),
  sourceplmajorversion integer,
  resumed boolean,
  forced boolean,
  sourceplminorversion integer,
  id bigint,
  bluegreenoption integer,
  execduration integer,
  sourceappmajorversion integer,
  endtime timestamp without time zone,
  sourceappminorversion integer,
  reversemigration boolean,
  updatestatistics boolean,
  lockingcolumn integer,
  totalnumdefdtasks integer,
  starttime timestamp without time zone,
  targetappmajorversion integer,
  schemareportendtime timestamp without time zone,
  targetappminorversion integer,
  schemareportstarttime timestamp without time zone,
  targetbuildversion character varying(255),
  defdtaskscompleted boolean,
  failed boolean
);

CREATE TABLE IF NOT EXISTS public.bc_upgraderowcount (
  publicid character varying(64),
  rowcountchange integer,
  rowcountafterupgrade integer,
  rowcountbeforeupgrade integer,
  tablename character varying(63),
  id bigint,
  upgradeinstanceid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_upgradeschemaversion (
  upgradeschemaversion integer,
  name character varying(40)
);

CREATE TABLE IF NOT EXISTS public.bc_upgradetableregistry (
  publicid character varying(64),
  idnameafterupgrade character varying(8),
  idnamebeforeupgrade character varying(8),
  tablename character varying(63),
  id bigint,
  upgradeinstanceid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_upgradevtdbmsdump (
  upgradeinstance bigint,
  publicid character varying(64),
  execduration integer,
  endtime timestamp without time zone,
  versionactionname text,
  contents bytea,
  id bigint,
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_user (
  loadcommandid bigint,
  obfuscatedinternal boolean,
  publicid character varying(64),
  usersettingsid bigint,
  createtime timestamp without time zone,
  sessiontimeoutsecs integer,
  organizationid bigint,
  vacationstatus integer,
  department character varying(255),
  externaluser boolean,
  updatetime timestamp without time zone,
  language integer,
  experiencelevel integer,
  locale integer,
  id bigint,
  authorityprofileid bigint,
  createuserid bigint,
  beanversion integer,
  defaultphonecountry integer,
  retired bigint,
  validationlevel integer,
  updateuserid bigint,
  credentialid bigint,
  systemusertype integer,
  defaultcountry integer,
  timezone integer,
  contactid bigint,
  jobtitle character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_userbackup (
  loadcommandid bigint,
  publicid character varying(64),
  userid bigint,
  beanversion integer,
  backupuserid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_usergroupstats (
  publicid character varying(64),
  calculatedate timestamp without time zone,
  userid bigint,
  groupid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_userregion (
  loadcommandid bigint,
  publicid character varying(64),
  userid bigint,
  beanversion integer,
  id bigint,
  regionid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_userrole (
  loadcommandid bigint,
  roleid bigint,
  publicid character varying(64),
  userid bigint,
  beanversion integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_userroleassign (
  loadcommandid bigint,
  previousgroupid bigint,
  publicid character varying(64),
  active boolean,
  createtime timestamp without time zone,
  assignedbyuserid bigint,
  assignedgroupid bigint,
  previousqueueid bigint,
  updatetime timestamp without time zone,
  workflowid bigint,
  id bigint,
  previoususerid bigint,
  assignedqueueid bigint,
  troubleticketid bigint,
  createuserid bigint,
  closedate timestamp without time zone,
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  updateuserid bigint,
  assigneduserid bigint,
  comments character varying(255),
  role integer,
  assignmentdate timestamp without time zone,
  disbursementid bigint,
  assignmentstatus integer
);

CREATE TABLE IF NOT EXISTS public.bc_usersettings (
  rotatetables boolean,
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  cancelalertdismiss timestamp without time zone,
  printpagenums boolean,
  retired bigint,
  createtime timestamp without time zone,
  lastpolicyperiods text,
  lastproducers text,
  startuppage integer,
  updateuserid bigint,
  updatetime timestamp without time zone,
  showprintpreview boolean,
  printmargins numeric(2,1),
  id bigint,
  lastaccounts text
);

CREATE TABLE IF NOT EXISTS public.bc_useruipreferences (
  createuserid bigint,
  publicid character varying(64),
  uipreferences bytea,
  updatetime timestamp without time zone,
  userid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_visibilityzone (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_workflow (
  previousgroupid bigint,
  enteredstep timestamp without time zone,
  previousstep character varying(255),
  publicid character varying(64),
  currentstep character varying(255),
  topleveldelinquencyprocessid bigint,
  messagehistoryid bigint,
  processversion integer,
  createtime timestamp without time zone,
  handler integer,
  assignedbyuserid bigint,
  activestate integer,
  assignedgroupid bigint,
  logentrycounter integer,
  state integer,
  previousqueueid bigint,
  updatetime timestamp without time zone,
  id bigint,
  currentbranch character varying(255),
  previoususerid bigint,
  assignedqueueid bigint,
  testtime timestamp without time zone,
  messageid bigint,
  createuserid bigint,
  closedate timestamp without time zone,
  archivepartition bigint,
  beanversion integer,
  agencycycleprocessid bigint,
  retired bigint,
  stepexectime bigint,
  timeouttime timestamp without time zone,
  currentaction integer,
  updateuserid bigint,
  reinstatementamount_cur integer,
  assigneduserid bigint,
  triggerinvoked integer,
  delinquencyprocessid bigint,
  reinstatementamount_amt numeric(18,2),
  forcetimeoutbranch character varying(255),
  subtype integer,
  assignmentdate timestamp without time zone,
  assignmentstatus integer
);

CREATE TABLE IF NOT EXISTS public.bc_workflowlog (
  publicid character varying(64),
  summary character varying(1333),
  userid bigint,
  stepid character varying(255),
  beanversion integer,
  archivepartition bigint,
  sortorder integer,
  logdate timestamp without time zone,
  action integer,
  subtype integer,
  id bigint,
  description text,
  displaykey character varying(255),
  argument integer,
  workflow bigint
);

CREATE TABLE IF NOT EXISTS public.bc_workflowstepstats (
  exectimemean bigint,
  publicid character varying(64),
  exectimemax bigint,
  endtime timestamp without time zone,
  processversion integer,
  elapsedtimemin bigint,
  elapsedtimemean bigint,
  starttime timestamp without time zone,
  exectimestddev bigint,
  exectimemin bigint,
  stepname character varying(255),
  workflowtype integer,
  id bigint,
  executions integer,
  elapsedtimemax bigint,
  elapsedtimestddev bigint,
  serverid character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_workflowworkitem (
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  workflowid bigint,
  subtype integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bc_workitemset (
  state integer,
  publicid character varying(64),
  numtotalops integer,
  numopscanceled integer,
  processhistory bigint,
  workitemsettype integer,
  endtime timestamp without time zone,
  numopsfailed integer,
  id bigint,
  numopscompleted integer,
  starttime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_workqueuestate (
  publicid character varying(64),
  updatetime bigint,
  active boolean,
  id bigint,
  workqueueid integer
);

CREATE TABLE IF NOT EXISTS public.bc_workqueueworkercontrol (
  publicid character varying(64),
  lockname character varying(50),
  id bigint,
  lastexecutiontime timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_wothresholdoverride (
  loadcommandid bigint,
  jurisdiction integer,
  createuserid bigint,
  inuse boolean,
  publicid character varying(64),
  thresholdtype integer,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  updateuserid bigint,
  product integer,
  paymentplan bigint,
  writeoffreason integer,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  servicetier integer,
  id bigint,
  uwcompany integer,
  billingmethod integer,
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_wothresholdoverrideamt (
  loadcommandid bigint,
  inuse boolean,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  id bigint,
  wothresholdoverride bigint
);

CREATE TABLE IF NOT EXISTS public.bc_writeoff (
  loadcommandid bigint,
  reversed boolean,
  taccountcontainerid bigint,
  reason integer,
  publicid character varying(64),
  executiondate timestamp without time zone,
  createtime timestamp without time zone,
  currency integer,
  updatetime timestamp without time zone,
  amount numeric(18,2),
  itemcommissionid bigint,
  requestinguserid bigint,
  amount_cur integer,
  reversedamount numeric(18,2),
  invoiceitemid bigint,
  reversedamount_cur integer,
  id bigint,
  createuserid bigint,
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  producerid bigint,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  approvalstatus integer,
  chargepatternid bigint,
  chargecommissionid bigint,
  grossagencypmntitemid bigint,
  subtype integer,
  cmsnagencypmntitemid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_writeoffreversal (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  reason integer,
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  writeoffid bigint,
  updateuserid bigint,
  approvaldate timestamp without time zone,
  approvalstatus integer,
  updatetime timestamp without time zone,
  requestinguserid bigint,
  id bigint,
  reversaldate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bc_writeoffstagingworkitem (
  processhistoryid bigint,
  priority integer,
  publicid character varying(64),
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150),
  chargewriteoffid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_writeoffthresholddefault (
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  delinquencyplanid bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bc_zamrunappliedfundslice (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_zdmrunappliedfundslice (
  foreignentityid bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bc_zerocmsnearnedmarker (
  loadcommandid bigint,
  createuserid bigint,
  basepaymentitemid bigint,
  publicid character varying(64),
  chargewrittenoffid bigint,
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  currency integer,
  updatetime timestamp without time zone,
  id bigint,
  itemcommission bigint
);

CREATE TABLE IF NOT EXISTS public.bc_zone (
  loadcommandid bigint,
  publicid character varying(64),
  country integer,
  zonetype integer,
  beanversion integer,
  namedenorm character varying(510),
  codedenorm character varying(510),
  id bigint,
  name character varying(255),
  code character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bc_zone_link (
  loadcommandid bigint,
  zone1id bigint,
  zone2id bigint,
  publicid character varying(64),
  beanversion integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcst_account (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  createartifacts_ext boolean,
  securityzoneid character varying(64),
  secondtwicepermthinvoicedom integer,
  currency character varying(50),
  firsttwicepermthinvoicedom integer,
  servicetier character varying(50),
  hiddentaccountcontainerid character varying(64),
  invoicedayofweek character varying(50),
  invoicedayofmonth integer,
  invoicedeliverytype character varying(50),
  accountnamekanji character varying(255),
  dba character varying(255),
  fein character varying(255),
  allocationplanid character varying(64),
  delinquencystatus character varying(50),
  appeventsyncstatus character varying(50),
  closedate timestamp without time zone,
  accounttype character varying(50),
  billinglevel character varying(50),
  chargeheld boolean,
  newpolicypaymentdistributable boolean,
  organizationtype character varying(255),
  billdateorduedatebilling character varying(50),
  distributionlimittype character varying(50),
  segment character varying(50),
  accountnumber character varying(255),
  delinquencyplanid character varying(64),
  accountname character varying(255),
  collecting boolean,
  everyotherweekinvoiceanchor timestamp without time zone,
  uwcompany_ext character varying(50),
  collectionagencyid character varying(64),
  billingplanid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_accountcontact (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  accountid character varying(64),
  primarypayer boolean,
  contactid character varying(64),
  insuredaccountid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_accountcontactrole (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  role character varying(50),
  accountcontactid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_accountcontext (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  unappliedfundid character varying(64),
  accountid character varying(64),
  currency character varying(50),
  acctnegativewriteoffid character varying(64),
  transactionid character varying(64),
  disbursementid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_accountgroup (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  mainaccountid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_accountpaymentplan (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  accountid character varying(64),
  paymentplanid character varying(64),
  currency character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_acctcmsnexpenseworkitem (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  processhistoryid bigint,
  priority integer,
  attempts integer,
  accountid character varying(64),
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status character varying(50),
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bcst_acctcorrespondenceentry (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  acctcorrespondencetype character varying(50),
  accountcontactid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_acctcurrencygrp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  currencyingroup character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_acctinvcpolpersnapshot (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  remainingbalance numeric(18,2),
  remainingbalance_cur character varying(50),
  policyperiodid character varying(64),
  currency character varying(50),
  outstandingamount numeric(18,2),
  outstandingamount_cur character varying(50),
  accountinvoiceid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_acctpmntinst (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_acifundingsso_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  refreshneeded boolean,
  ssokey text,
  accountnumber character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_acinotification_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  body text,
  subject character varying(1333),
  recipientemailaddress character varying(255),
  accountnumber character varying(255),
  policynumber character varying(40)
);

CREATE TABLE IF NOT EXISTS public.bcst_aciprofile_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  profileid bigint,
  accountnumber character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_acpreceivedateentryext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  batchnumber character varying(25),
  manual boolean,
  processed boolean,
  receivedate timestamp without time zone,
  transactioncount integer,
  processeddate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_activemoneyrcvd (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_activity (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  previousgroupid character varying(64),
  accountid character varying(64),
  enddate timestamp without time zone,
  assignedbyuserid character varying(64),
  externallyowned boolean,
  fundstransferid character varying(64),
  logicalname character varying(255),
  approvalrationale character varying(255),
  documenttemplate character varying(255),
  commpaymentid character varying(64),
  previousqueueid character varying(64),
  emailtemplate character varying(255),
  writeoffreversalid character varying(64),
  workflowid character varying(64),
  chargereversalid character varying(64),
  closeuserid character varying(64),
  troubleticketid character varying(64),
  creditreversalid character varying(64),
  priority character varying(50),
  closedate timestamp without time zone,
  validationlevel character varying(50),
  subject character varying(255),
  shortsubject character varying(10),
  approved boolean,
  delinquencyprocessid character varying(64),
  negativewriteoffrevid character varying(64),
  advancecmsnpaymentid character varying(64),
  type character varying(50),
  contactid character varying(64),
  bonuscmsnpaymentid character varying(64),
  targetdate timestamp without time zone,
  negativewriteoffid character varying(64),
  autogenerated boolean,
  escalationdate timestamp without time zone,
  lastvieweddate timestamp without time zone,
  activityclass character varying(50),
  writeoffid character varying(64),
  command character varying(1333),
  assignedgroupid character varying(64),
  policyperiodid character varying(64),
  creditid character varying(64),
  mandatory boolean,
  recurring boolean,
  previoususerid character varying(64),
  assignedqueueid character varying(64),
  fundstransferreversalid character varying(64),
  escalated boolean,
  status character varying(50),
  producer_ext character varying(64),
  assigneduserid character varying(64),
  producerpayabletransferid character varying(64),
  approvalissue character varying(255),
  assignmentdate timestamp without time zone,
  disbursementid character varying(64),
  activitypatternid character varying(64),
  description character varying(1333),
  uwcompany_ext character varying(50),
  assignmentstatus character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_activitypattern (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  escbuscallocpath character varying(255),
  activityclass character varying(50),
  assignablequeue_ext character varying(64),
  command character varying(1333),
  ccgenerationallowed_sp boolean,
  targetincludedays character varying(50),
  documenttemplate character varying(255),
  emailtemplate character varying(255),
  escalationbuscaltag character varying(50),
  mandatory boolean,
  escalationhours integer,
  targetbuscaltag character varying(50),
  automatedonly boolean,
  group_sp character varying(64),
  recurring boolean,
  targethours integer,
  pcgenerationallowed_sp boolean,
  priority character varying(50),
  targetbuscallocpath character varying(255),
  targetdays integer,
  subject character varying(255),
  escalationdays integer,
  code character varying(60),
  shortsubject character varying(10),
  escalationstartpt character varying(50),
  type character varying(50),
  escalationincldays character varying(50),
  description character varying(1333),
  category character varying(50),
  targetstartpoint character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_actpat_desc_l10n (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  value character varying(1333),
  owner character varying(64),
  language character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_actpat_ssbj_l10n (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  value character varying(10),
  owner character varying(64),
  language character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_actpat_subj_l10n (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  value character varying(255),
  owner character varying(64),
  language character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_addlinterestdetail_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  mortgagepositiontype_ext character varying(50),
  certrequired boolean,
  policyaddlinterest character varying(64),
  additionalinteresttype character varying(50),
  contractnumber character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_address (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  obfuscatedinternal boolean,
  batchgeocode boolean,
  extrafield1 character varying(60),
  extrafield2 character varying(60),
  extrafield10 character varying(60),
  addressline1 character varying(60),
  extrafield3 character varying(60),
  addressline2 character varying(60),
  county character varying(60),
  extrafield4 character varying(60),
  addressline3 character varying(60),
  extrafield5 character varying(60),
  citykanji character varying(60),
  extrafield6 character varying(60),
  addressline2kanji character varying(60),
  extrafield7 character varying(60),
  extrafield8 character varying(60),
  extrafield9 character varying(60),
  state character varying(50),
  addressbookuid character varying(64),
  country character varying(50),
  validuntil timestamp without time zone,
  city character varying(60),
  addressline1kanji character varying(60),
  addresstype character varying(50),
  cedexbureau character varying(2),
  cedex boolean,
  postalcode character varying(60),
  subtype character varying(50),
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_adminaudit_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  originalvalue text,
  modifiedbyuserid character varying(30),
  modifiedentityid integer,
  modifiedentitypublicid character varying(50),
  newvalue text,
  modifiedobjectname character varying(100),
  modifiedbyusername character varying(100),
  modifieddate timestamp without time zone,
  modifiedentityname character varying(100),
  modifiedfieldname character varying(100)
);

CREATE TABLE IF NOT EXISTS public.bcst_agencybillcycle (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  producerid character varying(64),
  currency character varying(50),
  statementinvoiceid character varying(64),
  subtype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_agencycycleprocess (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  pastdueexceptiongenerated boolean,
  statementsent boolean,
  paymentpastduecomments character varying(1333),
  currency character varying(50),
  genpromiseexceptiondate timestamp without time zone,
  promiseexceptiondismissed boolean,
  sendstatementdate timestamp without time zone,
  senddunning1date timestamp without time zone,
  senddunning2date timestamp without time zone,
  promisepastduecomments character varying(1333),
  pastdueexceptiondismissed boolean,
  promiseremindersent boolean,
  genpastdueexceptiondate timestamp without time zone,
  sendpromisereminderdate timestamp without time zone,
  agencybillcycleid character varying(64),
  dunning1sent boolean,
  dunning2sent boolean,
  subtype character varying(50),
  promiseexceptiongenerated boolean
);

CREATE TABLE IF NOT EXISTS public.bcst_agencydisbpaidcontext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  agencydisbursementid character varying(64),
  producerid character varying(64),
  currency character varying(50),
  transactionid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_agencymoneyrcvdcontext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  producerid character varying(64),
  currency character varying(50),
  paymentmoneyreceivedid character varying(64),
  transactionid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_agentemaildetails_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  body text,
  subject character varying(1333),
  account character varying(64),
  recipientemailaddress character varying(255),
  policyperiod character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_appeventstest (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_archiveaccountpdrollupctx (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  currency character varying(50),
  chargepatternid character varying(64),
  transactionid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_archivecmsnrollupctx (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  currency character varying(50),
  role character varying(50),
  transactionid character varying(64),
  producercodeid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_archiveprodpdrollupctx (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  currency character varying(50),
  chargepatternid character varying(64),
  transactionid character varying(64),
  producercodeid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_assignqueue (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  name character varying(255),
  subgroupvisible boolean,
  groupid character varying(64),
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_attr_desc_l10n (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  value character varying(255),
  owner character varying(64),
  language character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_attr_name_l10n (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  value character varying(1333),
  owner character varying(64),
  language character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_attribute (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  active boolean,
  name character varying(255),
  type character varying(50),
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcst_attributeuser (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  textfield1 character varying(255),
  datefield1 timestamp without time zone,
  textfield2 character varying(255),
  userid character varying(64),
  datefield2 timestamp without time zone,
  textfield3 character varying(255),
  datefield3 timestamp without time zone,
  value integer,
  state character varying(50),
  attributeid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_basedist (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  writeoffamount numeric(18,2),
  writeoffamount_cur character varying(50),
  applieddate timestamp without time zone,
  distributeddate timestamp without time zone,
  currency character varying(50),
  netdisttoinvoiceitems_cur character varying(50),
  netdistributedtoinvoiceitems numeric(18,2),
  reversaldate timestamp without time zone,
  netinsuspense numeric(18,2),
  netinsuspense_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_basedistitem (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  reverseddistid character varying(64),
  activedistid character varying(64),
  policyperiodid character varying(64),
  currency character varying(50),
  producercodeid character varying(64),
  invoiceitemid character varying(64),
  applieddate timestamp without time zone,
  reverseddate timestamp without time zone,
  commissionamounttoapply numeric(18,2),
  commissionamounttoapply_cur character varying(50),
  grossamounttoapply numeric(18,2),
  disposition character varying(50),
  grossamounttoapply_cur character varying(50),
  paymentcomments character varying(255),
  executeddate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_basemoneyreceived (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  invoiceid character varying(64),
  accountid character varying(64),
  paymentinstrumentid character varying(64),
  name character varying(255),
  policyperiodid character varying(64),
  receiveddate timestamp without time zone,
  currency character varying(50),
  basedistid character varying(64),
  reversalreason character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50),
  refnumber character varying(255),
  userrevfeeoverride_sp character varying(50),
  unappliedfundid character varying(64),
  applieddate timestamp without time zone,
  reportinggroupid character varying(64),
  producerid character varying(64),
  batchpayment_sp character varying(64),
  boacoupontype_ext character varying(255),
  isadjustment_ext boolean,
  reversaldate timestamp without time zone,
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcst_basenonrecdistitem (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  reverseddistid character varying(64),
  activedistid character varying(64),
  matchingpolicyid character varying(64),
  releaseddate timestamp without time zone,
  reverseddate timestamp without time zone,
  commissionamounttoapply numeric(18,2),
  commissionamounttoapply_cur character varying(50),
  currency character varying(50),
  grossamounttoapply numeric(18,2),
  grossamounttoapply_cur character varying(50),
  paymentcomments character varying(255),
  policynumber character varying(255),
  executeddate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_batchpayment_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  paymenttype character varying(50),
  unappliedfund character varying(64),
  batchentryreversalreason character varying(50),
  sequencenumber character varying(50),
  controlcode character varying(255),
  enteredby character varying(255),
  amount numeric(18,2),
  amount_cur character varying(50),
  refnumber character varying(255),
  producername character varying(255),
  amountdue_cur character varying(50),
  paymentsource character varying(255),
  amountdue_amt numeric(18,2),
  batchpaymentgroup_sp character varying(64),
  batchentrystatus character varying(50),
  paymentinstrument character varying(64),
  invoicenumber character varying(255),
  accountnumber character varying(255),
  paymentgroup character varying(255),
  subtype character varying(50),
  policynumber character varying(255),
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcst_batchpaymentgroup_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  entereduser character varying(64),
  batchnumber character varying(50),
  depositdate timestamp without time zone,
  reverseduser character varying(64),
  batchamount numeric(18,2),
  batchamount_cur character varying(50),
  uwcompany character varying(50),
  deposit character varying(64),
  collectionagency character varying(64),
  isexception boolean,
  batchstatus character varying(50),
  keyeddate timestamp without time zone,
  posteddate timestamp without time zone,
  subtype character varying(50),
  reversaldate timestamp without time zone,
  errormessage character varying(1024)
);

CREATE TABLE IF NOT EXISTS public.bcst_batchpaymentsplit_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  paymenttype character varying(50),
  unappliedfund character varying(64),
  batchpayment character varying(64),
  enteredby character varying(255),
  accountnumber character varying(255),
  invoicenumber character varying(255),
  amount numeric(18,2),
  amount_cur character varying(50),
  policynumber character varying(255),
  description character varying(1333),
  producername character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_batchpaymentworkitem_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  processhistoryid bigint,
  priority integer,
  attempts integer,
  queuetype character varying(50),
  batchpayment character varying(64),
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status character varying(50),
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bcst_batchpmntrevworkitem_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  processhistoryid bigint,
  priority integer,
  attempts integer,
  queuetype character varying(50),
  batchpayment character varying(64),
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status character varying(50),
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bcst_billinginstruction (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  holdunbilledpremiumcharges boolean,
  cancellationreason character varying(255),
  accountid character varying(64),
  paymentplanid character varying(64),
  claimtransactionuri character varying(1333),
  issuanceaccountid character varying(64),
  executed boolean,
  renewalaccountid character varying(64),
  currency character varying(50),
  totalpremium boolean,
  policypaymentplanid character varying(64),
  priorpolicyperiodid character varying(64),
  specialhandling character varying(50),
  policyperiodforclaimid character varying(64),
  offernumber character varying(255),
  finalaudit boolean,
  periodenddate timestamp without time zone,
  newrenewalaccountid character varying(64),
  segregatedcollreqid character varying(64),
  cancellationtype character varying(50),
  assessedsurcharge_ext character varying(64),
  collateralrequirementid character varying(64),
  modificationdate timestamp without time zone,
  checkpublicid character varying(64),
  edwassocpolicyperiodid_ext character varying(64),
  policyid character varying(64),
  premiumreportduedateid character varying(64),
  associatedpolicyperiodid character varying(64),
  paymentduedate timestamp without time zone,
  biclaimnumber character varying(255),
  billinginstructiondate timestamp without time zone,
  depositrequirement numeric(18,2),
  depositrequirement_cur character varying(50),
  paymentreceived boolean,
  newpolicyperiodid character varying(64),
  payerproducercodeid character varying(64),
  periodstartdate timestamp without time zone,
  description character varying(255),
  rewriteaccountid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_bizruleoverrides_sp (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  acipaymentmethod character varying(50),
  feetype character varying(50),
  overridebit boolean,
  jurisdiction character varying(50),
  inuse boolean,
  planid character varying(64),
  switchplanfordisabledautodraft boolean,
  maximumpremiumamount numeric(18,2),
  maximumpremiumamount_cur character varying(50),
  effectivedate timestamp without time zone,
  dayunittype character varying(50),
  uwcompany character varying(50),
  billingmethod character varying(50),
  expirationdate timestamp without time zone,
  rate numeric(8,3),
  paymentrevreason character varying(50),
  minimumpremiumamount numeric(18,2),
  minimumpremiumamount_cur character varying(50),
  leadtimetype character varying(50),
  plantype character varying(50),
  overrideamount numeric(18,2),
  disbursementreason character varying(50),
  thresholdtype character varying(50),
  overrideamount_cur character varying(50),
  paymentmethod character varying(50),
  lowbalancemethod character varying(50),
  defaultselection boolean,
  overrideintvalue integer,
  paymentplan character varying(64),
  product character varying(50),
  writeoffreason character varying(50),
  delinquencyreason character varying(50),
  shouldcreateactivity boolean,
  producercode character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_bizweek_nam_l10n (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  value character varying(255),
  owner character varying(64),
  language character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_brkcattype_name_l10n (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  value character varying(255),
  owner character varying(64),
  language character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_businessweek (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  thursdaybusinessend timestamp without time zone,
  thursdaybusinessday boolean,
  saturdaybusinessend timestamp without time zone,
  saturdaybusinessday boolean,
  wednesdaybusinessend timestamp without time zone,
  wednesdaybusinessday boolean,
  thursdaybusinessstart timestamp without time zone,
  saturdaybusinessstart timestamp without time zone,
  mondaybusinessend timestamp without time zone,
  sundaybusinessend timestamp without time zone,
  name character varying(255),
  mondaybusinessday boolean,
  sundaybusinessday boolean,
  wednesdaybusinessstart timestamp without time zone,
  appliestoallzones boolean,
  mondaybusinessstart timestamp without time zone,
  sundaybusinessstart timestamp without time zone,
  businessdaydemarcation timestamp without time zone,
  fridaybusinessend timestamp without time zone,
  fridaybusinessday boolean,
  fridaybusinessstart timestamp without time zone,
  businessweekend character varying(50),
  tuesdaybusinessend timestamp without time zone,
  tuesdaybusinessday boolean,
  tuesdaybusinessstart timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_businessweek_zone (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  zonetype character varying(50),
  country character varying(50),
  code character varying(255),
  businessweekid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_catastrophe_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  detaileddescription character varying(1333),
  processed character varying(50),
  holdinvoice character varying(50),
  holddelinquency character varying(50),
  releasedate timestamp without time zone,
  title character varying(255),
  uwcompany character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_catastrophezone_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  zone character varying(255),
  catastropheid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_category_name_l10n (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  value character varying(255),
  owner character varying(64),
  language character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_charge (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  skipinvoiceitemcreation boolean,
  reversed boolean,
  taccountcontainerid character varying(64),
  writtendate timestamp without time zone,
  chargegroup character varying(255),
  billinginstructionid character varying(64),
  policysectionid character varying(64),
  currency character varying(50),
  holdreleasedate timestamp without time zone,
  amount numeric(18,2),
  amount_cur character varying(50),
  totalinstallments integer,
  overridinginvoicestreamid character varying(64),
  chargedate timestamp without time zone,
  overridingprimarycmsnrcvrid character varying(64),
  originalamount numeric(18,2),
  originalamount_cur character varying(50),
  overridingpayercontainerid character varying(64),
  holdstatus character varying(50),
  layerparty character varying(64),
  chargepatternid character varying(64),
  coinsuranceparty character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_chargebreakdowncategory (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  categoryidentifier character varying(255),
  categoryname character varying(255),
  categorytypeid character varying(64),
  subtype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_chargecommission (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  payablecriteria character varying(50),
  chargeid character varying(64),
  currency character varying(50),
  policycommissionid character varying(64),
  hiddentaccountcontainerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_chargeinstancecontext (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  directbillpaymentitemid character varying(64),
  writeoffid character varying(64),
  agencypaymentitemid character varying(64),
  chargeid character varying(64),
  currency character varying(50),
  fromproducerid character varying(64),
  transactionid character varying(64),
  invoiceitemid character varying(64),
  fromaccountid character varying(64),
  chargecommission character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_chargeproratatx (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  earndate timestamp without time zone,
  chargeid character varying(64),
  currency character varying(50),
  status character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_chargeslicingoverrides (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  downpaymentpercent numeric(5,2),
  downpaymentsecondinstallment character varying(50),
  daysfromrefdatetofirstinstall integer,
  daysfromrefdatetodownpayment integer,
  daysfromrefdatetoonetimecharge integer,
  daysfromrefdatetosecondinstall integer,
  chargeslicingmodifierid character varying(64),
  firstinstallmentafter character varying(50),
  onetimechargeafter character varying(50),
  secondinstallmentafter character varying(50),
  downpaymentafter character varying(50),
  maximumnumberofinstallments integer
);

CREATE TABLE IF NOT EXISTS public.bcst_checkregister_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  manualcheck boolean,
  checktype character varying(50),
  payeestate character varying(50),
  sourcesystem character varying(10),
  payeecountry character varying(50),
  checknumber bigint,
  couriercodetype character varying(50),
  payeeaddr1 character varying(33),
  payeezip character varying(10),
  payeeaddr2 character varying(33),
  couriercode character varying(8),
  paymentamount numeric(18,2),
  checkid integer,
  vendorid character varying(50),
  voucherref character varying(50),
  payeephone character varying(18),
  payee1 character varying(38),
  payee2 character varying(38),
  payee3 character varying(38),
  payee4 character varying(38),
  formcode character varying(8),
  payeecity character varying(33),
  reissuedchecknumber bigint,
  errordescription character varying(255),
  bankaccountnum character varying(17),
  memo1 character varying(38),
  memo2 character varying(38),
  checkstatus character varying(50),
  relatedactivity character varying(64),
  company character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_checkregisterdetail_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  claimnumber character varying(20),
  dateofloss timestamp without time zone,
  insured character varying(28),
  claimant character varying(18),
  checkregister character varying(64),
  netamount numeric(18,2),
  policynumber character varying(20),
  description character varying(33)
);

CREATE TABLE IF NOT EXISTS public.bcst_chgbreakdowncategorytype (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  name character varying(255),
  code character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_cmsnadjustment_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  amount_amt numeric(18,2),
  adjustmentreason character varying(50),
  producerfk character varying(64),
  amount_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_cmsnoverridesnapshot (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  rate numeric(5,2),
  invcitemcancellationsnapshot character varying(64),
  role character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_cmsnreduction (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  reversed boolean,
  datewrittenoff timestamp without time zone,
  chargewrittenoffid character varying(64),
  currency character varying(50),
  commissionwriteoffid character varying(64),
  amount numeric(18,2),
  amount_cur character varying(50),
  type character varying(50),
  chargecommissionid character varying(64),
  invoiceitemid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_cmsnsubplansectionrate (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  rate numeric(5,2),
  role character varying(50),
  commissionsubplanid character varying(64),
  sectiontype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_coinsuranceparty (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  coinsurancerole character varying(50),
  party character varying(64),
  fixedid character varying(64),
  coinsuranceshare numeric(5,2),
  partycode character varying(64),
  overridingpayercode character varying(64),
  ourparty boolean,
  coinsuranceagreement character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_collateral (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  accountid character varying(64),
  chargeheld boolean,
  totalcashvalueatrequirmnts_cur character varying(50),
  currency character varying(50),
  totallocvalue numeric(18,2),
  totallocvalue_cur character varying(50),
  hiddentaccountcontainerid character varying(64),
  compliance character varying(50),
  totalcashvalueatrequirements numeric(18,2)
);

CREATE TABLE IF NOT EXISTS public.bcst_collateralcontext (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  collateralrequirementid character varying(64),
  currency character varying(50),
  sourcecollreqid character varying(64),
  collateralid character varying(64),
  transactionid character varying(64),
  disbursementid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_collateralrequirement (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  locallocated numeric(18,2),
  locallocated_cur character varying(50),
  policyid character varying(64),
  policyperiodid character varying(64),
  requirementname character varying(255),
  currency character varying(50),
  collateralid character varying(64),
  effectivedate timestamp without time zone,
  hiddentaccountcontainerid character varying(64),
  expirationdate timestamp without time zone,
  required numeric(18,2),
  required_cur character varying(50),
  segregated boolean,
  cashallocated numeric(18,2),
  cashallocated_cur character varying(50),
  requirementtype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_collectionagency (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  subtype character varying(50),
  name character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcst_commissionoverride (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  rate numeric(5,2),
  chargeid character varying(64),
  currency character varying(50),
  role character varying(50),
  invoiceitemid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_commissionpayment (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  paymenttype character varying(50),
  payon timestamp without time zone,
  paid boolean,
  commcheckrevreason_ext character varying(50),
  city_ext character varying(60),
  producerpaymentid character varying(64),
  currency character varying(50),
  paymenttime character varying(50),
  comments_ext character varying(100),
  standardproducercodeid character varying(64),
  amount numeric(18,2),
  memo1_ext character varying(38),
  amount_cur character varying(50),
  requestinguserid character varying(64),
  producercodeid character varying(64),
  postalcode_ext character varying(60),
  description_ext character varying(33),
  editpayee_ext boolean,
  tfpa_ovrridmsgcreation_ext boolean,
  expired boolean,
  addressline1_ext character varying(60),
  addressline2_ext character varying(60),
  producerid character varying(64),
  approvaldate timestamp without time zone,
  maintainuntil timestamp without time zone,
  state_ext character varying(50),
  payeename_ext character varying(74),
  approvalstatus character varying(50),
  policycommissionid character varying(64),
  country_ext character varying(50),
  couriercode_ext character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_commsubplanchargepattrate (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  rate numeric(5,2),
  role character varying(50),
  chargepatternid character varying(64),
  commissionsubplanid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_contact (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  preferred boolean,
  obfuscatedinternal boolean,
  vendortype character varying(50),
  faxphonecountry character varying(50),
  particle character varying(30),
  taxid character varying(30),
  name character varying(60),
  vendornumber character varying(60),
  prefix character varying(50),
  score integer,
  preferredcurrency character varying(50),
  donotdestroy boolean,
  lastnamekanji character varying(30),
  taxfilingstatus character varying(50),
  withholdingrate numeric(5,2),
  middlename character varying(30),
  lastname character varying(30),
  externalid character varying(60),
  venuetype character varying(50),
  validationlevel character varying(50),
  primaryphone character varying(50),
  homephoneextension character varying(60),
  sexassignedatbirth character varying(50),
  firstname character varying(30),
  firstnamekanji character varying(30),
  gender character varying(50),
  notes text,
  numdependentsu18 integer,
  pronounpossessivetext character varying(30),
  homephonecountry character varying(50),
  licensenumber character varying(20),
  autosync character varying(50),
  cellphonecountry character varying(50),
  occupation character varying(80),
  cellphone character varying(30),
  primaryaddressid character varying(64),
  suffix character varying(50),
  addressbookuid character varying(64),
  authorizationid character varying(64),
  pronounaggregate character varying(50),
  emailaddress1 character varying(60),
  numdependents integer,
  dateofbirth timestamp without time zone,
  primarylanguage character varying(50),
  emailaddress2 character varying(60),
  primarylocale character varying(50),
  taxstatus character varying(50),
  numdependentsu25 integer,
  pronounsubjectivetext character varying(30),
  workphoneextension character varying(60),
  maritalstatus character varying(50),
  namekanji character varying(60),
  faxphoneextension character varying(60),
  homephone character varying(30),
  licensestate character varying(50),
  faxphone character varying(30),
  cellphoneextension character varying(60),
  employeenumber character varying(255),
  workphonecountry character varying(50),
  formername character varying(30),
  workphone character varying(30),
  pronounobjectivetext character varying(30)
);

CREATE TABLE IF NOT EXISTS public.bcst_contactaddress (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  addressbookuid character varying(64),
  contactid character varying(64),
  addressid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_contactcatsscore (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  obfuscatedinternal boolean,
  score integer,
  addressbookuid character varying(64),
  reviewcategory character varying(50),
  contactid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_contactcontact (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  sourcecontactid character varying(64),
  relatedcontactid character varying(64),
  addressbookuid character varying(64),
  relationship character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_contactfingerprint (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  contact character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_contacttag (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  addressbookuid character varying(64),
  type character varying(50),
  contactid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_credential (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  obfuscatedinternal boolean,
  failedattempts integer,
  active boolean,
  failedtime timestamp without time zone,
  username character varying(254),
  lockdate timestamp without time zone,
  password character varying(30)
);

CREATE TABLE IF NOT EXISTS public.bcst_credit (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  reversed boolean,
  unappliedfundid character varying(64),
  creditdate timestamp without time zone,
  accountid character varying(64),
  approvaldate timestamp without time zone,
  currency character varying(50),
  credittype character varying(50),
  approvalstatus character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50),
  requestinguserid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_creditcontext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  accountid character varying(64),
  currency character varying(50),
  creditid character varying(64),
  transactionid character varying(64),
  subtype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_creditreversal (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  approvaldate timestamp without time zone,
  creditid character varying(64),
  creditreversaldate timestamp without time zone,
  approvalstatus character varying(50),
  requestinguserid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_crossappactpattern_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  destinationapplication character varying(50),
  patterncode character varying(60),
  patterndisplayname character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_datecmsnpayableworkitem (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  processhistoryid bigint,
  priority integer,
  attempts integer,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  producerid character varying(64),
  exception text,
  availablesince numeric(19,0),
  status character varying(50),
  subtype character varying(50),
  policycommissionids text,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bcst_dbmoneyrcvdcontext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  accountid character varying(64),
  directbillmoneyrcvdid character varying(64),
  currency character varying(50),
  transactionid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_dbppayment_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  account character varying(64),
  payload text
);

CREATE TABLE IF NOT EXISTS public.bcst_delinquencyprocess (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  previousgroupid character varying(64),
  reason character varying(50),
  accountid character varying(64),
  inceptiondate timestamp without time zone,
  assignedbyuserid character varying(64),
  exitdate timestamp without time zone,
  assignedgroupid character varying(64),
  policyperiodid character varying(64),
  startdate timestamp without time zone,
  currency character varying(50),
  previousqueueid character varying(64),
  amount numeric(18,2),
  amount_cur character varying(50),
  previoususerid character varying(64),
  assignedqueueid character varying(64),
  helddate timestamp without time zone,
  closedate timestamp without time zone,
  status character varying(50),
  assigneduserid character varying(64),
  delinquencyplanid character varying(64),
  phase character varying(50),
  assignmentdate timestamp without time zone,
  assignmentstatus character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_delinquencyprocessevent (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  relativeorder integer,
  eventname character varying(50),
  triggerbasis character varying(50),
  completiontime timestamp without time zone,
  offsetdays integer,
  automatic boolean,
  currentdelinquencyprocessid character varying(64),
  currency character varying(50),
  approvalactivity character varying(64),
  delinquencyprocessid character varying(64),
  exacttargetdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_deposit_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  depositdate timestamp without time zone,
  checksreceived integer,
  depositstatus character varying(50),
  depositbatchtype character varying(50),
  depositamount numeric(18,2),
  depositamount_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_destinationhistory_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  destinationid integer,
  retryablecount integer,
  failedcount integer,
  status character varying(255),
  inflightcount integer,
  unsentcount integer
);

CREATE TABLE IF NOT EXISTS public.bcst_destinationmonitor_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  destinationid integer,
  retryablecount integer,
  failedcount integer,
  status character varying(255),
  inflightcount integer,
  unsentcount integer
);

CREATE TABLE IF NOT EXISTS public.bcst_destinationsuspensionext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  status character varying(50),
  destinationid integer
);

CREATE TABLE IF NOT EXISTS public.bcst_disbfundssliceallocation (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  disbursement character varying(64),
  unappliedfundslice character varying(64),
  ismanualallocation boolean,
  currency character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_disbthresholdoverride (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  jurisdiction character varying(50),
  inuse boolean,
  disbursementreason character varying(50),
  thresholdtype character varying(50),
  product character varying(50),
  paymentplan character varying(64),
  effectivedate timestamp without time zone,
  servicetier character varying(50),
  uwcompany character varying(50),
  billingmethod character varying(50),
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_disbthresholdoverrideamt (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  inuse boolean,
  disbthresholdoverride character varying(64),
  value numeric(18,2),
  currency character varying(50),
  value_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_disbursement (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  agencycyclepaymentid character varying(64),
  internalcomment character varying(255),
  reason character varying(50),
  disbtarget_ext character varying(50),
  accountid character varying(64),
  paymentinstrumentid character varying(64),
  disbursementaddressid character varying(64),
  currency character varying(50),
  collateralid character varying(64),
  amount numeric(18,2),
  voidreason character varying(50),
  amount_cur character varying(50),
  phonenumber_ext character varying(18),
  requestinguserid character varying(64),
  memo2_ext character varying(255),
  refnumber character varying(255),
  duedate timestamp without time zone,
  payto character varying(255),
  unappliedfundid character varying(64),
  closedate timestamp without time zone,
  suspensepaymentid character varying(64),
  disbursementnumber character varying(255),
  reportinggroupid character varying(64),
  producerid character varying(64),
  approvaldate timestamp without time zone,
  status character varying(50),
  mailto character varying(255),
  address character varying(1333),
  approvalstatus character varying(50),
  otherreason_ext character varying(255),
  couriercodetype_ext character varying(50),
  memo character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_dlnqleadtimeoverride (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  jurisdiction character varying(50),
  inuse boolean,
  leadtimetype character varying(50),
  product character varying(50),
  paymentplan character varying(64),
  effectivedate timestamp without time zone,
  servicetier character varying(50),
  delinquencyreason character varying(50),
  dayunittype character varying(50),
  uwcompany character varying(50),
  billingmethod character varying(50),
  expirationdate timestamp without time zone,
  overrideintegervalue integer
);

CREATE TABLE IF NOT EXISTS public.bcst_dmarchive_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  entitypdfstatus character varying(50),
  docmigrationdate timestamp without time zone,
  docmigrationstatus character varying(50),
  notemigrationdate timestamp without time zone,
  notemigrationmessage character varying(1024),
  notemigrationstatus character varying(50),
  drawer character varying(6),
  documentsfailed integer,
  entitypdfmessage character varying(1024),
  entitykey character varying(20),
  documentsloaded integer,
  entitypdfdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_dmarchiveddoc_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  migrationstatus character varying(50),
  documentnum character varying(20),
  drawer character varying(6),
  migrationmessage character varying(1024),
  entitykey character varying(20),
  migrationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_document (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  documentidentifier character varying(60),
  portalsecurityrealm_ext character varying(60),
  accountid character varying(64),
  dms boolean,
  author character varying(60),
  name character varying(80),
  policyid character varying(64),
  docuid character varying(255),
  language character varying(50),
  obsolete boolean,
  recipient character varying(60),
  section character varying(50),
  producerid character varying(64),
  mimetype character varying(80),
  pendingdocuid character varying(255),
  status character varying(50),
  datemodified timestamp without time zone,
  inbound boolean,
  datecreated timestamp without time zone,
  securitytype character varying(50),
  type character varying(50),
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_dpsdocument_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  retry boolean,
  invoice character varying(64),
  processed boolean,
  instanceid character varying(255),
  status character varying(50),
  documentid character varying(255),
  delinquencyprocess character varying(64),
  producerstatement character varying(64),
  errormessage text
);

CREATE TABLE IF NOT EXISTS public.bcst_dpsdocumentadmin_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  customerportalurl character varying(255),
  sfbphonenumber character varying(30),
  uwcompanyshortname character varying(255),
  supportemail character varying(255),
  paymentaddress character varying(64),
  producerportalurl character varying(255),
  surchargenameext character varying(255),
  address character varying(64),
  phonenumber character varying(40),
  uwcompany character varying(50),
  website character varying(255),
  physicaladdress character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_dpsdocumentrecipient_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  dpsdocument character varying(64),
  invoice character varying(64),
  recipientpublicid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_dpsemail_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  body text,
  subject character varying(1333),
  documentuid character varying(255),
  fileid character varying(255),
  recipients character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_efundstrackingsystemstate (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  status character varying(50),
  active boolean
);

CREATE TABLE IF NOT EXISTS public.bcst_emaildetails_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  body text,
  agentemaildetails character varying(64),
  subject character varying(1333),
  account character varying(64),
  recipientemailaddress character varying(255),
  policyperiod character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_encryptioninformation_psc (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  keylength integer,
  identifier character varying(4),
  usekeystore boolean,
  secretpassword character varying(128),
  keystorealias character varying(80),
  keystorekeypass character varying(80),
  keystorestorepass character varying(80),
  iterationcount integer,
  keystorelocation character varying(128)
);

CREATE TABLE IF NOT EXISTS public.bcst_enhancedfuegrouping (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  fundssourceid character varying(64),
  context character varying(50),
  currency character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_enhancedfundssource (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  archivedtransactionpublicid character varying(64),
  eventdate timestamp without time zone,
  historical boolean,
  currency character varying(50),
  amount numeric(18,2),
  transactionid character varying(64),
  amount_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_enhancedfunduseevent (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  archivedtransactionpublicid character varying(64),
  eventdate timestamp without time zone,
  unappliedfundslice character varying(64),
  context character varying(50),
  currency character varying(50),
  eventgroupingid character varying(64),
  amount numeric(18,2),
  transactionid character varying(64),
  amount_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_epayaccount_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  policyoffernumber character varying(60),
  propertydisplayname character varying(60),
  registration character varying(64),
  subtype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_epaymanualpayment_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  identifier character varying(60),
  paymentdate timestamp without time zone,
  registration character varying(64),
  confirmationnumber character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_epayregistration_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  authcodeexpiration timestamp without time zone,
  userid character varying(255),
  showallinvoices boolean,
  name character varying(60),
  lastrecurringdate timestamp without time zone,
  authcode character varying(10),
  accountnumber character varying(255),
  emailaddress character varying(60),
  refreshmigratedaccount boolean,
  uwcompany character varying(50),
  emailupdated boolean
);

CREATE TABLE IF NOT EXISTS public.bcst_epaystatement_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  autodraftpending boolean,
  offerduedate timestamp without time zone,
  paymentplanid character varying(60),
  offerdate timestamp without time zone,
  draftdate timestamp without time zone,
  revision integer,
  uwcompany character varying(50),
  producerphone character varying(30),
  producername character varying(255),
  producerphoneextension character varying(60),
  offernumber character varying(60),
  autodraftamount_cur character varying(50),
  invoice character varying(64),
  autodraftamount_amt numeric(18,2),
  isopen boolean,
  registration character varying(64),
  offereffectivedate timestamp without time zone,
  producerphonecountry character varying(50),
  locationaddressline1 character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_escheatmentfiles_ex (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  filedata bytea,
  filename character varying(80)
);

CREATE TABLE IF NOT EXISTS public.bcst_exchangerate (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  basecurrency character varying(50),
  ratescale integer,
  normalizedrate numeric(7,6),
  pricecurrency character varying(50),
  exchangeratesetid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_exchangerateset (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  name character varying(255),
  expiredate timestamp without time zone,
  effectivedate timestamp without time zone,
  marketrates boolean,
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcst_eximaudit_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  audittype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_eximauditdetailrecord_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  removedrecords integer,
  updatedrecords integer,
  insertedrecords integer,
  exportedrecords integer,
  eximaudit_sp character varying(64),
  entitytype character varying(60)
);

CREATE TABLE IF NOT EXISTS public.bcst_exportselectedrecords_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  columnname character varying(255),
  exportableadmindataentity character varying(64),
  columnvalue character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcst_feeoverride (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  feetype character varying(50),
  jurisdiction character varying(50),
  inuse boolean,
  product character varying(50),
  paymentplan character varying(64),
  effectivedate timestamp without time zone,
  servicetier character varying(50),
  uwcompany character varying(50),
  billingmethod character varying(50),
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_feeoverrideamt (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  inuse boolean,
  value numeric(18,2),
  currency character varying(50),
  feeoverride character varying(64),
  value_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_fundstransfer (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  targetproducer character varying(64),
  reason character varying(50),
  sourceunappliedfundid character varying(64),
  sourceproducer character varying(64),
  currency character varying(50),
  approvaldate timestamp without time zone,
  targetunappliedfundid character varying(64),
  approvalstatus character varying(50),
  amount numeric(18,2),
  transferdate timestamp without time zone,
  amount_cur character varying(50),
  requestinguserid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_fundstransferreversal (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  fundstransfertransaction character varying(64),
  approvaldate timestamp without time zone,
  reversalreason character varying(50),
  approvalstatus character varying(50),
  requestinguserid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_fxexchangerate (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  rate numeric(15,10),
  basecurrency character varying(50),
  fxexchangeratesetid character varying(64),
  marketdatetime timestamp without time zone,
  pricecurrency character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_fxexchangerateset (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  basecurrency character varying(50),
  effectivedate timestamp without time zone,
  ratetype character varying(50),
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_groupnames_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  name character varying(255),
  subtype character varying(50),
  producercode character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_groupregion (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  groupid character varying(64),
  regionid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_groupuser (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  textfield1 character varying(255),
  textfield2 character varying(255),
  textfield3 character varying(255),
  userid character varying(64),
  manager boolean,
  loadfactortype character varying(50),
  loadfactor integer,
  member boolean,
  groupid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_groupuser_assign (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  delinquencyprocessload integer,
  activityload integer,
  userid character varying(64),
  similarassignablecredits integer,
  groupid character varying(64),
  reviewload integer
);

CREATE TABLE IF NOT EXISTS public.bcst_history (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  planid character varying(64),
  countsasactivity boolean,
  eventdate timestamp without time zone,
  accountid character varying(64),
  amountext numeric(18,2),
  amountext_cur character varying(50),
  writeoffid character varying(64),
  policyperiodid character varying(64),
  roletransferred character varying(50),
  ruleuid character varying(255),
  eventtype character varying(50),
  refnumber character varying(255),
  userid character varying(64),
  customtype character varying(50),
  producerid character varying(64),
  policytransferid character varying(64),
  otheraccountid character varying(64),
  pcusernameext character varying(30),
  transactionid character varying(64),
  historyuserid character varying(64),
  type character varying(50),
  eventtimestamp timestamp without time zone,
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcst_holiday (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  name character varying(255),
  appliestoallzones boolean,
  occurrencedate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_holiday_nam_l10n (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  value character varying(255),
  owner character varying(64),
  language character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_holiday_tag (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  holidayid character varying(64),
  holidaytagcode character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_holiday_zone (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  holidayid character varying(64),
  zonetype character varying(50),
  country character varying(50),
  code character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_importfileorder (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  priority integer,
  filename character varying(100),
  status character varying(50),
  shouldimport boolean,
  importcomplete boolean
);

CREATE TABLE IF NOT EXISTS public.bcst_incomingproducerpayment (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  paymentinstrumentid character varying(64),
  producerid character varying(64),
  currency character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50),
  reversaldate timestamp without time zone,
  refnumber character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_invcitemcancelsnapshot (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  installmentnumber integer,
  invoicebilldate timestamp without time zone,
  producerpayer character varying(64),
  eventdate timestamp without time zone,
  accountpayer character varying(64),
  chargegroup character varying(255),
  invoicestream character varying(64),
  currency character varying(50),
  primarycommissionearner character varying(64),
  policyperiod character varying(64),
  adhocinvoice boolean,
  invoiceduedate timestamp without time zone,
  amount numeric(18,2),
  amount_cur character varying(50),
  type character varying(50),
  chargepattern character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_invitmsnpshotacc_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  invitemeventdate timestamp without time zone,
  invitemchargecode character varying(50),
  invitemamount_amt numeric(18,2),
  invitemcreatetime timestamp without time zone,
  policyperiod character varying(64),
  invitemamount_cur character varying(50),
  invitemtype character varying(50),
  invitemsnapshottagtodel boolean
);

CREATE TABLE IF NOT EXISTS public.bcst_invoice (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  accountid character varying(64),
  issurchargeinvoicecredited_ext boolean,
  currency character varying(50),
  originalduedate_ext timestamp without time zone,
  colunappliedamount numeric(18,2),
  unappliedamount numeric(18,2),
  colunappliedamount_cur character varying(50),
  unappliedamount_cur character varying(50),
  colremainingbalance numeric(18,2),
  remainingbalance numeric(18,2),
  colremainingbalance_cur character varying(50),
  remainingbalance_cur character varying(50),
  invoicenumber character varying(255),
  adhoc boolean,
  eventdate timestamp without time zone,
  invoicestreamid character varying(64),
  numresends integer,
  issurchargeinvoice boolean,
  dpssupressdocgen_ext boolean,
  paymentduedate timestamp without time zone,
  surremaindernoticesent_ext boolean,
  originalbilldate_ext timestamp without time zone,
  primarydirectbillearned numeric(18,2),
  primarydirectbillearned_cur character varying(50),
  netamountwrittenoff numeric(18,2),
  netamountwrittenoff_cur character varying(50),
  frompaymentarrangement boolean,
  status character varying(50),
  coloutstandingamount numeric(18,2),
  outstandingamount numeric(18,2),
  coloutstandingamount_cur character varying(50),
  outstandingamount_cur character varying(50),
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcst_invoiceitem (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  installmentnumber integer,
  invoiceid character varying(64),
  lineitemnumber integer,
  currency character varying(50),
  invoicedateoverride character varying(50),
  haschargebilledtransaction boolean,
  custompaymentgroup character varying(1333),
  paymentexceptionlock character varying(50),
  paymentexceptiondate timestamp without time zone,
  haschargeduetransaction boolean,
  type character varying(50),
  promiseexceptionlock character varying(50),
  promiseexceptiondate timestamp without time zone,
  reversed boolean,
  exceptioncomments character varying(1333),
  eventdate timestamp without time zone,
  policyperiodid character varying(64),
  chargeid character varying(64),
  hasbeenpaymentexception boolean,
  amount numeric(18,2),
  amount_cur character varying(50),
  paymentexceptionlockdate timestamp without time zone,
  promiseexceptionlockdate timestamp without time zone,
  frompaymentarrangement boolean,
  comments character varying(1333),
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcst_invoiceleadtimeoverride (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  jurisdiction character varying(50),
  inuse boolean,
  leadtimetype character varying(50),
  product character varying(50),
  paymentplan character varying(64),
  effectivedate timestamp without time zone,
  servicetier character varying(50),
  dayunittype character varying(50),
  uwcompany character varying(50),
  billingmethod character varying(50),
  expirationdate timestamp without time zone,
  overrideintegervalue integer
);

CREATE TABLE IF NOT EXISTS public.bcst_invoicestream (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  overrideinstrumentdate_ext timestamp without time zone,
  accountid character varying(64),
  overridingbillorduedatebilling character varying(50),
  policyid character varying(64),
  creationorder integer,
  currency character varying(50),
  isuioverridden_ext boolean,
  overridingpaymentinstrumentid character varying(64),
  overridingsecondanchordate timestamp without time zone,
  ruleoverrideleadtimedaycount integer,
  unappliedfundid character varying(64),
  overridingleadtimedaycount integer,
  overridingfirstanchordate timestamp without time zone,
  producerid character varying(64),
  periodicity character varying(50),
  subtype character varying(50),
  description character varying(1333),
  autodraftaddeddate_ext timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_itemcommission (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  reversed boolean,
  commissionamount numeric(18,2),
  commissionamount_cur character varying(50),
  active boolean,
  currency character varying(50),
  invoiceitemid character varying(64),
  payablecriteria character varying(50),
  writtenoffcommission numeric(18,2),
  writtenoffcommission_cur character varying(50),
  directbillearned numeric(18,2),
  directbillearned_cur character varying(50),
  policyrole character varying(50),
  agencybillretained numeric(18,2),
  agencybillretained_cur character varying(50),
  policycommissionid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_itemevent (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  eventdate timestamp without time zone,
  currency character varying(50),
  eventtype character varying(50),
  grossamountchanged numeric(18,2),
  grossamountchanged_cur character varying(50),
  invoiceitemid character varying(64),
  frominvoiceid character varying(64),
  transferrole character varying(50),
  frompolicycommissionid character varying(64),
  toinvoiceid character varying(64),
  topolicycommissionid character varying(64),
  policycommissionid character varying(64),
  transactionid character varying(64),
  cmsnreservechanged numeric(18,2),
  cmsnreservechanged_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_layercommissionoverride (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  layerid character varying(64),
  overriderate numeric(5,2),
  role character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_layerparty (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  coinsurancerole character varying(50),
  party character varying(64),
  fixedid character varying(64),
  layer character varying(64),
  coinsuranceshare numeric(5,2),
  partycode character varying(64),
  overridingpayercode character varying(64),
  ourparty boolean
);

CREATE TABLE IF NOT EXISTS public.bcst_lbthresholdoverrideamt (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  inuse boolean,
  value numeric(18,2),
  currency character varying(50),
  value_cur character varying(50),
  lowbalthresholdoverride character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_letterofcredit (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  bankname character varying(255),
  currency character varying(50),
  collateralid character varying(64),
  status character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50),
  locid character varying(255),
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_lineitem (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  currency character varying(50),
  taccountid character varying(64),
  amount numeric(18,2),
  transactionid character varying(64),
  amount_cur character varying(50),
  type character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_lockboxbatch_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  batchnumber character varying(60),
  manual boolean,
  divisionid character varying(60),
  batchdate timestamp without time zone,
  sourcesystem character varying(50),
  processed boolean,
  batchtype character varying(60),
  source character varying(50),
  uwcompany character varying(50),
  totalamount numeric(18,2),
  totalamount_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_lockboxemail_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  body text,
  subject character varying(1333),
  recipients character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_lockboxlineitem_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  acipaymentmethod character varying(50),
  lineitemtype character varying(50),
  sequencenumber character varying(60),
  controlcode character varying(255),
  sourcesystem character varying(50),
  suspensepayment character varying(64),
  externalpaymentreference character varying(255),
  reversalreason character varying(50),
  boacoupontype character varying(255),
  refnumberinternal character varying(255),
  amountdue numeric(18,2),
  amountdue_cur character varying(50),
  feeamount_cur character varying(50),
  moneyreceived character varying(64),
  boarmr boolean,
  amountpaid numeric(18,2),
  amountpaid_cur character varying(50),
  userid character varying(255),
  paymentmethod character varying(50),
  refnumberoverride character varying(255),
  initiationdate timestamp without time zone,
  paymentinstrument character varying(64),
  payeremailaddress character varying(60),
  paymentinitiationdate timestamp without time zone,
  policyoffernumberinternal character varying(60),
  status character varying(50),
  maskedccnumber character varying(255),
  errorcode character varying(50),
  accountnumber character varying(255),
  acifeeamount numeric(18,2),
  electronicpaymentfound boolean,
  batch character varying(64),
  bankaccountnumber character varying(255),
  errormessage text,
  policyoffernumberoverride character varying(60)
);

CREATE TABLE IF NOT EXISTS public.bcst_lowbalthresholdoverride (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  jurisdiction character varying(50),
  inuse boolean,
  thresholdtype character varying(50),
  lowbalancemethod character varying(50),
  product character varying(50),
  paymentplan character varying(64),
  effectivedate timestamp without time zone,
  servicetier character varying(50),
  uwcompany character varying(50),
  billingmethod character varying(50),
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_mixedcurrencypolpergroup (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  mainpolicyperiodid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_monetaryoridecurrency_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  inuse boolean,
  value numeric(18,2),
  currency character varying(50),
  value_cur character varying(50),
  monetaryoverride character varying(64),
  subtype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_negativewriteoff (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  reversed boolean,
  channel character varying(50),
  unappliedfundid character varying(64),
  executiondate timestamp without time zone,
  accountid character varying(64),
  producerid character varying(64),
  approvaldate timestamp without time zone,
  currency character varying(50),
  approvalstatus character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50),
  requestinguserid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_negativewriteoffrev (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  negativewriteoffid character varying(64),
  approvaldate timestamp without time zone,
  approvalstatus character varying(50),
  requestinguserid character varying(64),
  reversaldate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_negwrtoffsliceallocation (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  negativewriteoff character varying(64),
  unappliedfundslice character varying(64),
  ismanualallocation boolean,
  currency character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_nonreceivableitemctx (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  accountwithsuspenseid character varying(64),
  basenonreceivabledistitemid character varying(64),
  producerwithsuspenseid character varying(64),
  currency character varying(50),
  collateralid character varying(64),
  transactionid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_note (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  accountid character varying(64),
  confidential boolean,
  policyid character varying(64),
  language character varying(50),
  troubleticketid character varying(64),
  body text,
  authoringdate timestamp without time zone,
  authorid character varying(64),
  relatedto character varying(50),
  activityid character varying(64),
  subject character varying(255),
  producerid character varying(64),
  topic character varying(50),
  securitytype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_offerdetail_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  producergroupphone_ext character varying(30),
  offerduedate timestamp without time zone,
  existingpolicynumber character varying(255),
  paymentplanid character varying(60),
  offerdate timestamp without time zone,
  name character varying(60),
  emailaddress character varying(60),
  producergroupname_ext character varying(255),
  producerphone character varying(30),
  producername character varying(255),
  offersubmitdate timestamp without time zone,
  producerphoneextension character varying(60),
  offernumber character varying(60),
  autodraftamount_cur character varying(50),
  autodraftamount_amt numeric(18,2),
  accountnumber character varying(255),
  offereffectivedate timestamp without time zone,
  producerphonecountry character varying(50),
  uwcompany_ext character varying(50),
  locationaddressline1 character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_officialid (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  officialidtype character varying(50),
  obfuscatedinternal boolean,
  officialidvalue character varying(255),
  state character varying(50),
  subtype character varying(50),
  contactid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_onsetinvoiceitem (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_organizationzoneadmin (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  zonetype character varying(50),
  organizationid character varying(64),
  country character varying(50),
  zonecode character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_origchcmsn (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_outgoingpayment (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  mailtoaddress character varying(255),
  issuedate timestamp without time zone,
  paymentinstrumentid character varying(64),
  producerpaymentid character varying(64),
  currency character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50),
  refnumber character varying(255),
  payto character varying(255),
  rejecteddate timestamp without time zone,
  status character varying(50),
  mailto character varying(255),
  memo character varying(255),
  paiddate timestamp without time zone,
  disbursementid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_parentacct (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_paymentinstrument (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  acipaymentmethod character varying(50),
  immutable boolean,
  accountid character varying(64),
  bankaccounttype_ext character varying(50),
  bankaccountcategory_ext character varying(50),
  detail character varying(255),
  onetimeuse_ext boolean,
  accountnumber_ext character varying(64),
  paymentmethod character varying(50),
  active_ext boolean,
  producerid character varying(64),
  routingnumber_ext character varying(9),
  guidewireaccountnumber_ext character varying(255),
  token character varying(255),
  description character varying(255),
  expirationdate_ext timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_paymentplanmodifier (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  policybillinginstructionid character varying(64),
  downpaymentpercent numeric(5,2),
  paymentplanid character varying(64),
  billinginstructiontype character varying(50),
  maximumnumberofinstallments integer,
  referencechargeid character varying(64),
  applicationorder integer
);

CREATE TABLE IF NOT EXISTS public.bcst_paymentrequest (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  invoiceid character varying(64),
  accountid character varying(64),
  paymentinstrumentid character varying(64),
  invoicestreamid character varying(64),
  draftdate timestamp without time zone,
  currency character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50),
  statusdate timestamp without time zone,
  confirmationnumber_ext character varying(255),
  errormessage_ext text,
  duedate timestamp without time zone,
  senttopaymentsystem_ext boolean,
  fixedamount_ext_cur character varying(50),
  status character varying(50),
  processedinpayconnexion_ext boolean,
  fixedamount_ext_amt numeric(18,2),
  requestdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_payplanavailoverride (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  overridebit boolean,
  jurisdiction character varying(50),
  inuse boolean,
  product character varying(50),
  paymentplan character varying(64),
  effectivedate timestamp without time zone,
  servicetier character varying(50),
  uwcompany character varying(50),
  billingmethod character varying(50),
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_pcjobpaymentplanchange (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  jobnumber character varying(30),
  stepid integer
);

CREATE TABLE IF NOT EXISTS public.bcst_plcyaddlinsureddetail_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  policyaddlinsured character varying(64),
  relationshiptype character varying(50),
  additionalinsuredtype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_plcycorrespondenceentry (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  plcycorrespondencetype character varying(50),
  policyperiodcontactid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_poladdlcontactdetail_ext (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  descofinterest_hoe character varying(100),
  relationship character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcst_policy (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  accountid character varying(64),
  lobcode character varying(50),
  currency character varying(50),
  pcpublicid character varying(255),
  donotarchive boolean
);

CREATE TABLE IF NOT EXISTS public.bcst_policycommission (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  enddate timestamp without time zone,
  policyperiodid character varying(64),
  startdate timestamp without time zone,
  primarypolicyperiodid character varying(64),
  currency character varying(50),
  cmsnplanoverridepercentage numeric(5,2),
  role character varying(50),
  commissionsubplanid character varying(64),
  hiddentaccountcontainerid character varying(64),
  defaultforpolicy boolean,
  producercodeid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_policyperiod (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  underaudit boolean,
  securityzoneid character varying(64),
  pendingreindex boolean,
  policypereffdate timestamp without time zone,
  paymentplanid character varying(64),
  archiveschemainfo character varying(64),
  currency character varying(50),
  hiddentaccountcontainerid character varying(64),
  uwcompany character varying(50),
  holdinvoicingwhendelinquent boolean,
  billingmethod character varying(50),
  overridingpayeraccountid character varying(64),
  assignedrisk boolean,
  overridinginvoicestreamid character varying(64),
  dba character varying(255),
  fullpaydiscountuntil timestamp without time zone,
  policyperioddelinquencyplanid character varying(64),
  offernumber character varying(255),
  equitywarningsenabled boolean,
  closedate timestamp without time zone,
  nextarchivecheckdate timestamp without time zone,
  eligibleforfullpaydiscount boolean,
  retrieved boolean,
  bounddate timestamp without time zone,
  fullpaydiscountevaluated boolean,
  westernmethod boolean,
  archivedentitypurgedate timestamp without time zone,
  termnumber integer,
  archivetacctcontainerid character varying(64),
  pendingremainingbalancefix boolean,
  cancellationtype character varying(50),
  cancelreason character varying(255),
  priorpolicynumber character varying(40),
  equitybuffer integer,
  discountedpaymentthreshold numeric(18,2),
  discountedpaymentthreshold_cur character varying(50),
  underwriter character varying(255),
  policyid character varying(64),
  policytype_ext character varying(50),
  riskjurisdiction character varying(50),
  emailsentfor10paynotenrolled boolean,
  policyperexpirdate timestamp without time zone,
  chargeheld boolean,
  returnpremiumplanid character varying(64),
  cancelstatus character varying(50),
  closurestatus character varying(50),
  confirmationnotificationstate character varying(50),
  termconfirmed boolean,
  policynumberlong character varying(255),
  paymentdistributionenabled boolean,
  policynumber character varying(40),
  primarycoveragecurrency character varying(50),
  processundistpayments_ext boolean
);

CREATE TABLE IF NOT EXISTS public.bcst_policyperiodciagreement (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  ourrole character varying(50),
  agreementfixedid character varying(64),
  model character varying(50),
  policynumbersuffix character varying(8),
  ownerid character varying(64),
  ourshare numeric(5,2),
  foreignentity character varying(64),
  subtype character varying(50),
  leadersfee numeric(5,2)
);

CREATE TABLE IF NOT EXISTS public.bcst_policyperiodcontact (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  policyperiodid character varying(64),
  primarypolicyperiodid character varying(64),
  contactid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_policyperiodcurrencygroup (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  currencyingroup character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_policyperiodlayer (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  ourrole character varying(50),
  policynumbersuffix character varying(8),
  excessamount numeric(18,2),
  ownerid character varying(64),
  excessamount_cur character varying(50),
  limitamount numeric(18,2),
  ourshare numeric(5,2),
  limitamount_cur character varying(50),
  layerfixedid character varying(64),
  model character varying(50),
  foreignentity character varying(64),
  subtype character varying(50),
  leadersfee numeric(5,2),
  coinsured boolean
);

CREATE TABLE IF NOT EXISTS public.bcst_policyperiodlocations_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  locationname character varying(255),
  policyperiodid character varying(64),
  addressid character varying(64),
  pcfixedid character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_policyperiodprogram (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  mainpolicyperiodid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_policyperiodtower (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  towerfixedid character varying(64),
  towergrouping character varying(64),
  subtype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_policysection (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  tower character varying(64),
  fixedid character varying(64),
  currency character varying(50),
  policyperiod character varying(64),
  coinsuranceagreement character varying(64),
  sectiontype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_policytransfer (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  transferred boolean,
  destinationproducercodeid character varying(64),
  commissiontransferoption character varying(50),
  policyperiodid character varying(64),
  currency character varying(50),
  sourceproducercodeid character varying(64),
  roletotransfer character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_polperiodcontactrole (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  policyperiodcontactid character varying(64),
  role character varying(50),
  poladdlcontactdetail character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_polperiodunapplied_sp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  invoicestream character varying(64),
  policyperiod character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_poltransferpolicyperiod (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  currency character varying(50),
  policytransferid character varying(64),
  policyperiodid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_premiumreportduedate (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  duedate timestamp without time zone,
  periodenddate timestamp without time zone,
  completed boolean,
  periodstartdate timestamp without time zone,
  delinquencyprocessid character varying(64),
  premiumreportddpolicyperiodid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_priordebtdisbursement_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  debtdate timestamp without time zone,
  taxid character varying(30),
  insuredmailingcity character varying(255),
  insuredphonenumber character varying(255),
  risklocationstate character varying(50),
  insuredmailingstate character varying(50),
  disbappractivity character varying(64),
  batchid character varying(30),
  balancedue numeric(18,2),
  insuredmailingpostalcode character varying(255),
  source character varying(50),
  uwcompany character varying(50),
  risklocationcity character varying(255),
  risklocationaddress character varying(255),
  insuredmailingaddress character varying(255),
  insuredname character varying(255),
  policynumber character varying(255),
  risklocationpostalcode character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_priordebtreference_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  debtdate timestamp without time zone,
  taxid character varying(30),
  insuredmailingcity character varying(255),
  insuredphonenumber character varying(255),
  risklocationstate character varying(50),
  insuredmailingstate character varying(50),
  batchid character varying(30),
  balancedue numeric(18,2),
  insuredmailingpostalcode character varying(255),
  source character varying(50),
  uwcompany character varying(50),
  risklocationcity character varying(255),
  risklocationaddress character varying(255),
  insuredmailingaddress character varying(255),
  insuredname character varying(255),
  subtype character varying(50),
  policynumber character varying(255),
  risklocationpostalcode character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_prodcoderoleentry (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  producerid character varying(64),
  billinginstructionid character varying(64),
  currency character varying(50),
  cmsnplanoverridepercentage numeric(5,2),
  role character varying(50),
  producercodeid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_prodcollctngstmt (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_prodcorrespondenceentry (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  producercontactid character varying(64),
  prodcorrespondencetype character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_prodcurrencygrp (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  currencyingroup character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_prodpmntinst (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_producer (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  createartifacts_ext boolean,
  securityzoneid character varying(64),
  totalcommissionexpense numeric(18,2),
  totalcommissionexpense_cur character varying(50),
  name character varying(255),
  agencybillplanid character varying(64),
  holdstatement boolean,
  currency character varying(50),
  initialrecurdate timestamp without time zone,
  hiddentaccountcontainerid character varying(64),
  recurdayofmonth integer,
  istaxlevy_ext boolean,
  tier character varying(50),
  finalrecurdate timestamp without time zone,
  recurperiodicity character varying(50),
  taxid_ext character varying(30),
  combinedstatements boolean,
  namekanji character varying(255),
  reportinggroupid character varying(64),
  totalcommissionreserve numeric(18,2),
  totalcommissionreserve_cur character varying(50),
  totalcommissionpayable numeric(18,2),
  statementholdpositivelimit numeric(18,2),
  totalcommissionpayable_cur character varying(50),
  statementholdpositivelimit_cur character varying(50),
  statementholdnegativelimit numeric(18,2),
  statementholdnegativelimit_cur character varying(50),
  uwcompany_ext character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_producercode (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  contact_ext character varying(64),
  active boolean,
  code character varying(255),
  producerid character varying(64),
  commissionplanid character varying(64),
  currency character varying(50),
  hiddentaccountcontainerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_producercontact (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  producerid character varying(64),
  primaryproducerid character varying(64),
  contactid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_producercontactrole (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  role character varying(50),
  producercontactid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_producercontext (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  agencycyclepaymentid character varying(64),
  chargewrittenoffid character varying(64),
  statementid character varying(64),
  producerpaymentid character varying(64),
  currency character varying(50),
  distitemid character varying(64),
  prodnegativewriteoffid character varying(64),
  creditspayableofid character varying(64),
  producercodeid character varying(64),
  invoiceitemid character varying(64),
  payablecriteria character varying(50),
  producerpayablexferid character varying(64),
  writeoffcontainerid character varying(64),
  producerid character varying(64),
  commissionwriteoffdistitemid character varying(64),
  policycommissionid character varying(64),
  payablereceiverstatementid character varying(64),
  transactionid character varying(64),
  chargecommissionid character varying(64),
  incomingpaymentid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_producergroup (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  mainproducerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_producerpayabletransfer (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  debitspayableofid character varying(64),
  approvaldate timestamp without time zone,
  currency character varying(50),
  approvalstatus character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50),
  requestinguserid character varying(64),
  creditspayableofid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_producerpayment (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  reportinggroupid character varying(64),
  producerid character varying(64),
  currency character varying(50),
  status character varying(50),
  reversalreason character varying(50),
  reversaldate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_producerstatement (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  previousbalance numeric(18,2),
  previousbalance_cur character varying(50),
  netamountsentandreceived numeric(18,2),
  netamountsentandreceived_cur character varying(50),
  producerid character varying(64),
  currency character varying(50),
  statementnumber character varying(255),
  statementname_ext character varying(255),
  balance numeric(18,2),
  statementdate timestamp without time zone,
  balance_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_recapchrgslicejoin (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  recapturecharge character varying(64),
  unappliedfundslice character varying(64),
  currency character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_region (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  name character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_region_name_l10n (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  value character varying(255),
  owner character varying(64),
  language character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_region_zone (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  country character varying(50),
  zonetype character varying(50),
  code character varying(255),
  regionid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_renewalofferemail_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  body text,
  subject character varying(1333),
  offerdetail character varying(64),
  recipientemailaddress character varying(255),
  accountnumber character varying(255),
  registration character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_reportinggroup (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  jurisdiction character varying(50),
  product character varying(50),
  uwcompany character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_revcharge (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_revcmsnred (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_revcredit (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_revfeedecisionoverride (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  paymentrevreason character varying(50),
  overridebit boolean,
  jurisdiction character varying(50),
  inuse boolean,
  paymentmethod character varying(50),
  product character varying(50),
  paymentplan character varying(64),
  effectivedate timestamp without time zone,
  servicetier character varying(50),
  uwcompany character varying(50),
  billingmethod character varying(50),
  expirationdate timestamp without time zone,
  shouldcreateactivity boolean
);

CREATE TABLE IF NOT EXISTS public.bcst_revinvoiceitem (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_revnegwriteoff (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_revtrans (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_revwriteoff (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  foreignentityid character varying(64),
  ownerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_sectioncommissionoverride (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  sectionid character varying(64),
  overriderate numeric(5,2),
  currency character varying(50),
  role character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_servicecallhistory_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  servicename character varying(255),
  response text,
  request text,
  keyattribute character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_snapshotinvoiceitem (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  lineitemnumber integer,
  currency character varying(50),
  invoiceitemid character varying(64),
  paidamount numeric(18,2),
  paidamount_cur character varying(50),
  status character varying(50),
  statementinvoiceid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_subrogation (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  claimnumber character varying(255),
  sourceaccountid character varying(64),
  chargeid character varying(64),
  currency character varying(50),
  amount numeric(18,2),
  amount_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_surchargeoverrides_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  inuse boolean,
  active boolean,
  surchargename character varying(100),
  surchargeassessmentdate timestamp without time zone,
  invoiceduedate timestamp without time zone,
  surchargepercentage numeric(8,3),
  surchargetype character varying(50),
  surchargeid character varying(100),
  batchrundate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_susppymtcontext (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  suspensepaymentid character varying(64),
  currency character varying(50),
  transactionid character varying(64),
  disbursementid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_taccount (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  taccountcontainerid character varying(64),
  fundssourceid character varying(64),
  creationorder integer,
  currency character varying(50),
  taccountpatternid character varying(64),
  balancedenorm numeric(18,2),
  balancedenorm_cur character varying(50),
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_taccountcontainer (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  currency character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_transaction (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  reversed boolean,
  commissionamount numeric(18,2),
  commissionamount_cur character varying(50),
  reason character varying(50),
  transactiondate timestamp without time zone,
  commissionamountchanged numeric(18,2),
  currency character varying(50),
  commissionamountchanged_cur character varying(50),
  reversalreason character varying(50),
  writeoffchannel character varying(50),
  cmsnadjustment_ext character varying(64),
  amount numeric(18,2),
  amount_cur character varying(50),
  transactionnumber character varying(255),
  basis numeric(18,2),
  basis_cur character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_transfertxcontext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  targetunappliedtaccountid character varying(64),
  sourceproducerid character varying(64),
  sourceaccountid character varying(64),
  currency character varying(50),
  fundstransferid character varying(64),
  targetaccountid character varying(64),
  transactionid character varying(64),
  sourceunappliedtaccountid character varying(64),
  targetproducerid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_twiaautodraftemail_ext (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  body text,
  subject character varying(1333),
  recipients character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_unappliedfund (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  defaultaccountid character varying(64),
  accountid character varying(64),
  reportinggroupid character varying(64),
  policyid character varying(64),
  currency character varying(50),
  taccountid character varying(64),
  description character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_unappliedfundslice (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  historicalamount numeric(18,2),
  historicalamount_cur character varying(50),
  eventdate timestamp without time zone,
  fundssource character varying(64),
  historical boolean,
  currency character varying(50),
  amount numeric(18,2),
  taccount character varying(64),
  amount_cur character varying(50),
  archivedtaccountpublicid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_upgradedatamodelinfo (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  platformminorvers integer,
  extensionsvers integer,
  applicationminorvers integer,
  platformmajorvers integer,
  applicationmajorvers integer
);

CREATE TABLE IF NOT EXISTS public.bcst_user (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  obfuscatedinternal boolean,
  usersettingsid character varying(64),
  sessiontimeoutsecs integer,
  organizationid character varying(64),
  vacationstatus character varying(50),
  department character varying(255),
  externaluser boolean,
  language character varying(50),
  experiencelevel character varying(50),
  locale character varying(50),
  authorityprofileid character varying(64),
  defaultphonecountry character varying(50),
  validationlevel character varying(50),
  credentialid character varying(64),
  systemusertype character varying(50),
  defaultcountry character varying(50),
  timezone character varying(50),
  contactid character varying(64),
  jobtitle character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_userbackup (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  userid character varying(64),
  backupuserid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_userregion (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  userid character varying(64),
  regionid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_userrole (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  roleid character varying(64),
  userid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_userroleassign (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  previousgroupid character varying(64),
  active boolean,
  assignedbyuserid character varying(64),
  assignedgroupid character varying(64),
  previousqueueid character varying(64),
  workflowid character varying(64),
  previoususerid character varying(64),
  assignedqueueid character varying(64),
  troubleticketid character varying(64),
  closedate timestamp without time zone,
  assigneduserid character varying(64),
  comments character varying(255),
  role character varying(50),
  assignmentdate timestamp without time zone,
  disbursementid character varying(64),
  assignmentstatus character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcst_usersettings (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  rotatetables boolean,
  cancelalertdismiss timestamp without time zone,
  printpagenums boolean,
  lastpolicyperiods text,
  lastproducers text,
  startuppage character varying(50),
  showprintpreview boolean,
  printmargins numeric(2,1),
  lastaccounts text
);

CREATE TABLE IF NOT EXISTS public.bcst_wothresholdoverride (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  jurisdiction character varying(50),
  inuse boolean,
  thresholdtype character varying(50),
  product character varying(50),
  paymentplan character varying(64),
  writeoffreason character varying(50),
  effectivedate timestamp without time zone,
  servicetier character varying(50),
  uwcompany character varying(50),
  billingmethod character varying(50),
  expirationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_wothresholdoverrideamt (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  inuse boolean,
  value numeric(18,2),
  currency character varying(50),
  value_cur character varying(50),
  wothresholdoverride character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_writeoff (
  rownumber bigint,
  luwid character varying(64),
  subtype character varying(50),
  publicid character varying(64),
  retired bigint,
  reversed boolean,
  taccountcontainerid character varying(64),
  reason character varying(50),
  executiondate timestamp without time zone,
  currency character varying(50),
  amount numeric(18,2),
  itemcommissionid character varying(64),
  requestinguserid character varying(64),
  amount_cur character varying(50),
  reversedamount numeric(18,2),
  invoiceitemid character varying(64),
  reversedamount_cur character varying(50),
  producerid character varying(64),
  approvaldate timestamp without time zone,
  approvalstatus character varying(50),
  chargepatternid character varying(64),
  chargecommissionid character varying(64),
  grossagencypmntitemid character varying(64),
  cmsnagencypmntitemid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_writeoffreversal (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  reason character varying(50),
  writeoffid character varying(64),
  approvaldate timestamp without time zone,
  approvalstatus character varying(50),
  requestinguserid character varying(64),
  reversaldate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcst_zerocmsnearnedmarker (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  retired bigint,
  basepaymentitemid character varying(64),
  chargewrittenoffid character varying(64),
  currency character varying(50),
  itemcommission character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcst_zone (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  country character varying(50),
  zonetype character varying(50),
  name character varying(255),
  code character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcst_zone_link (
  rownumber bigint,
  luwid character varying(64),
  publicid character varying(64),
  zone1id character varying(64),
  zone2id character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bctl_accountcontext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_accountevaluation (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_accountinactivityworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_accountrole (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_accountsegment (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_accounttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_acctcorrespondencetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_acipaymentmethod_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_activestatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_activity (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_activitycategory (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_activityclass (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_activityownershiptype_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_activitystatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_activitytype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_additionalinsuredtype_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_additionalinteresttype_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_address (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_addresstype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_admindatafiletype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_admindataimexstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_admindataimportresolution (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_advanceexpirationworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agblsusppmntworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agencybillcycle (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agencybilleventstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agencybillexceptiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agencycycledistprefill (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agencycycleprocess (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agencyitemtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agencypaymenttargettype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agencypmntitemsfiltertype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agencypromisetargettype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agencywriteofftype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_aggregationtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_agingdatebasis (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_anchorevent (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_appeventsyncstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_applicablesegments (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_approvalstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_archivefinalstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_archivesourcestatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_archivestate (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_assignedriskrestriction (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_assignmentsearchtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_assignmentselectiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_assignmentstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_asyncapirequeststatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_authorityevent (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_authoritylimittype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_autodisbworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_autodraftdisablecode_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_autosync (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_availabledisbamttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_bankaccountcategory_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_bankaccounttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_basedist (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_basedistitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_basemoneyreceived (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_basenonreceivabledistitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_batchpayment_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_batchpaymentgroup_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_batchpaymentsstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_batchpaymentstatus_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_batchpmntentrystatus_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_batchprocesstype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_batchprocesstypeusage (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_billdateorduedatebilling (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_billinginstruction (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_billinglevel (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_bizruleoverrides_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_breakdownitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_bulkrestoretype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_businesstype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_cancellationtarget (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_cancellationtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_catastrophestatus_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_characterset (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_chargebreakdowncategory (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_chargecategory (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_chargecmsnoverridetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_chargefiltertype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_chargeholdstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_chargeinstancectx (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_chargepattern (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_chargepriority (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_chargeproratatxworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_checkregisterstatus_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_checktype_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_clearinglogictarget (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_cmsnadjreason_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_cmsnpayableworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_cmsnpaymentworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_cmsnplanoverridemethod (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_cmsnwriteoffdistitemtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_coinsurancemodel (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_coinsurancerole (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_collateralcontext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_collaterallevel (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_collateralrequirementtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_collectionagency (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_colleffectiveworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_collexpirationworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_commissionoverride (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_commissionpayment (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_commissionpaymenttime (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_commissionpaymenttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_commissionsubplan (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_commissiontransferoption (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_company_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_compliancestatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_componenttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_confirmationnotification (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_consistencycheckcategory (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_consistencycheckseverity (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_consistencychecktype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contact (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactapprovalstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactbidirel (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactchangeres (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactclass (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactdestructionstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactdestructstatuscat (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactlinkstatustype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactmatchresulttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactrel (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactrelcons (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactsearchresulttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contactsearchtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contacttagtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_contacttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_country (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_couriercode_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_creditcardissuer (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_creditcontext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_credittype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_crossappactivitydest_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_currency (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_customerservicetier (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_customhistorytype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_datachangestatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_datadistributiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_datagenactiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_datagenstatustype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_datamigrationstatus_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_datebindatatype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_datecmsnpayableworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_datefieldstosearchtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_daterangechoicetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_datesearchtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_dayofmonthlogic (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_dayofweek (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_dayunit (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_dbpmntaggregatecriteria (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_dbpmntdistributioncontext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_dbpmntgroupingcriteria (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_dbpmntinvoicesort (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_dbupdatestatsrunnertype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_delinquencycause (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_delinquencyeventname (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_delinquencyprocess (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_delinquencyprocessphase (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_delinquencyprocessstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_delinquencyreason (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_delinquencysearchview (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_delinquencystatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_delinquencytriggerbasis (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_depositstatus_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_deposittype_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_destructionrequeststatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_directbillpmntacctrole (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_directbillpmntaccts (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_disbursement (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_disbursementsearchview (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_disbursementstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_disbursementtarget_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_disbursementworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_distarchrefbychrgowner (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_distitemdisposition (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_distributionfiltertype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_distributionlimittype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_documentsection (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_documentsecuritytype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_documentstatustype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_documenttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_downpaymntsecondinstllmnt (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_dpsdocumentstatus_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_effdatedchangetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_eftrackingsystemstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_electronicpaymentaccount_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_employmentstatustype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_entitysourcetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_errorcategory (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_etlstrings (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_exceptionlock (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_eximaudittype_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_externaltooltype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_failoverstate (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_feeoverridetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_feeoverridetype_psc (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_feeoverridetype_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_financialcriterion (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_financialsearchfield (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_fullpaydscworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_fundsallotmentworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_fundssourcetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_fundstracker (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_fundsuseeventcontext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_fundsusetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_fxratemarket (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_gendertype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_geocodestatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_groupnames_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_grouptype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_history (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_historyeventtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_historytype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_holdtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_holidaytagcode (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_hopolicytype_hoe (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_ilelementtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_inboundchunkstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_inboundfileconfig (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_inboundfilestatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_inboundhistory (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_inboundrecordstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_incentive (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_includedaystype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoice (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoicearchrefbychrgowner (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoiceassemblercontext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoicebilledworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoicedateoverride (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoicedeliverymethod (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoicedueworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoiceitemfiltertype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoiceitemorderingtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoiceitemtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoiceitemviewoption (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoicepaidstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoicestatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoicestream (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoicetreatment (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_invoicingblackouttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_itemeventtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_itemplacementcutofftype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_jurisdiction (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_jurisdictiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_languagetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_leadtimetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_leadtimetype_psc (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_leadtimetype_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_leaseterminationreason (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_ledgerside (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_letterofcreditstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_letterofcreditworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_listbillacctexcess (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_loadcommandtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_loadercallbacktimetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_loaderrortype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_loadfactortype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_loadsteptype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_lobcode (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_localetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_lockboxlineitemerror_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_lockboxlineitemstatus_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_lockboxlineitemtype_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_lookupcolumndatatype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_lowbalancemethod (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_manageworkflowactiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_manualcheckrevreason_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_maritalstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_mergeconflictresolution (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_mergeconflictstrategy (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_messagedestinationremotestatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_messagedestinationstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_monetaryoridecurrency_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_mortgagepositiontype_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_multipaymenttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_nameprefix (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_namesuffix (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_negativewriteoff (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_newpaymentworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_nonreceivableitemcontext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_notesecuritytype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_notetopictype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_notetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_officialid (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_officialidtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_organizationtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_outboundfileconfig (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_outboundrecordstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_outgoingpayment (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_outgoingpaymentstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_parametertype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_payablecriteria (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentitemactionkind (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentitemgroupreason (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentmethod (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentmoveoption (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentplanmodifier (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentrequeststatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentrequestworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentreversalreason (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentscheduledafter (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentsource_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_paymentsourcesystem_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_payperiodtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_periodicity (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_personaldatatagvalue (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_phonecountrycode (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_phonetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_placementofnewitemsoption (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_plan (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_plcycorrespondencetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_poladdlcontactdetail_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyactivityaggtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policycancelstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyclosurecondition (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyclosurestatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyclosureworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyperiodbillingmethod (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyperiodciagreement (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyperiodlayer (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyperiodprogram (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyperiodrole (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyperiodstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyperiodtower (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policyrole (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_policytransfer (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_postbatchpmntsworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_premiumreportddworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_primarycolor (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_primaryphonetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_printformat (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_priordebtreference_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_priordebtsource_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_priority (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_prodcorrespondencetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_producercontext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_producerpayment (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_producerpaymentstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_producerpaymentworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_producerrole (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_producerstatementtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_producertier (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_profilerconfig (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_pronounaggregatetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_pronounobjectivetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_pronounpossessivetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_pronounsubjectivetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_proratachargestatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_proximitysearchstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_purgetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_questionformat (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_questionsettype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_questiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_reason (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_regiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_relatedto (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_relationshiptype_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_releasechgholdworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_releaseholdsworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_remainingpaymentoption (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_resourcecontext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_restcontactauthaccesstype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_retpremallocatemethod (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_retpremallocatetiming (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_retpremchargequal (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_retpremexcesstreatment (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_retpremhandlingcondition (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_retpremstartdateoption (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_retrieveplcyprdworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_reversalreason (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_reversalrequestedby_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_reversebatchpmntsworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_reviewcategory (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_reviewservicetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_roletype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_rulesettype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_runtimepropertygroup (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_s3admindataimporttimetype_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_samplecolor (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_sampletheme (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_scriptparametertype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_searchobjecttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_searchresult (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_sectiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_sexassignedatbirthtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_solrsearchentity (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_sortbyrange (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_specialhandling (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_specialtytype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_sqlstatementtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_startpointtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_startuppage (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_state (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_stateabbreviation (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_statementbilledworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_statementdueworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_statementtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_statementviewoption (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_stringcriterionmode (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_surchargetype_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_suspensepaymentapplyto (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_suspensepaymentstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_suspensepaymentworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_suspensepmntapplyto_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_susppymtcontext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_synchstate (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_systempermissiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_systemusertype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_tableupdatestatstype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_taccount (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_taccountcontainer (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_taccountname (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_taccountownersort (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_taccountownertype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_taccountpattern (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_taccountpatternsuffix (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_taccounttype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_taxfilingstatustype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_taxstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_thresholdoridetype_psc (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_thresholdoridetype_sp (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_thresholdoverridetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_timezonetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_transaction (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_transactionrowtypes_ext (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_transferreason (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_troubleticketstatus (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_troubletickettype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_troubleticketworkitemtype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_unitofdistance (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_updateop (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_upgradedbstoragesettype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_upgradeexecutiontimetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_userattributetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_userexperiencetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_userrole (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_userroleconstraint (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_uwcompany (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_vacationstatustype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_validationissue (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_validationissuetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_validationlevel (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_vendortype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_venuetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_voidreason (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_weekdays (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_workflow (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_workflowactiontype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_workflowactivestate (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_workflowhandler (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_workflowlogentry (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_workflowstate (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_workflowtriggerkey (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_workflowworkitem (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_workitemsetstate (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_workitemstatustype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_writeoff (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_writeoffchannel (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_writeoffreason (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_writeoffreversalreason (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_writeofftype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_yesno (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bctl_zonetype (
  l_en_us character varying(256),
  priority integer,
  s_en_us_edg_ph integer,
  typecode character varying(50),
  s_en_us integer,
  retired boolean,
  l_en_us_edg character varying(256),
  name character varying(256),
  l_en_us_edg_ph character varying(256),
  s_en_us_edg integer,
  id integer,
  description character varying(512)
);

CREATE TABLE IF NOT EXISTS public.bcx_acifundingsso_ext (
  loadcommandid bigint,
  refreshneeded boolean,
  ssokey text,
  publicid character varying(64),
  accountnumber character varying(255),
  beanversion integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_acinotification_ext (
  loadcommandid bigint,
  body text,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  subject character varying(1333),
  updateuserid bigint,
  recipientemailaddress character varying(255),
  accountnumber character varying(255),
  updatetime timestamp without time zone,
  id bigint,
  policynumber character varying(40)
);

CREATE TABLE IF NOT EXISTS public.bcx_aciprofile_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  profileid bigint,
  updatetime timestamp without time zone,
  accountnumber character varying(255),
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_acpreceivedateentryext (
  loadcommandid bigint,
  createuserid bigint,
  batchnumber character varying(25),
  publicid character varying(64),
  manual boolean,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  processed boolean,
  updateuserid bigint,
  receivedate timestamp without time zone,
  transactioncount integer,
  updatetime timestamp without time zone,
  id bigint,
  processeddate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcx_addlinterestdetail_ext (
  loadcommandid bigint,
  mortgagepositiontype_ext integer,
  createuserid bigint,
  certrequired boolean,
  publicid character varying(64),
  policyaddlinterest bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  additionalinteresttype integer,
  updateuserid bigint,
  updatetime timestamp without time zone,
  id bigint,
  contractnumber character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcx_adminaudit_ext (
  originalvalue text,
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  modifiedbyuserid character varying(30),
  modifiedentityid integer,
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  modifiedentitypublicid character varying(50),
  newvalue text,
  modifiedobjectname character varying(100),
  updatetime timestamp without time zone,
  modifiedbyusername character varying(100),
  modifieddate timestamp without time zone,
  modifiedentityname character varying(100),
  id bigint,
  modifiedfieldname character varying(100)
);

CREATE TABLE IF NOT EXISTS public.bcx_agentemaildetails_ext (
  loadcommandid bigint,
  body text,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  subject character varying(1333),
  account bigint,
  updateuserid bigint,
  recipientemailaddress character varying(255),
  policyperiod bigint,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_batchpayment_sp (
  paymenttype integer,
  loadcommandid bigint,
  publicid character varying(64),
  createtime timestamp without time zone,
  unappliedfund bigint,
  batchentryreversalreason integer,
  sequencenumber character varying(50),
  controlcode character varying(255),
  enteredby character varying(255),
  updatetime timestamp without time zone,
  amount numeric(18,2),
  amount_cur integer,
  id bigint,
  refnumber character varying(255),
  producername character varying(255),
  amountdue_cur integer,
  paymentsource character varying(255),
  createuserid bigint,
  amountdue_amt numeric(18,2),
  beanversion integer,
  batchpaymentgroup_sp bigint,
  retired bigint,
  batchentrystatus integer,
  paymentinstrument bigint,
  updateuserid bigint,
  invoicenumber character varying(255),
  accountnumber character varying(255),
  paymentgroup character varying(255),
  subtype integer,
  policynumber character varying(255),
  description character varying(1333)
);

CREATE TABLE IF NOT EXISTS public.bcx_batchpaymentgroup_sp (
  loadcommandid bigint,
  entereduser bigint,
  batchnumber character varying(50),
  publicid character varying(64),
  createtime timestamp without time zone,
  depositdate timestamp without time zone,
  reverseduser bigint,
  batchamount numeric(18,2),
  batchamount_cur integer,
  updatetime timestamp without time zone,
  uwcompany integer,
  id bigint,
  deposit bigint,
  createuserid bigint,
  collectionagency bigint,
  isexception boolean,
  beanversion integer,
  retired bigint,
  batchstatus integer,
  keyeddate timestamp without time zone,
  posteddate timestamp without time zone,
  updateuserid bigint,
  subtype integer,
  reversaldate timestamp without time zone,
  errormessage character varying(1024)
);

CREATE TABLE IF NOT EXISTS public.bcx_batchpaymentsplit_sp (
  paymenttype integer,
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  unappliedfund bigint,
  batchpayment bigint,
  enteredby character varying(255),
  updateuserid bigint,
  updatetime timestamp without time zone,
  accountnumber character varying(255),
  invoicenumber character varying(255),
  amount numeric(18,2),
  amount_cur integer,
  id bigint,
  policynumber character varying(255),
  description character varying(1333),
  producername character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcx_batchpaymentworkitem_sp (
  loadcommandid bigint,
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  queuetype integer,
  batchpayment bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bcx_batchpmntrevworkitem_sp (
  loadcommandid bigint,
  processhistoryid bigint,
  publicid character varying(64),
  priority integer,
  attempts integer,
  queuetype integer,
  batchpayment bigint,
  lastupdatetime timestamp without time zone,
  creationtime timestamp without time zone,
  exception text,
  availablesince numeric(19,0),
  status integer,
  id bigint,
  checkedoutby character varying(150)
);

CREATE TABLE IF NOT EXISTS public.bcx_bizruleoverrides_sp (
  acipaymentmethod integer,
  feetype integer,
  loadcommandid bigint,
  overridebit boolean,
  jurisdiction integer,
  inuse boolean,
  planid bigint,
  publicid character varying(64),
  createtime timestamp without time zone,
  switchplanfordisabledautodraft boolean,
  maximumpremiumamount numeric(18,2),
  maximumpremiumamount_cur integer,
  effectivedate timestamp without time zone,
  updatetime timestamp without time zone,
  dayunittype integer,
  uwcompany integer,
  id bigint,
  billingmethod integer,
  expirationdate timestamp without time zone,
  rate numeric(8,3),
  paymentrevreason integer,
  minimumpremiumamount numeric(18,2),
  minimumpremiumamount_cur integer,
  createuserid bigint,
  leadtimetype integer,
  plantype integer,
  overrideamount numeric(18,2),
  disbursementreason integer,
  thresholdtype integer,
  overrideamount_cur integer,
  paymentmethod integer,
  beanversion integer,
  lowbalancemethod integer,
  retired bigint,
  defaultselection boolean,
  overrideintvalue integer,
  paymentplan bigint,
  product integer,
  updateuserid bigint,
  writeoffreason integer,
  delinquencyreason integer,
  subtype integer,
  shouldcreateactivity boolean,
  producercode bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_catastrophe_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  detaileddescription character varying(1333),
  processed integer,
  holdinvoice integer,
  updateuserid bigint,
  holddelinquency integer,
  releasedate timestamp without time zone,
  updatetime timestamp without time zone,
  title character varying(255),
  id bigint,
  uwcompany integer
);

CREATE TABLE IF NOT EXISTS public.bcx_catastrophezone_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  zone character varying(255),
  updateuserid bigint,
  catastropheid bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_checkregister_ext (
  loadcommandid bigint,
  manualcheck boolean,
  checktype integer,
  publicid character varying(64),
  createtime timestamp without time zone,
  payeestate integer,
  sourcesystem character varying(10),
  payeecountry integer,
  checknumber bigint,
  couriercodetype integer,
  updatetime timestamp without time zone,
  payeeaddr1 character varying(33),
  payeezip character varying(10),
  payeeaddr2 character varying(33),
  couriercode character varying(8),
  id bigint,
  paymentamount numeric(18,2),
  createuserid bigint,
  checkid integer,
  vendorid character varying(50),
  voucherref character varying(50),
  payeephone character varying(18),
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  payee1 character varying(38),
  payee2 character varying(38),
  payee3 character varying(38),
  payee4 character varying(38),
  updateuserid bigint,
  formcode character varying(8),
  payeecity character varying(33),
  reissuedchecknumber bigint,
  errordescription character varying(255),
  bankaccountnum character varying(17),
  memo1 character varying(38),
  memo2 character varying(38),
  checkstatus integer,
  relatedactivity bigint,
  company integer
);

CREATE TABLE IF NOT EXISTS public.bcx_checkregisterdetail_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  claimnumber character varying(20),
  beanversion integer,
  dateofloss timestamp without time zone,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  insured character varying(28),
  claimant character varying(18),
  checkregister bigint,
  updateuserid bigint,
  netamount numeric(18,2),
  updatetime timestamp without time zone,
  id bigint,
  policynumber character varying(20),
  description character varying(33)
);

CREATE TABLE IF NOT EXISTS public.bcx_cmsnadjustment_ext (
  loadcommandid bigint,
  amount_amt numeric(18,2),
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  adjustmentreason integer,
  updatetime timestamp without time zone,
  producerfk bigint,
  policyperiodfk bigint,
  amount_cur integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_cmsnadjustpolperext (
  foreignentityid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  id bigint,
  ownerid bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_crossappactpattern_sp (
  loadcommandid bigint,
  destinationapplication integer,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  updatetime timestamp without time zone,
  id bigint,
  patterncode character varying(60),
  patterndisplayname character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcx_dbppayment_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  account bigint,
  payload text,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_deposit_sp (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  depositdate timestamp without time zone,
  checksreceived integer,
  updateuserid bigint,
  depositstatus integer,
  depositbatchtype integer,
  depositamount numeric(18,2),
  updatetime timestamp without time zone,
  depositamount_cur integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_destinationhistory_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  destinationid integer,
  retired bigint,
  createtime timestamp without time zone,
  retryablecount integer,
  updateuserid bigint,
  failedcount integer,
  status character varying(255),
  updatetime timestamp without time zone,
  inflightcount integer,
  id bigint,
  unsentcount integer
);

CREATE TABLE IF NOT EXISTS public.bcx_destinationmonitor_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  destinationid integer,
  retired bigint,
  createtime timestamp without time zone,
  retryablecount integer,
  updateuserid bigint,
  failedcount integer,
  status character varying(255),
  updatetime timestamp without time zone,
  inflightcount integer,
  id bigint,
  unsentcount integer
);

CREATE TABLE IF NOT EXISTS public.bcx_destinationsuspensionext (
  loadcommandid bigint,
  createuserid bigint,
  status integer,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  destinationid integer,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_distarchivereference (
  currency integer,
  createuserid bigint,
  basedistid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_distarchrefbychrgowner (
  createuserid bigint,
  publicid character varying(64),
  collateralrequirementid bigint,
  accountid bigint,
  beanversion integer,
  createtime timestamp without time zone,
  distarchivereferenceid bigint,
  policyperiodid bigint,
  updateuserid bigint,
  currency integer,
  collateralid bigint,
  commissionapplied numeric(18,2),
  commissionapplied_cur integer,
  updatetime timestamp without time zone,
  grossapplied numeric(18,2),
  subtype integer,
  grossapplied_cur integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_dmarchive_ext (
  loadcommandid bigint,
  entitypdfstatus integer,
  createuserid bigint,
  publicid character varying(64),
  docmigrationdate timestamp without time zone,
  beanversion integer,
  docmigrationstatus integer,
  createtime timestamp without time zone,
  retired bigint,
  notemigrationdate timestamp without time zone,
  notemigrationmessage character varying(1024),
  notemigrationstatus integer,
  updateuserid bigint,
  drawer character varying(6),
  documentsfailed integer,
  updatetime timestamp without time zone,
  entitypdfmessage character varying(1024),
  id bigint,
  entitykey character varying(20),
  documentsloaded integer,
  entitypdfdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcx_dmarchiveddoc_ext (
  migrationstatus integer,
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  documentnum character varying(20),
  updateuserid bigint,
  drawer character varying(6),
  updatetime timestamp without time zone,
  migrationmessage character varying(1024),
  id bigint,
  entitykey character varying(20),
  migrationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcx_dpsdocument_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retry boolean,
  archivepartition bigint,
  createtime timestamp without time zone,
  retired bigint,
  invoice bigint,
  processed boolean,
  updateuserid bigint,
  instanceid character varying(255),
  status integer,
  updatetime timestamp without time zone,
  documentid character varying(255),
  id bigint,
  delinquencyprocess bigint,
  producerstatement bigint,
  errormessage text
);

CREATE TABLE IF NOT EXISTS public.bcx_dpsdocumentadmin_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  customerportalurl character varying(255),
  beanversion integer,
  sfbphonenumber character varying(30),
  createtime timestamp without time zone,
  retired bigint,
  uwcompanyshortname character varying(255),
  supportemail character varying(255),
  paymentaddress bigint,
  updateuserid bigint,
  producerportalurl character varying(255),
  surchargenameext character varying(255),
  address bigint,
  updatetime timestamp without time zone,
  phonenumber character varying(40),
  id bigint,
  uwcompany integer,
  website character varying(255),
  physicaladdress bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_dpsdocumentrecipient_ext (
  loadcommandid bigint,
  dpsdocument bigint,
  createuserid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  invoice bigint,
  updateuserid bigint,
  updatetime timestamp without time zone,
  id bigint,
  recipientpublicid character varying(64)
);

CREATE TABLE IF NOT EXISTS public.bcx_dpsemail_ext (
  loadcommandid bigint,
  body text,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  subject character varying(1333),
  updateuserid bigint,
  documentuid character varying(255),
  updatetime timestamp without time zone,
  fileid character varying(255),
  recipients character varying(255),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_emaildetails_ext (
  loadcommandid bigint,
  body text,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  agentemaildetails bigint,
  subject character varying(1333),
  account bigint,
  updateuserid bigint,
  recipientemailaddress character varying(255),
  policyperiod bigint,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_encryptioninformation_psc (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  keylength integer,
  beanversion integer,
  identifier character varying(4),
  usekeystore boolean,
  retired bigint,
  createtime timestamp without time zone,
  secretpassword character varying(128),
  keystorealias character varying(80),
  keystorekeypass character varying(80),
  updateuserid bigint,
  keystorestorepass character varying(80),
  iterationcount integer,
  updatetime timestamp without time zone,
  keystorelocation character varying(128),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_epayaccount_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  updateuserid bigint,
  policyoffernumber character varying(60),
  updatetime timestamp without time zone,
  propertydisplayname character varying(60),
  registration bigint,
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_epaymanualpayment_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  identifier character varying(60),
  createtime timestamp without time zone,
  updateuserid bigint,
  paymentdate timestamp without time zone,
  updatetime timestamp without time zone,
  registration bigint,
  id bigint,
  confirmationnumber character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcx_epayregistration_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  authcodeexpiration timestamp without time zone,
  userid character varying(255),
  beanversion integer,
  createtime timestamp without time zone,
  showallinvoices boolean,
  name character varying(60),
  updateuserid bigint,
  lastrecurringdate timestamp without time zone,
  authcode character varying(10),
  updatetime timestamp without time zone,
  accountnumber character varying(255),
  emailaddress character varying(60),
  refreshmigratedaccount boolean,
  id bigint,
  uwcompany integer,
  emailupdated boolean
);

CREATE TABLE IF NOT EXISTS public.bcx_epaystatement_ext (
  loadcommandid bigint,
  publicid character varying(64),
  autodraftpending boolean,
  offerduedate timestamp without time zone,
  createtime timestamp without time zone,
  paymentplanid character varying(60),
  offerdate timestamp without time zone,
  draftdate timestamp without time zone,
  updatetime timestamp without time zone,
  id bigint,
  revision integer,
  uwcompany integer,
  producerphone character varying(30),
  producername character varying(255),
  createuserid bigint,
  producerphoneextension character varying(60),
  offernumber character varying(60),
  beanversion integer,
  autodraftamount_cur integer,
  invoice bigint,
  updateuserid bigint,
  autodraftamount_amt numeric(18,2),
  isopen boolean,
  registration bigint,
  offereffectivedate timestamp without time zone,
  producerphonecountry integer,
  locationaddressline1 character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcx_escheatmentfiles_ex (
  loadcommandid bigint,
  publicid character varying(64),
  filedata bytea,
  filename character varying(80),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_eximaudit_sp (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  audittype integer,
  updatetime timestamp without time zone,
  beanversion integer,
  createtime timestamp without time zone,
  retired bigint,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_eximauditdetailrecord_sp (
  loadcommandid bigint,
  removedrecords integer,
  createuserid bigint,
  publicid character varying(64),
  updatedrecords integer,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  insertedrecords integer,
  exportedrecords integer,
  updateuserid bigint,
  updatetime timestamp without time zone,
  eximaudit_sp bigint,
  id bigint,
  entitytype character varying(60)
);

CREATE TABLE IF NOT EXISTS public.bcx_exportselectedrecords_ext (
  loadcommandid bigint,
  columnname character varying(255),
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  exportableadmindataentity bigint,
  updateuserid bigint,
  updatetime timestamp without time zone,
  columnvalue character varying(1333),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_groupnames_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  name character varying(255),
  updateuserid bigint,
  updatetime timestamp without time zone,
  subtype integer,
  id bigint,
  producercode bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_importfileorder (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  priority integer,
  filename character varying(100),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  status integer,
  updatetime timestamp without time zone,
  shouldimport boolean,
  id bigint,
  importcomplete boolean
);

CREATE TABLE IF NOT EXISTS public.bcx_invitmsnpshotacc_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  invitemeventdate timestamp without time zone,
  invitemchargecode character varying(50),
  invitemamount_amt numeric(18,2),
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  createtime timestamp without time zone,
  invitemcreatetime timestamp without time zone,
  updateuserid bigint,
  policyperiod bigint,
  updatetime timestamp without time zone,
  id bigint,
  invitemamount_cur integer,
  invitemtype integer,
  invitemsnapshottagtodel boolean
);

CREATE TABLE IF NOT EXISTS public.bcx_invoicearchivereference (
  currency integer,
  createuserid bigint,
  publicid character varying(64),
  updatetime timestamp without time zone,
  beanversion integer,
  invoiceid bigint,
  createtime timestamp without time zone,
  id bigint,
  updateuserid bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_invoicearchrefbychrgowner (
  gross numeric(18,2),
  publicid character varying(64),
  gross_cur integer,
  collateralrequirementid bigint,
  accountid bigint,
  createtime timestamp without time zone,
  policyperiodid bigint,
  grosspaid numeric(18,2),
  grosspaid_cur integer,
  invoicearchivereferenceid bigint,
  currency integer,
  collateralid bigint,
  updatetime timestamp without time zone,
  id bigint,
  createuserid bigint,
  commissionwrittenoff numeric(18,2),
  commissionwrittenoff_cur integer,
  beanversion integer,
  commission numeric(18,2),
  commission_cur integer,
  updateuserid bigint,
  commissionapplied numeric(18,2),
  commissionapplied_cur integer,
  subtype integer,
  grosswrittenoff numeric(18,2),
  grosswrittenoff_cur integer
);

CREATE TABLE IF NOT EXISTS public.bcx_lockboxbatch_ext (
  loadcommandid bigint,
  createuserid bigint,
  batchnumber character varying(60),
  publicid character varying(64),
  manual boolean,
  beanversion integer,
  batchdate timestamp without time zone,
  createtime timestamp without time zone,
  sourcesystem integer,
  processed boolean,
  updateuserid bigint,
  updatetime timestamp without time zone,
  id bigint,
  source integer,
  uwcompany integer,
  totalamount numeric(18,2),
  totalamount_cur integer,
  divisionid character varying(60),
  batchtype character varying(60)
);

CREATE TABLE IF NOT EXISTS public.bcx_lockboxemail_ext (
  loadcommandid bigint,
  body text,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  subject character varying(1333),
  updateuserid bigint,
  updatetime timestamp without time zone,
  recipients character varying(255),
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_lockboxlineitem_ext (
  loadcommandid bigint,
  acipaymentmethod integer,
  lineitemtype integer,
  publicid character varying(64),
  createtime timestamp without time zone,
  controlcode character varying(255),
  sequencenumber character varying(60),
  sourcesystem integer,
  suspensepayment bigint,
  externalpaymentreference character varying(255),
  reversalreason integer,
  boacoupontype character varying(255),
  updatetime timestamp without time zone,
  refnumberinternal character varying(255),
  id bigint,
  amountdue numeric(18,2),
  amountdue_cur integer,
  moneyreceived bigint,
  createuserid bigint,
  boarmr boolean,
  amountpaid numeric(18,2),
  amountpaid_cur integer,
  userid character varying(255),
  paymentmethod integer,
  beanversion integer,
  refnumberoverride character varying(255),
  initiationdate timestamp without time zone,
  updateuserid bigint,
  policyoffernumberinternal character varying(60),
  status integer,
  errorcode integer,
  accountnumber character varying(255),
  electronicpaymentfound boolean,
  batch bigint,
  errormessage text,
  policyoffernumberoverride character varying(60),
  feeamount_cur integer,
  paymentinstrument bigint,
  payeremailaddress character varying(60),
  maskedccnumber character varying(255),
  acifeeamount numeric(18,2),
  bankaccountnumber character varying(255),
  paymentinitiationdate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcx_monetaryoridecurrency_sp (
  loadcommandid bigint,
  inuse boolean,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  value numeric(18,2),
  currency integer,
  value_cur integer,
  updatetime timestamp without time zone,
  monetaryoverride bigint,
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_offerdetail_ext (
  loadcommandid bigint,
  producergroupphone_ext character varying(30),
  publicid character varying(64),
  offerduedate timestamp without time zone,
  existingpolicynumber character varying(255),
  createtime timestamp without time zone,
  paymentplanid character varying(60),
  offerdate timestamp without time zone,
  name character varying(60),
  updatetime timestamp without time zone,
  emailaddress character varying(60),
  producergroupname_ext character varying(255),
  id bigint,
  producerphone character varying(30),
  producername character varying(255),
  offersubmitdate timestamp without time zone,
  createuserid bigint,
  producerphoneextension character varying(60),
  offernumber character varying(60),
  beanversion integer,
  autodraftamount_cur integer,
  updateuserid bigint,
  autodraftamount_amt numeric(18,2),
  accountnumber character varying(255),
  offereffectivedate timestamp without time zone,
  producerphonecountry integer,
  uwcompany_ext integer,
  locationaddressline1 character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcx_plcyaddlinsureddetail_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  policyaddlinsured bigint,
  updateuserid bigint,
  relationshiptype integer,
  updatetime timestamp without time zone,
  id bigint,
  additionalinsuredtype integer
);

CREATE TABLE IF NOT EXISTS public.bcx_poladdlcontactdetail_ext (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  descofinterest_hoe character varying(100),
  updatetime timestamp without time zone,
  relationship character varying(1333),
  subtype integer,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_policyperiodlocations_ext (
  locationname character varying(255),
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  policyperiodid bigint,
  addressid bigint,
  updateuserid bigint,
  updatetime timestamp without time zone,
  id bigint,
  pcfixedid character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcx_polperiodunapplied_sp (
  loadcommandid bigint,
  createuserid bigint,
  publicid character varying(64),
  archivepartition bigint,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  invoicestream bigint,
  updateuserid bigint,
  policyperiod bigint,
  updatetime timestamp without time zone,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_porsessid_ext (
  sessiontype character varying(50),
  sessionuuid character varying(50),
  publicid character varying(64),
  username character varying(50),
  issuedate timestamp without time zone,
  id bigint,
  foreignid character varying(50)
);

CREATE TABLE IF NOT EXISTS public.bcx_priordebtdisbursement_ext (
  loadcommandid bigint,
  debtdate timestamp without time zone,
  publicid character varying(64),
  taxid character varying(30),
  createtime timestamp without time zone,
  insuredmailingcity character varying(255),
  insuredphonenumber character varying(255),
  risklocationstate integer,
  insuredmailingstate integer,
  disbappractivity bigint,
  batchid character varying(30),
  updatetime timestamp without time zone,
  balancedue numeric(18,2),
  insuredmailingpostalcode character varying(255),
  id bigint,
  source integer,
  uwcompany integer,
  createuserid bigint,
  beanversion integer,
  archivepartition bigint,
  retired bigint,
  updateuserid bigint,
  risklocationcity character varying(255),
  risklocationaddress character varying(255),
  insuredmailingaddress character varying(255),
  insuredname character varying(255),
  policynumber character varying(255),
  risklocationpostalcode character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcx_priordebtreference_ext (
  loadcommandid bigint,
  debtdate timestamp without time zone,
  publicid character varying(64),
  taxid character varying(30),
  createtime timestamp without time zone,
  insuredmailingcity character varying(255),
  insuredphonenumber character varying(255),
  risklocationstate integer,
  insuredmailingstate integer,
  batchid character varying(30),
  updatetime timestamp without time zone,
  balancedue numeric(18,2),
  insuredmailingpostalcode character varying(255),
  id bigint,
  source integer,
  uwcompany integer,
  createuserid bigint,
  beanversion integer,
  risklocationcity character varying(255),
  updateuserid bigint,
  risklocationaddress character varying(255),
  insuredmailingaddress character varying(255),
  insuredname character varying(255),
  subtype integer,
  policynumber character varying(255),
  risklocationpostalcode character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcx_renewalofferemail_ext (
  loadcommandid bigint,
  body text,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  subject character varying(1333),
  offerdetail bigint,
  updateuserid bigint,
  recipientemailaddress character varying(255),
  accountnumber character varying(255),
  updatetime timestamp without time zone,
  registration bigint,
  id bigint
);

CREATE TABLE IF NOT EXISTS public.bcx_servicecallhistory_ext (
  servicename character varying(255),
  loadcommandid bigint,
  response text,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  createtime timestamp without time zone,
  request text,
  updateuserid bigint,
  updatetime timestamp without time zone,
  id bigint,
  keyattribute character varying(255)
);

CREATE TABLE IF NOT EXISTS public.bcx_surchargeoverrides_ext (
  loadcommandid bigint,
  createuserid bigint,
  inuse boolean,
  publicid character varying(64),
  active boolean,
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  updateuserid bigint,
  surchargename character varying(100),
  surchargeassessmentdate timestamp without time zone,
  invoiceduedate timestamp without time zone,
  updatetime timestamp without time zone,
  id bigint,
  surchargepercentage numeric(8,3),
  surchargetype integer,
  surchargeid character varying(100),
  batchrundate timestamp without time zone
);

CREATE TABLE IF NOT EXISTS public.bcx_twiaautodraftemail_ext (
  loadcommandid bigint,
  body text,
  createuserid bigint,
  publicid character varying(64),
  beanversion integer,
  retired bigint,
  createtime timestamp without time zone,
  subject character varying(1333),
  updateuserid bigint,
  updatetime timestamp without time zone,
  recipients character varying(255),
  id bigint
);

