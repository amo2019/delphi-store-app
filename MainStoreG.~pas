unit MainStoreG;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TBrMainSForm = class(TForm)
    CtrlsPanel: TPanel;
    Navigator: TDBNavigator;
    OrdersPanel: TPanel;
    Bevel1: TBevel;
    DefineBtn: TSpeedButton;
    ActivateBtn: TSpeedButton;
    PartSrc: TDataSource;
    SubSrc: TDataSource;
    ItemSrc: TDataSource;
    SubIT: TTable;
    ItemsT: TTable;
    PartsT: TTable;
    BtnPanel: TPanel;
    ModeIndicator: TLabel;
    CloseBtn: TSpeedButton;
    SItemsGrid: TDBGrid;
    PartsGrid: TDBGrid;
    ItemsGrid: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure CustGridEnter(Sender: TObject);
    procedure SetQuery(Sender: TObject);
    procedure ActivateQuery(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure OrdersGridEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ItemsGridDblClick(Sender: TObject);
    procedure SItemsGridDblClick(Sender: TObject);
    procedure PartsGridDblClick(Sender: TObject);
    procedure PartsGridEnter(Sender: TObject);
    procedure ItemsGridEnter(Sender: TObject);
    procedure SItemsGridEnter(Sender: TObject);
  private
    FActiveSource: TDataSource;
    function GetCustNo: Double;
    function GetOrderNo: Double;
    procedure SetActiveSource(DataSource: TDataSource);
    procedure SetCustNo(NewCustNo: Double);
    procedure SetOrderNo(NewOrderNo: Double);
    property ActiveSource: TDataSource read FActiveSource write SetActiveSource;
  public
    property CustNo: Double read GetCustNo write SetCustNo;
    property OrderNo: Double read GetOrderNo write SetOrderNo;
  end;

var
  BrMainSForm: TBrMainSForm;

implementation

uses QryCust, EdCust, EdOrders, Main, DataMod;

{$R *.dfm}

{ Retrieve from active customer table or query--whichever is active }

function TBrMainSForm.GetCustNo: Double;
begin
  Result := MastData.CustMasterSrc.Dataset.Fields[0].AsFloat;
end;

procedure TBrMainSForm.SetCustNo(NewCustNo: Double);
begin
  MastData.CustMasterSrc.Dataset := MastData.Cust;
  MastData.Cust.Locate('CustNo', NewCustNo, []);
end;

function TBrMainSForm.GetOrderNo: Double;
begin
  Result := MastData.OrdByCustOrderNo.Value;
end;

procedure TBrMainSForm.SetOrderNo(NewOrderNo: Double);
begin
  MastData.OrdByCust.Locate('OrderNo', NewOrderNo, []);
end;

procedure TBrMainSForm.SetActiveSource(DataSource: TDataSource);
begin
  FActiveSource := DataSource;
  Navigator.DataSource := FActiveSource;
end;

procedure TBrMainSForm.CustGridEnter(Sender: TObject);
begin
{  ActiveSource := MastData.CustMasterSrc;
  CustGrid.Options := CustGrid.Options + [dgAlwaysShowSelection];
  OrdersGrid.Options := OrdersGrid.Options - [dgAlwaysShowSelection];}
end;

procedure TBrMainSForm.OrdersGridEnter(Sender: TObject);
begin
{ ActiveSource := MastData.OrdByCustSrc;
  OrdersGrid.Options := OrdersGrid.Options + [dgAlwaysShowSelection];
  CustGrid.Options := CustGrid.Options - [dgAlwaysShowSelection];}
end;

procedure TBrMainSForm.SetQuery(Sender: TObject);
begin
  if QueryCustDlg.ShowModal = mrOK then
    ActivateQuery(Self);
end;

procedure TBrMainSForm.ActivateQuery(Sender: TObject);
begin
  if not ActivateBtn.Down then
    MastData.CustMasterSrc.Dataset := MastData.Cust
  else
    with MastData.CustQuery do
    try
      Close;
      Params[0].AsDatetime := QueryCustDlg.FromDate;
      Params[1].AsDatetime := QueryCustDlg.ToDate;
      Open;
      { Any records in the result set? }
      if BOF and EOF then Abort;
      MastData.CustMasterSrc.Dataset := MastData.CustQuery;
    except
      MastData.CustMasterSrc.Dataset := MastData.Cust;
      ActivateBtn.Down := false;
      ShowMessage('No matching records in the specified date range.');
    end;
end;

procedure TBrMainSForm.EditBtnClick(Sender: TObject);
var
  F: TFloatField;
begin
  F := ActiveSource.Dataset.Fields[0] as TFloatField;
  if ActiveSource = MastData.CustMasterSrc then
    EdCustForm.Edit(F.Value)
  else
  begin
    EdOrderForm.Edit(F.Value);
    ActiveSource.Dataset.Refresh;
  end;
end;

procedure TBrMainSForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TBrMainSForm.FormShow(Sender: TObject);
begin
  MastData.Cust.Open;
  MastData.Cust.First;
end;

procedure TBrMainSForm.ItemsGridDblClick(Sender: TObject);
begin
 //ActiveSource := ItemSrc;
end;

procedure TBrMainSForm.SItemsGridDblClick(Sender: TObject);
begin
 //ActiveSource := SubSrc;
end;

procedure TBrMainSForm.PartsGridDblClick(Sender: TObject);
begin
 //ActiveSource := PartSrc;
end;

procedure TBrMainSForm.PartsGridEnter(Sender: TObject);
begin
ActiveSource := PartSrc;
end;

procedure TBrMainSForm.ItemsGridEnter(Sender: TObject);
begin
ActiveSource := ItemSrc;
end;

procedure TBrMainSForm.SItemsGridEnter(Sender: TObject);
begin
ActiveSource := SubSrc;
end;

end.
