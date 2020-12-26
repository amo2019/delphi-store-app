unit OrderRpt2;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, DBTables, DB;

type
  TMasterByDateReport = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape5: TQRShape;
    FromToHeading: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroupCust: TQRGroup;
    QRSubDetailOrders: TQRSubDetail;
    QuickRepSD: TQRSubDetail;
    QRDBOrderNo: TQRDBText;
    QRDBSalesDate: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    GroupFooterBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    Parts: TTable;
    PartsPartNo: TStringField;
    PartsDescription: TStringField;
    PartsVendorNo: TFloatField;
    PartsOnHand: TFloatField;
    PartsOnOrder: TFloatField;
    PartsBackOrd: TBooleanField;
    PartsCost: TCurrencyField;
    PartsListPrice: TCurrencyField;
    PartsOrderNo: TIntegerField;
    PartsUnit: TStringField;
    PartsEXpDate: TDateField;
    PartsInStores: TFloatField;
    PartsDSrc: TDataSource;
    ItemSrc: TDataSource;
    ItemQ: TTable;
    ItemQOrderNo: TFloatField;
    ItemQItemNo: TFloatField;
    ItemQOpDate: TDateField;
    ItemQPartNo: TStringField;
    ItemQQty: TIntegerField;
    ItemQDiscount: TFloatField;
    ItemQQtyUnit: TStringField;
    ItemQNotes: TStringField;
    ItemQInStores: TFloatField;
    ItemQCompany: TStringField;
    ItemQCounter: TIntegerField;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    ItemQSum: TIntegerField;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
  private

  public

  end;

var
  MasterByDateReport: TMasterByDateReport;

implementation

{$R *.dfm}

end.
