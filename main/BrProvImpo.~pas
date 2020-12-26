unit BrProvImpo;

interface

uses
  SysUtils, Windows, mmsystem, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TBrProvImpForm = class(TForm)
    CtrlsPanel: TPanel;
    Navigator: TDBNavigator;
    BtnPanel: TPanel;
    ActivateBtn: TSpeedButton;
    DefineBtn: TSpeedButton;
    CustPanel: TPanel;
    ProvGrid: TDBGrid;
    OrdersPanel: TPanel;
    ImportsGrid: TDBGrid;
    Bevel1: TBevel;
    CloseBtn: TSpeedButton;
    EditBtn: TSpeedButton;
    procedure ProvGridEnter(Sender: TObject);
    procedure SetQuery(Sender: TObject);
    procedure ActivateQuery(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure ImportsGridEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  BrProvImpForm: TBrProvImpForm;

implementation

uses QryCust, EdCust, EdOrders, Main, DataMod, EDImports, EdProv;

{$R *.dfm}

{ Retrieve from active customer table or query--whichever is active }

function TBrProvImpForm.GetCustNo: Double;
begin
  Result := MastData.CustMasterSrc.Dataset.Fields[0].AsFloat;
end;

procedure TBrProvImpForm.SetCustNo(NewCustNo: Double);
begin
  MastData.CustMasterSrc.Dataset := MastData.Cust;
  MastData.Cust.Locate('CustNo', NewCustNo, []);
end;

function TBrProvImpForm.GetOrderNo: Double;
begin
  Result := MastData.OrdByCustOrderNo.Value;
end;

procedure TBrProvImpForm.SetOrderNo(NewOrderNo: Double);
begin
  MastData.OrdByCust.Locate('OrderNo', NewOrderNo, []);
end;

procedure TBrProvImpForm.SetActiveSource(DataSource: TDataSource);
begin
  FActiveSource := DataSource;
  Navigator.DataSource := FActiveSource;
end;

procedure TBrProvImpForm.ProvGridEnter(Sender: TObject);
begin
  ActiveSource := MastData.ProvMasterSrc;
  ProvGrid.Options := ProvGrid.Options + [dgAlwaysShowSelection];
  ImportsGrid.Options := ImportsGrid.Options - [dgAlwaysShowSelection];
end;

procedure TBrProvImpForm.ImportsGridEnter(Sender: TObject);
begin
  ActiveSource := MastData.ImpoByProvSrc;
  ImportsGrid.Options := ImportsGrid.Options + [dgAlwaysShowSelection];
  ProvGrid.Options := ProvGrid.Options - [dgAlwaysShowSelection];
end;

procedure TBrProvImpForm.SetQuery(Sender: TObject);
begin
  if QueryCustDlg.ShowModal = mrOK then
    ActivateQuery(Self);
end;

procedure TBrProvImpForm.ActivateQuery(Sender: TObject);
begin
  if not ActivateBtn.Down then
    MastData.ProvMasterSrc.Dataset := MastData.Provider
  else
    with MastData.ProvQuery do
    try
      Close;
      Params[0].AsDatetime := QueryCustDlg.FromDate;
      Params[1].AsDatetime := QueryCustDlg.ToDate;
      Open;
      { Any records in the result set? }
      if BOF and EOF then Abort;
      MastData.ProvMasterSrc.Dataset := MastData.ProvQuery;
    except
      MastData.ProvMasterSrc.Dataset := MastData.Provider;
      ActivateBtn.Down := false;
      ShowMessage('No matching records in the specified date range.');
    end;
end;

procedure TBrProvImpForm.EditBtnClick(Sender: TObject);
var
  F: TFloatField;
begin
  F := ActiveSource.Dataset.Fields[0] as TFloatField;
  if ActiveSource = MastData.ProvMasterSrc then
    EdProvForm.Edit(F.Value)
  else
  begin
    EdImportForm.Edit(F.Value);
    ActiveSource.Dataset.Refresh;
  end;
end;

procedure TBrProvImpForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TBrProvImpForm.FormShow(Sender: TObject);
begin
  MastData.Cust.Open;
  MastData.Cust.First;
end;

end.
