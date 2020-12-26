unit DataMod;

{ See the comments in MAIN.PAS for information about this project }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;

type
  TMastData = class(TDataModule)
    Database: TDatabase;
    NextCust: TTable;
    NextCustNewCust: TFloatField;
    Parts: TTable;
    PartsOnHand: TFloatField;
    PartsOnOrder: TFloatField;
    PartsSource: TDataSource;
    PartsQuery: TQuery;
    PartsQueryDescription: TStringField;
    PartsQueryOnHand: TFloatField;
    PartsQueryOnOrder: TFloatField;
    VendorSource: TDataSource;
    Vendors: TTable;
    PartsVendorNo: TFloatField;
    PartsCost: TCurrencyField;
    PartsListPrice: TCurrencyField;
    PartsBackOrd: TBooleanField;
    PartsQueryVendorNo: TFloatField;
    PartsQueryCost: TCurrencyField;
    PartsQueryListPrice: TCurrencyField;
    PartsQueryBackOrd: TBooleanField;
    Orders: TTable;
    OrdersSource: TDataSource;
    CustByOrd: TTable;
    CustByOrdCustNo: TFloatField;
    CustByOrdCompany: TStringField;
    CustByOrdAddr1: TStringField;
    CustByOrdAddr2: TStringField;
    CustByOrdCity: TStringField;
    CustByOrdState: TStringField;
    CustByOrdZip: TStringField;
    CustByOrdCountry: TStringField;
    CustByOrdPhone: TStringField;
    CustByOrdFAX: TStringField;
    CustByOrdTaxRate: TFloatField;
    CustByOrdContact: TStringField;
    CustByOrdLastInvoiceDate: TDateTimeField;
    Items: TTable;
    ItemsItemNo: TFloatField;
    ItemsOrderNo: TFloatField;
    ItemsDescription: TStringField;
    ItemsSellPrice: TCurrencyField;
    ItemsQty: TIntegerField;
    ItemsDiscount: TFloatField;
    ItemsExtPrice: TCurrencyField;
    ItemsSource: TDataSource;
    NextOrd: TTable;
    NextOrdNewKey: TFloatField;
    Cust: TTable;
    CustCustNo: TFloatField;
    CustCompany: TStringField;
    CustPhone: TStringField;
    CustLastInvoiceDate: TDateTimeField;
    CustSource: TDataSource;
    OrdByCustSrc: TDataSource;
    OrdByCust: TTable;
    OrdByCustOrderNo: TFloatField;
    OrdByCustCustNo: TFloatField;
    OrdByCustSaleDate: TDateTimeField;
    OrdByCustShipDate: TDateTimeField;
    OrdByCustItemsTotal: TCurrencyField;
    OrdByCustTaxRate: TFloatField;
    OrdByCustFreight: TCurrencyField;
    OrdByCustAmountPaid: TCurrencyField;
    OrdByCustAmountDue: TCurrencyField;
    CustAddr1: TStringField;
    CustAddr2: TStringField;
    CustCity: TStringField;
    CustState: TStringField;
    CustZip: TStringField;
    CustCountry: TStringField;
    CustFAX: TStringField;
    CustTaxRate: TFloatField;
    CustContact: TStringField;
    CustMasterSrc: TDataSource;
    CustByComp: TTable;
    CustByCompSrc: TDataSource;
    Imports: TTable;
    Provider: TTable;
    NextSubItem: TTable;
    NextProv: TTable;
    NextImport: TTable;
    ImportsSource: TDataSource;
    ProviderSource: TDataSource;
    SubSource: TDataSource;
    NextSSource: TDataSource;
    ProvByCompScr: TDataSource;
    ImportsImportNo: TFloatField;
    ImportsProvNo: TFloatField;
    ImportsSaleDate: TDateTimeField;
    ImportsShipDate: TDateTimeField;
    ImportsEmpNo: TIntegerField;
    ImportsShipToContact: TStringField;
    ImportsShipToAddr1: TStringField;
    ImportsShipToAddr2: TStringField;
    ImportsShipToCity: TStringField;
    ImportsShipToState: TStringField;
    ImportsShipToZip: TStringField;
    ImportsShipToCountry: TStringField;
    ImportsShipToPhone: TStringField;
    ImportsShipVIA: TStringField;
    ImportsPO: TStringField;
    ImportsPaymentMethod: TStringField;
    ImportsItemsTotal: TCurrencyField;
    ImportsTaxRate: TFloatField;
    ImportsFreight: TCurrencyField;
    ImportsAmountPaid: TCurrencyField;
    ProviderProvNo: TFloatField;
    ProviderCompany: TStringField;
    ProviderAddr1: TStringField;
    ProviderAddr2: TStringField;
    ProviderCity: TStringField;
    ProviderState: TStringField;
    ProviderZip: TStringField;
    ProviderCountry: TStringField;
    ProviderPhone: TStringField;
    ProviderFAX: TStringField;
    ProviderTaxRate: TFloatField;
    ProviderContact: TStringField;
    ProviderLastInvoiceDate: TDateTimeField;
    ImportsTaxTotal: TCurrencyField;
    ImportsAmountDue: TCurrencyField;
    PartsOrderNo: TIntegerField;
    ImpoByProv: TTable;
    ProvByComp: TTable;
    ImpoByProvImportNo: TFloatField;
    ImpoByProvProvNo: TFloatField;
    ImpoByProvSaleDate: TDateTimeField;
    ImpoByProvShipDate: TDateTimeField;
    ImpoByProvEmpNo: TIntegerField;
    ImpoByProvItemsTotal: TCurrencyField;
    ImpoByProvTaxRate: TFloatField;
    ImpoByProvFreight: TCurrencyField;
    ImpoByProvAmountPaid: TCurrencyField;
    ProvByImpo: TTable;
    buyers: TTable;
    BuyersSource: TDataSource;
    ProvMasterSrc: TDataSource;
    ImpoByProvSrc: TDataSource;
    ImpoByProvAmountDue: TCurrencyField;
    ProvByImpoProvNo: TFloatField;
    ProvByImpoCompany: TStringField;
    ProvByImpoAddr1: TStringField;
    ProvByImpoAddr2: TStringField;
    ProvByImpoCity: TStringField;
    ProvByImpoState: TStringField;
    ProvByImpoZip: TStringField;
    ProvByImpoCountry: TStringField;
    ProvByImpoPhone: TStringField;
    ProvByImpoFAX: TStringField;
    ProvByImpoTaxRate: TFloatField;
    ProvByImpoContact: TStringField;
    ProvByImpoLastInvoiceDate: TDateTimeField;
    OrdersOrderNo: TFloatField;
    OrdersCustNo: TFloatField;
    OrdersSaleDate: TDateTimeField;
    OrdersShipDate: TDateTimeField;
    OrdersEmpNo: TIntegerField;
    OrdersShipToContact: TStringField;
    OrdersShipToAddr1: TStringField;
    OrdersShipToAddr2: TStringField;
    OrdersShipToCity: TStringField;
    OrdersShipToState: TStringField;
    OrdersShipToZip: TStringField;
    OrdersShipToCountry: TStringField;
    OrdersShipToPhone: TStringField;
    OrdersShipVIA: TStringField;
    OrdersPO: TStringField;
    OrdersPaymentMethod: TStringField;
    OrdersItemsTotal: TCurrencyField;
    OrdersTaxRate: TFloatField;
    OrdersFreight: TCurrencyField;
    OrdersAmountPaid: TCurrencyField;
    OrdersTaxTotal: TCurrencyField;
    OrdersAmountDue: TCurrencyField;
    NextProvNewProv: TFloatField;
    LastItemQuery: TQuery;
    LastsubItemQuery: TQuery;
    NextSubItemNewKey: TFloatField;
    Emprs: TTable;
    EmprsEmNo: TIntegerField;
    EmprsFullName: TStringField;
    EmprsLastName: TStringField;
    EmprsFirstName: TStringField;
    EmprsPhoneExt: TStringField;
    EmprsHireDate: TDateTimeField;
    EmprsSalary: TFloatField;
    NextImportNewKey: TFloatField;
    CustByOrdSrc: TDataSource;
    ProvByImpoSrc: TDataSource;
    EmpsSource: TDataSource;
    EmprsSource: TDataSource;
    SubItems: TTable;
    SubItemsItemNo: TFloatField;
    StringField4: TStringField;
    SubItemsSellPrice: TCurrencyField;
    SubItemsDiscount: TFloatField;
    SubItemsQty: TIntegerField;
    SubItemsExtPrice: TCurrencyField;
    SubItemsImportNo: TFloatField;
    SubItemsQtyUnit: TStringField;
    Emps: TTable;
    EmpsEmpNo: TIntegerField;
    EmpsFullName: TStringField;
    EmpsLastName: TStringField;
    EmpsFirstName: TStringField;
    EmpsPhoneExt: TStringField;
    EmpsHireDate: TDateTimeField;
    EmpsSalary: TFloatField;
    CustQuery: TQuery;
    CustQueryCustNo: TFloatField;
    CustQueryCompany: TStringField;
    CustQueryPhone: TStringField;
    CustQueryLastInvoiceDate: TDateTimeField;
    ProvQuery: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    CustByLastInvQuery: TQuery;
    CustByLastInvQueryCustNo: TFloatField;
    CustByLastInvQueryCompany: TStringField;
    CustByLastInvQueryAddr1: TStringField;
    CustByLastInvQueryAddr2: TStringField;
    CustByLastInvQueryCity: TStringField;
    CustByLastInvQueryState: TStringField;
    CustByLastInvQueryZip: TStringField;
    CustByLastInvQueryCountry: TStringField;
    CustByLastInvQueryPhone: TStringField;
    CustByLastInvQueryFAX: TStringField;
    CustByLastInvQueryTaxRate: TFloatField;
    CustByLastInvQueryContact: TStringField;
    CustByLastInvQueryLastInvoiceDate: TDateTimeField;
    ProvByLastInvQuery: TQuery;
    StringField3: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField3: TFloatField;
    StringField13: TStringField;
    DateTimeField2: TDateTimeField;
    ProvByLastInvQueryProvNo: TFloatField;
    OrdersByDateQuery: TQuery;
    OrdersByDateQueryOrderNo: TFloatField;
    OrdersByDateQueryCustNo: TFloatField;
    OrdersByDateQuerySaleDate: TDateTimeField;
    OrdersByDateQueryShipDate: TDateTimeField;
    OrdersByDateQueryEmpNo: TIntegerField;
    OrdersByDateQueryShipToContact: TStringField;
    OrdersByDateQueryShipToAddr1: TStringField;
    OrdersByDateQueryShipToAddr2: TStringField;
    OrdersByDateQueryShipToCity: TStringField;
    OrdersByDateQueryShipToState: TStringField;
    OrdersByDateQueryShipToZip: TStringField;
    OrdersByDateQueryShipToCountry: TStringField;
    OrdersByDateQueryShipToPhone: TStringField;
    OrdersByDateQueryShipVIA: TStringField;
    OrdersByDateQueryPO: TStringField;
    OrdersByDateQueryTerms: TStringField;
    OrdersByDateQueryPaymentMethod: TStringField;
    OrdersByDateQueryItemsTotal: TCurrencyField;
    OrdersByDateQueryTaxRate: TFloatField;
    OrdersByDateQueryFreight: TCurrencyField;
    OrdersByDateQueryAmountPaid: TCurrencyField;
    OrdersByDateQueryCompany: TStringField;
    PartsPartNo: TStringField;
    SubItemsPartNo: TStringField;
    ItemsPartNo: TStringField;
    PartsQueryPartNo: TStringField;
    ItemsNotes: TStringField;
    PartsUnit: TStringField;
    PartsEXpDate: TDateField;
    SubItemsNotes: TStringField;
    ItemsQtyUnit: TStringField;
    ItemsInStores: TFloatField;
    ItemsOpDate: TDateField;
    SubItemsInStores: TFloatField;
    SubItemsOpDate: TDateField;
    PartsInStores: TFloatField;
    ItemsCompany: TStringField;
    SubItemsCompany: TStringField;
    ItemsQry: TTable;
    SubItemsQry: TTable;
    MasterByDateSQuery: TQuery;
    MasterByDateSQueryImportNo: TFloatField;
    MasterByDateSQueryItemNo: TFloatField;
    MasterByDateSQueryOpDate: TDateField;
    MasterByDateSQueryPartNo: TStringField;
    MasterByDateSQueryQty: TIntegerField;
    MasterByDateSQueryDiscount: TFloatField;
    MasterByDateSQueryQtyUnit: TStringField;
    MasterByDateSQueryNotes: TStringField;
    MasterByDateSQueryInStores: TFloatField;
    MasterByDateSQueryCompany: TStringField;
    MasterByDateIQuery: TQuery;
    MasterByDateIQueryOrderNo: TFloatField;
    MasterByDateIQueryItemNo: TFloatField;
    MasterByDateIQueryOpDate: TDateField;
    MasterByDateIQueryPartNo: TStringField;
    MasterByDateIQueryQty: TIntegerField;
    MasterByDateIQueryDiscount: TFloatField;
    MasterByDateIQueryQtyUnit: TStringField;
    MasterByDateIQueryNotes: TStringField;
    MasterByDateIQueryInStores: TFloatField;
    MasterByDateIQueryCompany: TStringField;
    ItemSPQxxx: TQuery;
    ItemSPQxxxOrderNo: TFloatField;
    ItemSPQxxxItemNo: TFloatField;
    ItemSPQxxxOpDate: TDateField;
    ItemSPQxxxPartNo: TStringField;
    ItemSPQxxxQty: TIntegerField;
    FloatField5: TFloatField;
    ItemSPQxxxDiscount: TStringField;
    ItemSPQxxxNotes: TStringField;
    ItemSPQxxxInStores: TFloatField;
    ItemSPQxxxCompany: TStringField;
    ItemSPQ: TTable;
    ItemSPQOrderNo: TFloatField;
    ItemSPQItemNo: TFloatField;
    ItemSPQOpDate: TDateField;
    ItemSPQPartNo: TStringField;
    ItemSPQQty: TIntegerField;
    ItemSPQDiscount: TFloatField;
    ItemSPQQtyUnit: TStringField;
    ItemSPQNotes: TStringField;
    ItemSPQInStores: TFloatField;
    ItemSPQCompany: TStringField;
    ItemSPQCounter: TIntegerField;
    DParts: TTable;
    DPartsSrc: TDataSource;
    DPartsSerNo: TAutoIncField;
    DPartsItemN0: TStringField;
    DPartsCommName: TStringField;
    DPartsCompName: TStringField;
    DPartsUprice: TCurrencyField;
    PartsCommName: TStringField;
    PartsCompName: TStringField;
    DPartsExpDate: TDateField;
    VendorsVendorNo: TFloatField;
    VendorsVendorName: TStringField;
    VendorsAddress1: TStringField;
    VendorsAddress2: TStringField;
    VendorsCity: TStringField;
    VendorsState: TStringField;
    VendorsZip: TStringField;
    VendorsCountry: TStringField;
    VendorsPhone: TStringField;
    VendorsFAX: TStringField;
    VendorsPreferred: TBooleanField;
    CustByCompCustNo: TFloatField;
    CustByCompCompany: TStringField;
    CustByCompAddr1: TStringField;
    CustByCompAddr2: TStringField;
    CustByCompCity: TStringField;
    CustByCompState: TStringField;
    CustByCompZip: TStringField;
    CustByCompCountry: TStringField;
    CustByCompPhone: TStringField;
    CustByCompFAX: TStringField;
    CustByCompTaxRate: TFloatField;
    CustByCompContact: TStringField;
    CustByCompLastInvoiceDate: TDateTimeField;
    buyersVendorNo: TFloatField;
    buyersVendorName: TStringField;
    buyersAddress1: TStringField;
    buyersAddress2: TStringField;
    buyersCity: TStringField;
    buyersState: TStringField;
    buyersZip: TStringField;
    buyersCountry: TStringField;
    buyersPhone: TStringField;
    buyersFAX: TStringField;
    buyersPreferred: TBooleanField;
    ProvByCompProvNo: TFloatField;
    ProvByCompCompany: TStringField;
    ProvByCompAddr1: TStringField;
    ProvByCompAddr2: TStringField;
    ProvByCompCity: TStringField;
    ProvByCompState: TStringField;
    ProvByCompZip: TStringField;
    ProvByCompCountry: TStringField;
    ProvByCompPhone: TStringField;
    ProvByCompFAX: TStringField;
    ProvByCompTaxRate: TFloatField;
    ProvByCompContact: TStringField;
    ProvByCompLastInvoiceDate: TDateTimeField;
    ItemsQryOrderNo: TFloatField;
    ItemsQryItemNo: TFloatField;
    ItemsQryOpDate: TDateField;
    ItemsQryPartNo: TStringField;
    ItemsQryQty: TIntegerField;
    ItemsQryDiscount: TFloatField;
    ItemsQryQtyUnit: TStringField;
    ItemsQryNotes: TStringField;
    ItemsQryInStores: TFloatField;
    ItemsQryCompany: TStringField;
    ItemsExpDate: TDateField;
    SubItemsExpDate: TDateField;
    MasterByDateSQueryExpDate: TDateField;
    MasterByDateIQueryExpDate: TDateField;
    DPartsUnit: TStringField;
    OrdersTerms: TStringField;
    ImportsTerms: TStringField;
    ItemSPQSum: TIntegerField;
    PartsDescription: TStringField;
    DPartsDescription: TStringField;
    PartsQueryUnit: TStringField;
    PartsQueryInStores: TFloatField;
    PartsQueryEXpDate: TDateField;
    PartsQueryCommName: TStringField;
    PartsQueryCompName: TStringField;
    ProvQueryProvNo: TFloatField;
    ImportsByDateQuery: TQuery;
    ImportsByDateQueryImportNo: TFloatField;
    ImportsByDateQueryProvNo: TFloatField;
    ImportsByDateQuerySaleDate: TDateTimeField;
    ImportsByDateQueryShipDate: TDateTimeField;
    ImportsByDateQueryEmpNo: TIntegerField;
    ImportsByDateQueryShipToContact: TStringField;
    ImportsByDateQueryShipToAddr1: TStringField;
    ImportsByDateQueryShipToAddr2: TStringField;
    ImportsByDateQueryShipToCity: TStringField;
    ImportsByDateQueryShipToState: TStringField;
    ImportsByDateQueryShipToZip: TStringField;
    ImportsByDateQueryShipToCountry: TStringField;
    ImportsByDateQueryShipToPhone: TStringField;
    ImportsByDateQueryShipVIA: TStringField;
    ImportsByDateQueryPO: TStringField;
    ImportsByDateQueryTerms: TStringField;
    ImportsByDateQueryPaymentMethod: TStringField;
    ImportsByDateQueryItemsTotal: TCurrencyField;
    ImportsByDateQueryTaxRate: TFloatField;
    ImportsByDateQueryFreight: TCurrencyField;
    ImportsByDateQueryAmountPaid: TCurrencyField;
    procedure PartsBeforeOpen(DataSet: TDataSet);
    procedure PartsCalcFields(DataSet: TDataSet);
    procedure PartsQueryCalcFields(DataSet: TDataSet);
    procedure OrdersAfterCancel(DataSet: TDataSet);
    procedure OrdersAfterPost(DataSet: TDataSet);
    procedure OrdersBeforeCancel(DataSet: TDataSet);
    procedure OrdersBeforeClose(DataSet: TDataSet);
    procedure OrdersBeforeDelete(DataSet: TDataSet);
    procedure OrdersBeforeInsert(DataSet: TDataSet);
    procedure OrdersBeforeOpen(DataSet: TDataSet);
    procedure OrdersCalcFields(DataSet: TDataSet);
    procedure OrdersNewRecord(DataSet: TDataSet);
    procedure ItemsAfterDelete(DataSet: TDataSet);
    procedure ItemsAfterPost(DataSet: TDataSet);
    procedure EnsureOrdersEdit(DataSet: TDataSet);
    procedure EnsureImportsEdit(DataSet: TDataSet);
    procedure ItemsBeforeEdit(DataSet: TDataSet);
    procedure ItemsBeforeOpen(DataSet: TDataSet);
    procedure ItemsBeforePost(DataSet: TDataSet);
    procedure ItemsCalcFields(DataSet: TDataSet);
    procedure ItemsNewRecord(DataSet: TDataSet);
    procedure EmpsCalcFields(DataSet: TDataSet);
    procedure OrdersCustNoChange(Sender: TField);
    procedure ItemsQtyValidate(Sender: TField);
    procedure OrdersFreightValidate(Sender: TField);
    procedure ItemsPartNoValidate(Sender: TField);
    procedure OrdersSaleDateValidate(Sender: TField);
    procedure CustBeforeOpen(DataSet: TDataSet);
    procedure OrdByCustCalcFields(DataSet: TDataSet);
    procedure CustBeforePost(DataSet: TDataSet);
    procedure OrdersAfterDelete(DataSet: TDataSet);
    procedure OrdersBeforeEdit(DataSet: TDataSet);
    procedure EditUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure SubItemAfterDelete(DataSet: TDataSet);
    procedure SubItemAfterPost(DataSet: TDataSet);
    procedure SubItemBeforeDelete(DataSet: TDataSet);
    procedure SubItemBeforeEdit(DataSet: TDataSet);
    procedure SubItemBeforeInsert(DataSet: TDataSet);
    procedure SubItemBeforeOpen(DataSet: TDataSet);
    procedure SubItemBeforePost(DataSet: TDataSet);
    procedure SubItemCalcFields(DataSet: TDataSet);
    procedure SubItemNewRecord(DataSet: TDataSet);
    procedure ImportsAfterCancel(DataSet: TDataSet);
    procedure ImpoByProvCalcFields(DataSet: TDataSet);
    procedure ImportsAfterDelete(DataSet: TDataSet);
    procedure ImportsAfterPost(DataSet: TDataSet);
    procedure ImportsBeforeCancel(DataSet: TDataSet);
    procedure ImportsBeforeClose(DataSet: TDataSet);
    procedure ImportsBeforeDelete(DataSet: TDataSet);
    procedure ProviderBeforeOpen(DataSet: TDataSet);
    procedure ProviderBeforePost(DataSet: TDataSet);
    procedure ImportsBeforeEdit(DataSet: TDataSet);
    procedure ImportsBeforeInsert(DataSet: TDataSet);
    procedure ImportsBeforeOpen(DataSet: TDataSet);
    procedure ImportsCalcFields(DataSet: TDataSet);
    procedure ImportsNewRecord(DataSet: TDataSet);
    procedure SubItemQtyValidate(Sender: TField);
    procedure SubItemPartNoValidate(Sender: TField);
    procedure EmprsCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure SubItemsAfterOpen(DataSet: TDataSet);
    procedure SubItemsAfterInsert(DataSet: TDataSet);
    procedure SubItemsBeforeDelete(DataSet: TDataSet);
    procedure ItemsAfterEdit(DataSet: TDataSet);
    procedure ItemsAfterInsert(DataSet: TDataSet);
    procedure ItemsBeforeDelete(DataSet: TDataSet);
    procedure SubItemsAfterEdit(DataSet: TDataSet);
    procedure SubItemsBeforeInsert(DataSet: TDataSet);
    procedure SubItemsQtyValidate(Sender: TField);
    procedure PartsBeforePost(DataSet: TDataSet);
    procedure DPartsUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure PartsAfterPost(DataSet: TDataSet);
    procedure PartsBeforeDelete(DataSet: TDataSet);
    procedure ItemsExpDateValidate(Sender: TField);
    procedure SubItemsExpDateValidate(Sender: TField);
    procedure PartsInStoresValidate(Sender: TField);
    procedure ItemsPartNoChange(Sender: TField);
    procedure SubItemsPartNoChange(Sender: TField);
  private
    PrevPartNo: String;       { remembers Item's previous part# }
    PrevQty: Longint;         { remembers Item's previous qty }
    DeletingItems: Boolean;   { suppress totals calc. if deleting items }
    FItemNo: Integer;
    function DataDirectory: string;
    procedure SetDatabaseAlias(AliasName: string);
    procedure UpdateTotals;
    procedure UpdateTotals2;
    procedure DeleteItems;
  public
    procedure UseLocalData;
    procedure UseRemoteData;
    function DataSetApplyUpdates(DataSet: TDataSet; Apply: Boolean): Boolean;
  end;

function Confirm(Msg: string): Boolean;

var
  MastData : TMastData;
  X        : Integer;
  Y        : Integer;
  Zero     : Integer;
  Add      : Double;
  Sub      : Double;
  Vor      : Integer;
  PInStore : Double;
  Item     : String;
implementation

{$R *.dfm}

uses Variants;

{ Utility Functions }

function Confirm(Msg: string): Boolean;
begin
  Result := MessageDlg(Msg, mtConfirmation, mbYesNoCancel, 0) = mrYes;
end;

function TMastData.DataDirectory: string;
begin
  { Assume data is in ..\..\data relative to where we are }
  Result := ExtractFilePath(ParamStr(0));
  Result := ExpandFileName(Result + '..\..\DATA\');
end;

{ This function switches the database to a different alias }

procedure TMastData.SetDatabaseAlias(AliasName: string);
begin
  Screen.Cursor := crHourGlass;
  try
    Database.Close;
    Database.AliasName := AliasName;
    Database.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

{ Create an alias for the local data if needed, then swith the Database
  to use it }

procedure TMastData.UseLocalData;
var
  DataDir: string;
begin
  { See if the target alias exists, if not then add it. }
  if not Session.IsAlias('MAST') then
  begin
    DataDir := DataDirectory;
    if not FileExists(DataDir+'ORDERS.DB') then
      raise Exception.Create('Cannot locate Paradox data files');
    if not FileExists(DataDir+'IMPORTS.DB') then
      raise Exception.Create('Cannot locate Paradox data files');
    Session.AddStandardAlias('MAST', DataDir, 'PARADOX');
  end;
  SetDatabaseAlias('MAST');
end;

{ Create an alias to point to the MastSQL.GDB file if needed }

procedure TMastData.UseRemoteData;
var
  Params: TStringList;
  DataFile: string;
begin

  { See if the alias exists.  if not then add it. }
  if not Session.IsAlias('MASTSQL') then
  begin
    DataFile := DataDirectory + 'MASTSQL.GDB';
    if not FileExists(DataFile) then
      raise Exception.Create('Cannot locate Interbase data file: MASTSQL.GDB');
    Params := TStringList.create;
    try
      Params.Values['SERVER NAME'] := DataFile;
      Params.Values['USER NAME'] := 'SYSDBA';
      Session.AddAlias('MASTSQL', 'INTRBASE', Params);
    finally
       Params.Free;
    end;
  end;
  SetDatabaseAlias('MASTSQL');
end;

{ Event Handlers }

procedure TMastData.PartsBeforeOpen(DataSet: TDataSet);
begin
  Vendors.Open;
end;

procedure TMastData.PartsCalcFields(DataSet: TDataSet);
begin
  PartsBackOrd.Value := PartsOnOrder.Value > PartsOnHand.Value;
end;

procedure TMastData.PartsQueryCalcFields(DataSet: TDataSet);
begin
  PartsQueryBackOrd.Value := PartsOnOrder.Value > PartsOnHand.Value;
end;

{ If user cancels the updates to the orders table, cancel the updates to
  the line items as well }

procedure TMastData.OrdersAfterCancel(DataSet: TDataSet);
begin
  Cust.CancelUpdates;
  Parts.CancelUpdates;
  Items.CancelUpdates;
  Orders.CancelUpdates;
end;

procedure TMastData.OrdersAfterDelete(DataSet: TDataSet);
begin
  Database.ApplyUpdates([Cust, Parts, Items, Orders]);
end;

{ Order Entry }

{ Post new LastInvoiceDate to CUST table. }

procedure TMastData.OrdersAfterPost(DataSet: TDataSet);

begin
  if Cust.Locate('CustNo', OrdersCustNo.Value, []) and
    (CustLastInvoiceDate.Value < OrdersShipDate.Value) then
  begin
    Cust.Edit;
    CustLastInvoiceDate.Value := OrdersShipDate.Value;
    Cust.Post;
  end;
  Database.ApplyUpdates([Orders, Items, Parts, Cust]);
end;

procedure TMastData.OrdersBeforeCancel(DataSet: TDataSet);
begin
  if (Orders.State = dsInsert) and not (Items.BOF and Items.EOF) then
    if not Confirm('Cancel order being inserted and delete all line items?') then
      Abort;
end;

procedure TMastData.OrdersBeforeClose(DataSet: TDataSet);
begin
  Items.Close;
  Emps.Close;
  CustByOrd.Close;
end;

procedure TMastData.OrdersBeforeDelete(DataSet: TDataSet);
begin
  if not Confirm('Delete order and line items?') then
    Abort
  else
    DeleteItems;
end;

procedure TMastData.OrdersBeforeInsert(DataSet: TDataSet);
begin
  if Orders.State in dsEditModes then
  begin
    if Confirm('An order is being processed.  Save changes and start a new one?') then
      Orders.Post
    else
      Abort;
  end;
  FItemNo := 1;
end;

procedure TMastData.OrdersBeforeOpen(DataSet: TDataSet);
begin
  CustByComp.Open;
  CustByOrd.Open;
  Cust.Open;
  Emps.Open;
  Emps.Edit;
  Items.Open;
  Parts.Open;
end;

{ Calculate the order's tax totals and amount due }

procedure TMastData.OrdersCalcFields(DataSet: TDataSet);
begin
  OrdersTaxTotal.Value := OrdersItemsTotal.Value * (OrdersTaxRate.Value / 100);
  OrdersAmountDue.Value := OrdersItemsTotal.Value + OrdersTaxTotal.Value +
  OrdersFreight.Value - OrdersAmountPaid.Value;
end;

{ Inititializes the record values as a result of an Orders.Insert. }

procedure TMastData.OrdersNewRecord(DataSet: TDataSet);
begin

  { Get the Next Order Value from the NextOrd Table }

  with NextOrd do
  begin
    Open;
    try
      Edit;
      OrdersOrderNo.Value := NextOrdNewKey.Value;
      NextOrdNewKey.Value := NextOrdNewKey.Value + 1;
      Post;
    finally
      Close;
    end;
  end;
  OrdersSaleDate.Value := Date;
  OrdersShipVia.Value := 'Camion';
  OrdersTerms.Value := 'None';
  OrdersPaymentMethod.Value := 'Check';
  OrdersItemsTotal.Value := 0;
  OrdersTaxRate.Value := 0;
  OrdersFreight.Value := 0;
  OrdersAmountPaid.Value := 0;
end;

procedure TMastData.ItemsAfterDelete(DataSet: TDataSet);
begin
  Parts.Edit;
  PartsInStores.Value := PartsInStores.Value + Sub;
  UpdateTotals;
  X := 2;
end;

{ Update the order totals and the Parts table }

procedure TMastData.ItemsAfterPost(DataSet: TDataSet);

  { Reduce/increase Parts table's OnOrder field }

  procedure UpdateParts(PartNo: String; Qty : Longint);
  begin
    if  (Qty <> 0) then //(PartNo > '0') and
    try
      if not Parts.Locate('PartNo', PartNo, []) then Abort;
      Parts.Edit;
      PartsOnOrder.Value := PartsOnOrder.Value + Qty;

      if (X <> 3)then
          PartsInStores.Value := ItemsInStores.Value
      else
          PartsInStores.Value := PartsInStores.Value + Vor;

      X := 2;
      Parts.Post;
  except
      on E: Exception do
        ShowMessage(Format('Error updating parts table for PartNo: %s', [PartNo]));
    end;
  end;

begin
  { Maintain next available item number }

  X := 2;
  Inc(FItemNo);
  UpdateTotals;
  if not ((PrevPartNo = ItemsPartNo.Value) and (PrevQty = ItemsQty.Value)) then
  begin
   { Reduce previous Part#'s OnOrder field by previous Qty }
    UpdateParts(PrevPartNo, -PrevQty);
   { Increase new Part#'s OnOrder field by previous Qty }
    UpdateParts(ItemsPartNo.Value, ItemsQty.Value);
  end;
end;

{  When a change to the detail table affects a field in the master, always make
  sure the master (orders) table is in edit or insert mode before allowing the
  detail table to be modified. }

procedure TMastData.EnsureOrdersEdit(DataSet: TDataSet);
begin
  Orders.Edit;
end;

procedure TMastData.EnsureImportsEdit(DataSet: TDataSet);
begin
  Imports.Edit;
end;

{ Remember previous PartNo and Qty for updating Parts.OnOrder after post.
  When a change to the detail table affects a field in the master, always make
  sure the master table is in edit or insert mode before allowing the
  detail table to be modified. }

procedure TMastData.ItemsBeforeEdit(DataSet: TDataSet);
begin
//  if Parts.Locate('PartN0', ItemsPartNo.Value, []) then
   Item := ItemsPartNo.Value;
   PInStore := PartsInStores.Value;

  if (Zero = 0) then
     begin
      Vor := ItemsQty.Value;
      Zero := Zero + 1;
     end;
  Sub := Vor;

  Orders.Edit;
  PrevPartNo := ItemsPartNo.Value;
  PrevQty := ItemsQty.Value;
end;

{ Make sure the Parts table opens before the Items table, since there are
  lookups which depend on it. }

procedure TMastData.ItemsBeforeOpen(DataSet: TDataSet);
begin
  Parts.Open;
end;

{ Complete the item's key by initializing its NextItemNo field }

procedure TMastData.ItemsBeforePost(DataSet: TDataSet);
begin

  PInStore := PartsInStores.Value;
 //  if ItemsInStores.Value > PartsInStores.Value then
 //   raise Exception.Create('Sorry there are no enough from this Item in the Store')
 //   else
 //and (Sub >= 1) and (Sub < ItemsQty.Value)
  if (ItemsQty.Value <> Sub) and (X<>0) then
    if (ItemsQty.Value > Sub) then
        begin
        Sub := ItemsQty.Value - Sub;
        ItemsInStores.Value := PartsInStores.Value - Sub;
        X := 1;
        end
    else
      if (ItemsQty.Value < Sub) then
        begin
        Sub := Sub - ItemsQty.Value;
        ItemsInStores.Value := PartsInStores.Value + Sub;
        X := 4;
        end;
     { else
         if (X = 3)then
            ItemsInStores.Value := ItemsInStores.Value + ItemsQty.Value;
      }
  //?
  if (x = 6) then
      ItemsInStores.Value := PartsInStores.Value;

  if (Length(ItemsOpDate.AsString) <= 1) then
      ItemsOpDate.Value := OrdersSaleDate.Value;

  if (Length(ItemsExpDate.AsString) <= 1) then
      ItemsExpDate.Value := PartsExpDate.Value;

  ItemsQtyUnit.Value := PartsUnit.Value;

  //if (Length(ItemsCompany.AsString) <= 1) then
  //    ItemsCompany.Value := EdOrderForm.CompanyCombo.Text;
  if (Length(ItemsCompany.AsString) <= 1) then
  if Cust.Locate('CustNo', OrdersCustNo.Value, []) then
     ItemsCompany.Value := CustCompany.Value;

  if (X = 0) then
      ItemsInStores.Value := PartsInStores.Value - ItemsQty.Value;

  X := 2;
  Sub := 0;
  Zero := 0;
  ItemsItemNo.Value := FItemNo;
 // ItemsCompany.Value := CustCompany.Value;
end;

{ Lookup PartNo info for the item; calculate its extended price }

procedure TMastData.ItemsCalcFields(DataSet: TDataSet);
begin
  ItemsExtPrice.Value := ItemsQty.Value *
    ItemsSellPrice.Value * (100 - ItemsDiscount.Value) / 100;
end;

{ New item. Zero the "prev" buckets, initialize the key }

procedure TMastData.ItemsNewRecord(DataSet: TDataSet);
begin
  PrevPartNo := '0';
  PrevQty := 0;
  ItemsOrderNo.Value := OrdersOrderNo.Value;
  ItemsQty.Value := 1;
  ItemsDiscount.Value := 0;
end;

{ Concatenate last name + first name for the order's SoldBy DBLookupCombo }

procedure TMastData.EmpsCalcFields(DataSet: TDataSet);
begin
  EmpsFullName.Value := Format('%s, %s', [EmpsLastName.Value, EmpsFirstName.Value]);
end;

procedure TMastData.DeleteItems;
begin
  DeletingItems := True;    { suppress recalc of totals during delete }
  Items.DisableControls;    { for faster table traversal }
  try
    Items.First;
    while not Items.EOF do Items.Delete;
  finally
    DeletingItems := False;
    Items.EnableControls;   { always re-enable controls after disabling }
  end;
end;

{ Steps through Items and gathers sum of ExtPrice. After OrdersItemsTotal
  is calculated, OrdersCalcFields is automatically called (which
  updates other calculated fields. }

procedure TMastData.UpdateTotals;
var
  TempTotal: Extended;
  PrevRecord: TBookmark;
begin
  if DeletingItems then Exit;		{ don't calculate if deleting all items }
  PrevRecord := Items.GetBookmark;	{ returns nil if table is empty }
  try
    Items.DisableControls;
    Items.First;
    TempTotal := 0;			{ use temp for efficiency }
    while not Items.EOF do
    begin
      TempTotal := TempTotal + ItemsExtPrice.Value;
      Items.Next;
    end;
    OrdersItemsTotal.Value := TempTotal;
  finally
     Items.EnableControls;
     if PrevRecord <> nil then
     begin
       Items.GoToBookmark(PrevRecord);
       Items.FreeBookmark(PrevRecord);
     end;
  end;
end;

procedure TMastData.UpdateTotals2;
var
  TempTotal: Extended;
  PrevRecord: TBookmark;
begin
  if DeletingItems then Exit;		{ don't calculate if deleting all items }
  PrevRecord := SubItems.GetBookmark;	{ returns nil if table is empty }
  try
    SubItems.DisableControls;
    SubItems.First;
    TempTotal := 0;			{ use temp for efficiency }
    while not SubItems.EOF do
    begin
      TempTotal := TempTotal + SubItemsExtPrice.Value;
      SubItems.Next;
    end;
    ImportsItemsTotal.Value := TempTotal;
  finally
     SubItems.EnableControls;
     if PrevRecord <> nil then
     begin
       SubItems.GoToBookmark(PrevRecord);
       SubItems.FreeBookmark(PrevRecord);
     end;
  end;
end;

procedure TMastData.OrdersCustNoChange(Sender: TField);
var
  TaxRate: Variant;
begin
  OrdersShipToContact.Value := '';
  OrdersShipToPhone.Value := '';
  OrdersShipToAddr1.Value := '';
  OrdersShipToAddr2.Value := '';
  OrdersShipToCity.Value := '';
  OrdersShipToState.Value := '';
  OrdersShipToZip.Value := '';
  OrdersShipToCountry.Value := '';
  TaxRate := Cust.Lookup('CustNo', OrdersCustNo.Value, 'TaxRate');
  if not VarIsNull(TaxRate) then
    OrdersTaxRate.Value := TaxRate;
end;

{ Alternatively, could set the Qty field's Min and Max values in code
  or in the Object Inspector. }

procedure TMastData.ItemsQtyValidate(Sender: TField);
begin
{if (ItemsPartNo.Value <> Item) then
     begin
     ItemsQty.Value := 1;
     X := 0;
    end;
 }   
{
if Parts.Locate('PartNO', ItemsPartNo.Value, []) then
       begin
       PInStore := PartsInStores.Value;
       ItemsInStores.Value := PartsInStores.Value;
       end;
 }
if ItemsQty.Value > PartsInStores.Value then
   begin
    raise Exception.Create('Must specify Valid quantity');
    ItemsQty.Value := Vor;
   end;

if ItemsQty.Value < 1 then
   begin
    raise Exception.Create('Must Valid specify quantity');
    ItemsQty.Value := Vor;
   end;

if (ItemsQty.Value < ItemsInStores.Value) and (ItemsQty.Value > 1) then
    Zero := 0;
end;

{ Alternatively, could set the Freight field's Min and Max values in code
  or in the Object Inspector. }

procedure TMastData.OrdersFreightValidate(Sender: TField);
begin
  if OrdersFreight.Value < 0 then
    raise Exception.Create('Freight cannot be less than zero');
end;

procedure TMastData.ItemsPartNoValidate(Sender: TField);
begin
  if not Parts.Locate('PartNo', ItemsPartNo.Value, []) then
    raise Exception.Create('You must specify a valid PartNo');
end;

procedure TMastData.OrdersSaleDateValidate(Sender: TField);
begin
  if OrdersSaleDate.Value > Now then
    raise Exception.Create('Cannot enter a future date');
end;

{ Browse Customers }

procedure TMastData.CustBeforeOpen(DataSet: TDataSet);
begin
  OrdByCust.Open;
end;

procedure TMastData.OrdByCustCalcFields(DataSet: TDataSet);
begin
  OrdByCustAmountDue.Value := OrdByCustItemsTotal.Value +
    OrdByCustItemsTotal.Value * OrdByCustTaxRate.Value / 100 +
    OrdByCustFreight.Value - OrdByCustAmountPaid.Value;
end;

{ Get the next available customer number from the NextCust table }

procedure TMastData.CustBeforePost(DataSet: TDataSet);
begin
  if Cust.State = dsInsert then
    with NextCust do
    begin
      Open;
      try
        Edit;
        CustCustNo.Value := NextCustNewCust.Value;
        NextCustNewCust.Value := NextCustNewCust.Value + 1;
        Post;
      finally
        Close;
      end;
    end;
end;

function TMastData.DataSetApplyUpdates(DataSet: TDataSet; Apply: Boolean): Boolean;
begin
  Result := True;
  with TDBDataSet(DataSet) do
  begin
    if (State in dsEditModes) or UpdatesPending then
    begin
      if Apply then
      begin
        Database.ApplyUpdates([DataSet as TDBDataSet]);
       { Always call CancelUpdates to remove any discard changes }
        CancelUpdates;
      end
      else
      begin
        if (MessageDlg('Unsaved changes, exit anyway?', mtConfirmation,
          [mbYes, mbCancel], 0) = mrYes) then
          CancelUpdates
        else
          Result := False;
      end;
    end;
  end;
end;

{ Determine the next available ItemNo for this order }

procedure TMastData.OrdersBeforeEdit(DataSet: TDataSet);
begin
  LastItemQuery.Close;
  LastItemQuery.Open;
  { SQL servers return Null for some aggregates if no items are present }
  with LastItemQuery.Fields[0] do
    if IsNull then FItemNo := 1
    else FItemNo := AsInteger + 1;
end;

procedure TMastData.EditUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
var
  Key: Variant;
const
  UpdErrMsg = '%s.'#13#10'Discard the edits to %S %S and continue updating?';
begin
  if UpdateKind = ukDelete then
    Key := Dataset.Fields[0].OldValue else
    Key := Dataset.Fields[0].NewValue;
  if MessageDlg(Format(UpdErrMsg, [E.Message, DataSet.Fields[0].DisplayLabel, Key]),
    mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
    UpdateAction := uaSkip else
    UpdateAction := uaAbort;
end;

procedure TMastData.SubItemAfterDelete(DataSet: TDataSet);
begin

  Parts.Edit;
  PartsInStores.Value := PartsInStores.Value - Add;
  UpdateTotals2;
  y := 2;

end;

procedure TMastData.SubItemAfterPost(DataSet: TDataSet);

 { Reduce/increase Parts table's OnOrder field }


  procedure UpdateParts(PartNo: String; Qty : Longint);
  begin
    if  (Qty <> 0) then  //(PartNo > '0') and
    try
      if not Parts.Locate('PartNo', PartNo, []) then Abort;

     { if ItemsInstores.Value < Qty then
      begin
      raise Exception.Create('Must specify Valid Value "less than Which in Stores"');
      Abort;
      end; }

      Parts.Edit;
      PartsOnOrder.Value := PartsOnOrder.Value + Qty;

      if (Y <> 3)then
          PartsInStores.Value := SubItemsInStores.Value
      else
         PartsInStores.Value := PartsInStores.Value - Add;
      Y := 2;
      Parts.Post;
    except
      on E: Exception do
        ShowMessage(Format('Error updating parts table for PartNo: %s', [PartNo]));
    end;
  end;
 
begin
  { Maintain next available item number }
  Y := 2;
  Inc(FItemNo);
  UpdateTotals2;
  if not ((PrevPartNo = SubItemsPartNo.Value) and (PrevQty = SubItemsQty.Value)) then
  begin
   { Reduce previous Part#'s OnOrder field by previous Qty }
    UpdateParts(PrevPartNo, -PrevQty);
   { Increase new Part#'s OnOrder field by previous Qty }
    UpdateParts(SubItemsPartNo.Value, SubItemsQty.Value);
  end;
end;

procedure TMastData.SubItemBeforeDelete(DataSet: TDataSet);
begin
 Imports.Edit;
end;

procedure TMastData.SubItemBeforeEdit(DataSet: TDataSet);
begin
  Item := SubItemsPartNo.Value;
  PInStore := PartsInStores.Value;

  if (Zero = 0) then
     begin
      Vor := SubItemsQty.Value;
      Zero := Zero + 1;
     end;
  Add := Vor;

  //Add := SubItemsQty.Value;
  Imports.Edit;
  PrevPartNo := SubItemsPartNo.Value;
  PrevQty := SubItemsQty.Value;

end;

procedure TMastData.SubItemBeforeInsert(DataSet: TDataSet);
begin
Imports.Edit;
end;

procedure TMastData.SubItemBeforeOpen(DataSet: TDataSet);
begin
Parts.Open;
end;

procedure TMastData.SubItemBeforePost(DataSet: TDataSet);
begin

  PInStore := PartsInStores.Value;
  
  if (SubItemsQty.Value <> Add) and (Y<>0) then
    if (SubItemsQty.Value > Add)then
        begin
        Add := SubItemsQty.Value - Add;
        SubItemsInStores.Value := PartsInStores.Value + Add;
        Y := 1;
        end
    else
      if (SubItemsQty.Value < Add)then
        begin
        Add := Add - SubItemsQty.Value;
        SubItemsInStores.Value := PartsInStores.Value - Add;
        Y := 4;
        end
      else
         if (Y = 3)then
            SubItemsInStores.Value := SubItemsInStores.Value - SubItemsQty.Value;


  if (Length(SubItemsOpDate.AsString) <= 1) then
      SubItemsOpDate.Value := ImportsSaleDate.Value;

  //else
  if (Length(SubItemsExpDate.AsString) <= 1) then
      SubItemsExpDate.Value := PartsExpDate.Value;

  SubItemsQtyUnit.Value := PartsUnit.Value;

  if (Length(SubItemsCompany.AsString) <= 1) then
  if Provider.Locate('ProvNo', ImportsProvNo.Value, []) then
     SubItemsCompany.Value := ProviderCompany.Value;

  if (Y = 0) then
      SubItemsInStores.Value := PartsInStores.Value + SubItemsQty.Value; 

  Y := 2;
  Add := 0;
  Zero := 0;
  SubItemsItemNo.Value := FItemNo;
 // SubItemsCompany.Value := ProviderCompany.Value;
end;

procedure TMastData.SubItemCalcFields(DataSet: TDataSet);
begin
SubItemsExtPrice.Value := SubItemsQty.Value *
    SubItemsSellPrice.Value * (100 - SubItemsDiscount.Value) / 100;
end;

procedure TMastData.SubItemNewRecord(DataSet: TDataSet);
begin
  PrevPartNo := '0';
  PrevQty := 0;
  SubItemsImportNo.Value := ImportsImportNo.Value;
  SubItemsQty.Value := 1;
  SubItemsDiscount.Value := 0;
end;

procedure TMastData.ImportsAfterCancel(DataSet: TDataSet);
begin
  Provider.CancelUpdates;
  Parts.CancelUpdates;
  SubItems.CancelUpdates;
  Imports.CancelUpdates;
end;

procedure TMastData.ImpoByProvCalcFields(DataSet: TDataSet);
begin
    ImpoByProvAmountDue.Value := ImpoByProvItemsTotal.Value +
    ImpoByProvItemsTotal.Value * ImpoByProvTaxRate.Value / 100 +
    ImpoByProvFreight.Value - ImpoByProvAmountPaid.Value;
end;

procedure TMastData.ImportsAfterDelete(DataSet: TDataSet);
begin
Database.ApplyUpdates([Provider, Parts, SubItems, Imports]);
end;

procedure TMastData.ImportsAfterPost(DataSet: TDataSet);
begin
  if Provider.Locate('ProvNo', ImportsProvNo.Value, []) and
    (ProviderLastInvoiceDate.Value < ImportsShipDate.Value) then
  begin
    Provider.Edit;
    ProviderLastInvoiceDate.Value := ImportsShipDate.Value;
    Provider.Post;
  end;
  Database.ApplyUpdates([Imports, SubItems, Parts, Provider]);
end;

procedure TMastData.ImportsBeforeCancel(DataSet: TDataSet);
begin
 if (Imports.State = dsInsert) and not (SubItems.BOF and SubItems.EOF) then
    if not Confirm('Cancel order being inserted and delete all line items?') then
      Abort;
end;

procedure TMastData.ImportsBeforeClose(DataSet: TDataSet);
begin
  SubItems.Close;
  Emps.Close;
  ProvByImpo.Close;
end;

procedure TMastData.ImportsBeforeDelete(DataSet: TDataSet);
begin
 if not Confirm('Delete Imports and line items?') then
    Abort
  else
    DeleteItems;
end;

procedure TMastData.ProviderBeforeOpen(DataSet: TDataSet);
begin
ImpoByProv.Open;
end;

procedure TMastData.ProviderBeforePost(DataSet: TDataSet);
begin
  if Provider.State = dsInsert then
    with NextProv do
    begin
      Open;
      try
        Edit;
        ProviderProvNo.Value := NextProvNewProv.Value;
        NextProvNewProv.Value := NextProvNewProv.Value + 1;
        Post;
      finally
        Close;
      end;
    end;
end;

procedure TMastData.ImportsBeforeEdit(DataSet: TDataSet);
begin
 LastSubItemQuery.Close;
  LastSubItemQuery.Open;
  { SQL servers return Null for some aggregates if no items are present }
  with LastSubItemQuery.Fields[0] do
    if IsNull then FItemNo := 1
    else FItemNo := AsInteger + 1;
end;

procedure TMastData.ImportsBeforeInsert(DataSet: TDataSet);
begin
  if Imports.State in dsEditModes then
  begin
    if Confirm('An order is being processed.  Save changes and start a new one?') then
      Imports.Post
    else
      Abort;
  end;
  FItemNo := 1;
end;

procedure TMastData.ImportsBeforeOpen(DataSet: TDataSet);
begin
  ProvByComp.Open;
  ProvByImpo.Open;
  Provider.Open;
  Emprs.Open;
  SubItems.Open;
  Parts.Open;
end;

procedure TMastData.ImportsCalcFields(DataSet: TDataSet);
begin
 ImportsTaxTotal.Value := ImportsItemsTotal.Value * (ImportsTaxRate.Value / 100);
  ImportsAmountDue.Value := ImportsItemsTotal.Value + ImportsTaxTotal.Value +
    ImportsFreight.Value - ImportsAmountPaid.Value;
end;

procedure TMastData.ImportsNewRecord(DataSet: TDataSet);
begin

  { Get the Next Order Value from the NextOrd Table }

  with NextImport do
  begin
    Open;
    try
      Edit;
      ImportsImportNo.Value := NextImportNewKey.Value;
      NextImportNewKey.Value := NextImportNewKey.Value + 1;
      Post;
    finally
      Close;
    end;
  end;
  ImportsSaleDate.Value := Date;
  ImportsShipVia.Value := 'Camion';
  ImportsTerms.Value := 'None';
  ImportsPaymentMethod.Value := 'Check';
  ImportsItemsTotal.Value := 0;
  ImportsTaxRate.Value := 0;
  ImportsFreight.Value := 0;
  ImportsAmountPaid.Value := 0;
end;

procedure TMastData.SubItemQtyValidate(Sender: TField);
begin
if SubItemsQty.Value < 1 then
    raise Exception.Create('Must specify quantity');
end;

procedure TMastData.SubItemPartNoValidate(Sender: TField);
begin
 if not Parts.Locate('PartNo', SubItemsPartNo.Value, []) then
    raise Exception.Create('You must specify a valid PartNo');
end;

procedure TMastData.EmprsCalcFields(DataSet: TDataSet);
begin
EmprsFullName.Value := Format('%s, %s', [EmprsLastName.Value, EmprsFirstName.Value]);
end;

procedure TMastData.DataModuleCreate(Sender: TObject);
begin
PartsPartNo.ValidChars:=['-','0','1','2','3','4','5','6','7','8','9','_','/','*'];
X :=2;
Y :=2;
Zero :=0;
end;

procedure TMastData.SubItemsAfterOpen(DataSet: TDataSet);
begin
Y := 2;
end;

procedure TMastData.SubItemsAfterInsert(DataSet: TDataSet);
begin
Y:=0;
end;

procedure TMastData.SubItemsBeforeDelete(DataSet: TDataSet);
begin

   Add := SubItemsQty.Value;
   Y := 3;
   Imports.Edit;

end;

procedure TMastData.ItemsAfterEdit(DataSet: TDataSet);
begin

//if Parts.Locate('PartNO', ItemsPartNo.Value, []) then
       PInStore := PartsInStores.Value;
 if (x <> 0)
     then X := 1;
     ItemsInStores.Value := PInStore;
end;

procedure TMastData.ItemsAfterInsert(DataSet: TDataSet);
begin
x:=0;
end;

procedure TMastData.ItemsBeforeDelete(DataSet: TDataSet);
begin
   Sub := ItemsQty.Value;
   X := 3;
   Orders.Edit;
end;

procedure TMastData.SubItemsAfterEdit(DataSet: TDataSet);
begin
//if Parts.Locate('PartNO', SubItemsPartNo.Value, []) then
       PInStore := PartsInStores.Value;

 if (Y = 0) then
    SubItemsInStores.Value := PartsInStores.Value + 1
 else
    SubItemsInStores.Value := PartsInStores.Value;
 if (Y <> 0)
     then Y := 1;

    SubItemsInStores.Value := PInStore;
end;

procedure TMastData.SubItemsBeforeInsert(DataSet: TDataSet);
begin
 Imports.Edit;
end;

procedure TMastData.SubItemsQtyValidate(Sender: TField);
begin

if SubItemsQty.Value < 1 then
       raise Exception.Create('Must Valid specify quantity');

//if (SubItemsQty.Value < SubItemsInStores.Value) and (SubItemsQty.Value > 1) then
  //  Zero := 0;
end;

procedure TMastData.PartsBeforePost(DataSet: TDataSet);
begin
//if ItemsInstores.Value < 0 then
  //  raise Exception.Create('Must specify Valid Value "less than Which in Stores"');
end;

procedure TMastData.DPartsUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
var
  Key: Variant;
const
  UpdErrMsg = '%s.'#13#10'Discard the edits to %S %S and continue updating?';
begin
  if UpdateKind = ukDelete then
    Key := Dataset.Fields[0].OldValue else
    Key := Dataset.Fields[0].NewValue;
  if MessageDlg(Format(UpdErrMsg, [E.Message, DataSet.Fields[0].DisplayLabel, Key]),
    mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
    UpdateAction := uaSkip else
    UpdateAction := uaAbort;
end;

procedure TMastData.PartsAfterPost(DataSet: TDataSet);
begin
//dParts.Open;
if not dParts.Locate('ItemN0', PartsPartNo.Value, []) then
 begin
 dParts.Insert;
 dPartsItemN0.Value := PartsPartNo.Value ;
 dPartsdescription.Value := Partsdescription.Value ;
 dpartsCompName.Value := PartsCompName.Value ;
 dPartsCommName.Value := PartsCommName.Value ;
 dPartsUprice.Value := PartsListPrice.Value ;
 dPartsExpDate.Value := PartsExpDate.Value ;
 dPartsUnit.Value := PartsUnit.Value ;
 dParts.Post;
 end;

end;

procedure TMastData.PartsBeforeDelete(DataSet: TDataSet);
begin
dParts.Open;
if dParts.Locate('ItemN0', PartsPartNo.Value, []) then
   dParts.delete;
end;

procedure TMastData.ItemsExpDateValidate(Sender: TField);
begin
if ItemsExpDate.Value <= Now then
 raise Exception.Create('Sorry Its Allready Expired');
end;

procedure TMastData.SubItemsExpDateValidate(Sender: TField);
begin
if (PartsExpDate.Value <= now) then
      Showmessage('Sorry Its allready Expired');
end;

procedure TMastData.PartsInStoresValidate(Sender: TField);
begin
if PartsInStores.Value < 0 then
      raise Exception.Create('Must Valid specify quantity');
end;

procedure TMastData.ItemsPartNoChange(Sender: TField);
begin
 if (ItemsPartNo.Value <> Item) then
    begin
     ItemsQty.Value := 1;
     X := 0;
    end;
end;

procedure TMastData.SubItemsPartNoChange(Sender: TField);
begin
 if (SubItemsPartNo.Value <> Item) then
    begin
     SubItemsQty.Value := 1;
     X := 0;
    end;
end;

end.

