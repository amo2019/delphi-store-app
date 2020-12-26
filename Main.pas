{
                     MastApp Main Window.

  By default, the database component's alias is DBDEMOS, and so the
  application accesses the Paradox tables. You can upsize the
  application to use Local InterBase data by choosing View | Remote
  Data from the application's main menu.  For this to work, however,
  the Local InterBase Server must be running.  The application checks
  for this and raises an exception if there's a problem.

  The application also creates the MASTSQL alias if it doesn't
  already exist.  This code for this appears in the MastData module.

}

unit Main;

interface

uses
  SysUtils, Windows, mmsystem, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls, Menus, ExtCtrls, DB, DBTables,
  ComCtrls, TeEngine, Series, TeeProcs, Chart;

type
  TDateOrder = (doMDY, doDMY, doYMD);

  TMainForm = class(TForm)
    MainPanel: TPanel;
    PrinterSetup: TPrinterSetupDialog;
    OrderBtn: TSpeedButton;
    BrowseBtn: TSpeedButton;
    PartsBtn: TSpeedButton;
    CloseBtn: TSpeedButton;
    ReportBtn: TSpeedButton;
    HelpBtn: TSpeedButton;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FilePrinterSetup: TMenuItem;
    FileExit: TMenuItem;
    FileNewOrder: TMenuItem;
    FilePrintReport: TMenuItem;
    PrintCustList: TMenuItem;
    PrintOrders: TMenuItem;
    PrintInvoice: TMenuItem;
    ViewMenu: TMenuItem;
    ViewOrders: TMenuItem;
    ViewPartsInventory: TMenuItem;
    ViewStayOnTop: TMenuItem;
    ViewLocal: TMenuItem;
    ViewRemote: TMenuItem;
    HelpMenu: TMenuItem;
    HelpAbout: TMenuItem;
    HelpContents: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Chart2: TChart;
    Label13: TLabel;
    Label14: TLabel;
    FastLineSeries1: TFastLineSeries;
    FastLineSeries2: TFastLineSeries;
    Series1: TFastLineSeries;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    MStoresRec1: TMenuItem;
    PassWordChange1: TMenuItem;
    ChangeIt1: TMenuItem;
    NewImports1: TMenuItem;
    Imports1: TMenuItem;
    Order1: TMenuItem;
    Import1: TMenuItem;
    procedure BrowseCustOrd(Sender: TObject);
    procedure CloseApp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BrowseParts(Sender: TObject);
    procedure ToggleStayonTop(Sender: TObject);
    procedure NewOrder(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
    procedure PrinterSetupClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ReportBtnClick(Sender: TObject);
    procedure OrderReport(Sender: TObject);
    procedure CustomerReport(Sender: TObject);
    procedure InvoiceReport(Sender: TObject);
    procedure MasterReport(Sender: TObject);
    procedure ViewLocalClick(Sender: TObject);
    procedure ViewRemoteClick(Sender: TObject);
    procedure ViewMenuClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CloseBtnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChangeIt1Click(Sender: TObject);
    procedure NewImports1Click(Sender: TObject);
    procedure Imports1Click(Sender: TObject);
    procedure Order1Click(Sender: TObject);
    procedure Import1Click(Sender: TObject);
    procedure Chart2Click(Sender: TObject);
  private
    procedure PrintOrderReport(Preview: Boolean);
    procedure PrintInvoiceReport(Preview: Boolean);
    procedure PrintCustomerReport(Preview: Boolean);
    procedure PrintMasterReport(Preview: Boolean);
    procedure PrintCustItemsReport(Preview: Boolean);
    procedure PrintCustOrdersReport(Preview: Boolean);
    procedure CloseAllWindows;
    procedure UpdateRSConnect(const Dbpath:string);
    procedure InitRSRUN;
  public
    { Public declarations }
    Procedure ShowForm(AFormClass:TFormClass);
  end;

var
  MainForm: TMainForm;

implementation

uses
   DataMod,  { Data Module }
   BrCstOrd, { The Browse Orders by Customer form }
   BrParts,  { The Browse Parts form }
   EdOrders, { The Edit Orders form }
   QryCust,  { The Specify Date Range form }
   PickRep,  { The Report Selection form }
   About,    { The About dialog box }
   IniFiles, { Delphi Unit for INI file support }
   CustRpt,  { The customer by invoice report }
   OrderRpt, { The orders by ship date report }
   InvcRpt,  { The invoice report }
   PickInvc, OrderRpt2, EDImports, BrProvImpo, BrMastStore, mdrpt,
   MainStoreG, Pssword, PssChng, Manygrp, Md, linked; { The invoice number selection dialog }

{$R *.dfm}

function GetDateOrder(const DateFormat: string): TDateOrder;
var
  I: Integer;
begin
  Result := doMDY;
  I := 1;
  while I <= Length(DateFormat) do
  begin
    case Chr(Ord(DateFormat[I]) and $DF) of
      'Y': Result := doYMD;
      'M': Result := doMDY;
      'D': Result := doDMY;
    else
      Inc(I);
      Continue;
    end;
    Exit;
  end;
  Result := doMDY;
end;

procedure TMainForm.BrowseCustOrd(Sender: TObject);
begin
  case GetDateOrder(ShortDateFormat) of
    doYMD: ShortDateFormat := 'yy/mm/dd';
    doMDY: ShortDateFormat := 'mm/dd/yy';
    doDMY: ShortDateFormat := 'dd/mm/yy';
  end;
  BrCustOrdForm.Show;
end;

Procedure TMainForm.ShowForm(AFormClass:TFormClass);
Begin
  With AFormClass.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
End;

Procedure ShowNeedsBDE;
Begin
  ShowMessage('Needs the Borland Database Engine.'+#13+#10+
              'Please email to get the full TeeChart DEMO.');
end;

procedure TMainForm.CloseApp(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.UpdateRSConnect(const Dbpath: string);
const
  TiniFilename = 'RPTSMITH.CON';   {ReportSmith connections file}
  AppConTitle = 'MASTAPP';
  SQLConTitle = 'MASTSQL';
  ConnectNamesSection = 'ConnectNamesSection';
  ConnectNamesKey = 'ConnectNames';
  MASTAPPSection = 'MASTAPP';
  MASTSQLSection = 'MASTSQL';
  TypeKey = 'Type';
  ServerKey = 'Server';
  SQLTypeVal = 67;
  SQLServerVal = 'MASTSQL';
  SQLDataFilePathKey = 'Database';
  SQLUseridKey = 'USERID';
  SQLUseridVal = 'SYSDBA';
  TypeVal = 61;
  ServerVal = 'PARADOX';
  DataFilePathKey = 'DataFilePath';
var
  TempStr: string;
  RSCON: TIniFile;
begin
 { the ReportSmith CON file is actually an INI file -- assumes in win dir}
  RSCon := TIniFile.Create(TiniFilename);
  TempStr := RSCon.ReadString(ConnectNamesSection, ConnectNamesKey, '');
  { CON file contents differs for SQL connections }
  if MastData.Database.IsSQLBased then
  begin
    if AnsiPos(SQLConTitle,TempStr) = 0 then
    begin
      if TempStr <> '' then
        TempStr := TempStr + ',';
      RSCon.WriteString(ConnectNamesSection, ConnectNamesKey, TempStr+SQLConTitle);
    end;
    RSCon.WriteInteger(MASTSQLSection, TypeKey, SQLTypeVal);
    RSCon.WriteString(MASTSQLSection, SQLDataFilePathKey, DBpath);
    RSCon.WriteString(MASTSQLSection, ServerKey, SQLServerVal);
    RSCon.WriteString(MASTSQLSection, SQLUseridKey, SQLUseridVal);
  end
  else
  begin
    if AnsiPos(AppConTitle,TempStr) = 0 then
    begin
      if TempStr <> '' then
        TempStr := TempStr + ',';
      RSCon.WriteString(ConnectNamesSection, ConnectNamesKey, TempStr+AppConTitle);
    end;
    RSCon.WriteInteger(MASTAPPSection, TypeKey, TypeVal);
    RSCon.WriteString(MASTAPPSection, DataFilePathKey, DBpath);
    RSCon.WriteString(MASTAPPSection, ServerKey, ServerVal);
  end;
  RSCon.Free;
end;

procedure TMainForm.InitRSRUN;
var
  DBPath: string;
  ParamList: TStringList;
begin
  { get the actual location of the database from the alias,
    the path is needed for the reports -- assumes alias is defined }
  ParamList := TStringList.Create;
  try
    Session.GetAliasParams(MastData.Database.AliasName, ParamList);
    if MastData.Database.IsSQLBased then
      DBPath := ParamList.Values['SERVER NAME']
    else
      DBPath := ParamList.Values['PATH'];
  finally
    ParamList.Free;
  end;
  { set up the ReportSmith "connection" identifying the database location }
  UpdateRSConnect(DBPath);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
//-------------------------
 //SplashForm.Close;
 Screen.Cursor :=crHourGlass;
 Application.CreateForm(TPassWordDlg, PassWordDlg);
 Screen.Cursor :=crHandPoint;
 PasswordDlg.Show;
//-------------------------
  ClientWidth := CloseBtn.Left + CloseBtn.Width + 1;
  ClientHeight := CloseBtn.Top + CloseBtn.Height + StatusBar1.Height + Chart2.Height;
  MainPanel.Align := alClient;
  { position the form at the top of display }
  Left := 0;
  Top := 0;
  FastLineSeries1.FillSampleValues(20);
  FastLineSeries2.FillSampleValues(20);
  Series1.FillSampleValues(20);
  
  { initialize ReportSmith }
  InitRSRUN;
end;

procedure TMainForm.BrowseParts(Sender: TObject);
begin
  BrPartsForm.Show;
end;


procedure TMainForm.ToggleStayonTop(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    if Checked then MainForm.FormStyle := fsStayOnTop
    else MainForm.FormStyle := fsNormal;
  end;
end;

procedure TMainForm.NewOrder(Sender: TObject);
begin
  EdOrderForm.Enter;
end;

procedure TMainForm.HelpBtnClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TMainForm.PrinterSetupClick(Sender: TObject);
begin
  PrinterSetup.Execute;
end;

procedure TMainForm.AboutClick(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Application.HelpCommand(HELP_QUIT,0);
end;

procedure TMainForm.CloseAllWindows;
var
  I: Integer;
  F: TForm;
begin
  for I := 0 to Application.ComponentCount - 1 do
  begin
    if Application.Components[I] is TForm then
    begin
      F := TForm(Application.Components[I]);
      if (F <> Self) and (F.Visible) then F.Close;
    end;
  end;
end;

procedure TMainForm.ViewLocalClick(Sender: TObject);
begin
  CloseAllWindows;
  MastData.UseLocalData;
  ViewLocal.Checked := True;
  Caption := Application.Title + ' (Paradox Data)';
end;

procedure TMainForm.ViewRemoteClick(Sender: TObject);
begin
  CloseAllWindows;
  MastData.UseRemoteData;
  ViewRemote.Checked := True;
  Caption := Application.Title + ' (Local Interbase)';
end;

procedure TMainForm.ViewMenuClick(Sender: TObject);
begin
  { Enable the Remote data menu item only if local Interbase is running }
  ViewRemote.Enabled := FindWindow(NIL, 'InterBase Server') <> 0;
end;

procedure TMainForm.ReportBtnClick(Sender: TObject);
begin
  with PickRpt do
  if ShowModal = mrOK then
    Case ReportType.ItemIndex of
      0: PrintCustomerReport( Preview );
      1: PrintOrderReport( Preview );
      2: PrintInvoiceReport( Preview );
      3: PrintMasterReport( Preview );
      4: PrintCustItemsReport( Preview );
      5: PrintCustOrdersReport( Preview );
    end;
end;

procedure TMainForm.PrintCustomerReport(Preview: Boolean);
begin
  with MastData.CustByLastInvQuery do
  begin
    Open;
    if Preview then
       CustomerByInvoiceReport.Preview
    else
       CustomerByInvoiceReport.Print;
    Close;
  end;
end;

procedure TMainForm.PrintMasterReport(Preview: Boolean);
const
  FromToHeading = 'From ''%s'' To ''%s''';
begin
  // Request the 'From' and 'To' dates from the user.

  with QueryCustDlg do
  begin
    MsgLab.Caption := 'Print all Iventury ranging:';
    if FromDate = 0 then FromDate := EncodeDate(2000, 01, 01);
    if ToDate = 0 then ToDate := Now;

    if ShowModal = mrOk then
    with MastData.MasterByDateIQuery do
    begin
      Close;
      PArams.ParamByName('FromDate').AsDate := FromDate;
      PArams.ParamByName('ToDate').AsDate := ToDate;
      Open;

      // Format the From To header with the user's dates entered
      MasterByDateReport.FromToHeading.Caption :=
      Format(FromToHeading, [DateToStr(FromDate), DateToStr(ToDate)]);
    end;

    with MastData.MasterByDateSQuery do
    begin
      Close;
      PArams.ParamByName('FromDate').AsDate := FromDate;
      PArams.ParamByName('ToDate').AsDate := ToDate;
      Open;
    end;

    MastData.ItemSPQ.Open;
    MastData.ItemSPQ.EmptyTable;

    with MastData do
    begin
    ItemSPQ.First;
    MasterByDateIQuery.Open;
    MasterByDateIQuery.First;

    while not MasterByDateIQuery.Eof do
    begin
      ItemSPQ.Insert;
      ItemSPQ.FieldValues['OpDate'] := MasterByDateIQuery.FieldValues['OpDate'];
      ItemSPQ.FieldValues['Company'] := MasterByDateIQuery.FieldValues['Company'];
      ItemSPQ.FieldValues['InStores'] := MasterByDateIQuery.FieldValues['InStores'];
      ItemSPQ.FieldValues['Qty'] := MasterByDateIQuery.FieldValues['Qty'];
      ItemSPQ.FieldValues['Notes'] := MasterByDateIQuery.FieldValues['Notes'];
      ItemSPQ.FieldValues['PartNo'] := MasterByDateIQuery.FieldValues['PartNo'];
      ItemSPQ.FieldValues['QtyUnit'] := MasterByDateIQuery.FieldValues['QtyUnit'];
      ItemSPQ.Post;
     MasterByDateIQuery.Next;
    end;
     MastData.ItemSPQ.ApplyUpdates;
     MastData.ItemSPQ.Close;
     MastData.ItemSPQ.Open;
     MastData.ItemSPQ.Last;
     MasterByDateSQuery.Open;
     MasterByDateSQuery.First;
    while not MasterByDateSQuery.Eof do
    begin
      ItemSPQ.Insert;
      ItemSPQ.FieldValues['OpDate'] := MasterByDateSQuery.FieldValues['OpDate'];
      ItemSPQ.FieldValues['Company'] := MasterByDateSQuery.FieldValues['Company'];
      ItemSPQ.FieldValues['InStores'] := MasterByDateSQuery.FieldValues['InStores'];
      ItemSPQ.FieldValues['Qty'] := MasterByDateSQuery.FieldValues['Qty'];
      ItemSPQ.FieldValues['Notes'] := MasterByDateSQuery.FieldValues['Notes'];
      ItemSPQ.FieldValues['PartNo'] := MasterByDateSQuery.FieldValues['PartNo'];
      ItemSPQ.FieldValues['QtyUnit'] := MasterByDateSQuery.FieldValues['QtyUnit'];
     ItemSPQ.Post;
     MasterByDateSQuery.Next;
    end;
   end;
    MastData.MasterByDateSQuery.Close;
    MastData.MasterByDateIQuery.Close;
    MastData.ItemSPQ.ApplyUpdates;
    MastData.ItemSPQ.Close;
    MastData.ItemSPQ.Open;
    MasterByDateReport.ItemQ.Open;

      if Preview then
         MasterByDateReport.Preview
      else
         MasterByDateReport.Print;
   Close;
  end;
end;

procedure TMainForm.PrintOrderReport(Preview: Boolean);
const
  FromToHeading = 'From ''%s'' To ''%s''';
begin
  // Request the 'From' and 'To' dates from the user.
  with QueryCustDlg do
  begin
    MsgLab.Caption := 'Print all orders ranging:';
    if FromDate = 0 then FromDate := EncodeDate(95, 01, 01);
    if ToDate = 0 then ToDate := Now;

    if ShowModal = mrOk then
    with MastData.OrdersByDateQuery do
    begin
      Close;
      PArams.ParamByName('FromDate').AsDate := FromDate;
      PArams.ParamByName('ToDate').AsDate := ToDate;
      Open;

      // Format the From To header with the user's dates entered
        OrdersByDateReport.FromToHeading.Caption :=
        Format(FromToHeading, [DateToStr(FromDate), DateToStr(ToDate)]);

      if Preview then
         OrdersByDateReport.Preview
      else
         OrdersByDateReport.Print;
      Close;
     end;
   end;
end;

procedure TMainForm.PrintInvoiceReport(Preview: Boolean);
begin
  if PickOrderNoDlg.ShowModal = mrOk then
     if Preview then
        InvoiceByOrderNoReport.Preview
     else
        InvoiceByOrderNoReport.Print;
end;

procedure TMainForm.PrintCustItemsReport(Preview: Boolean);
begin
     if Preview then
        ManyGrpForm.QuickRep.Preview
     else
        ManyGrpForm.QuickRep.Print;
end;

procedure TMainForm.PrintCustOrdersReport(Preview: Boolean);
begin
     if Preview then
        MDForm.QuickRep.Preview
     else
        MDForm.QuickRep.Print;
end;

procedure TMainForm.OrderReport(Sender: TObject);
begin
  PrintOrderReport(False); // print-no preview
end;

procedure TMainForm.CustomerReport(Sender: TObject);
begin
  PrintCustomerReport(False); // print-no preview
end;

procedure TMainForm.InvoiceReport(Sender: TObject);
begin
  PrintInvoiceReport(False); // print-no preview
end;

procedure TMainForm.MasterReport(Sender: TObject);
begin
  PrintMasterReport(False); // print-no preview
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
var tmpX:Double;
begin
  With FastLineSeries1 do
  begin
    tmpX:=XValues[1]-XValues[0];
    Delete(0);
    AddXY(XValues.Last+tmpX,Random(100),'',clTeeColor);
  end;
  With FastLineSeries2 do
  begin
    tmpX:=XValues[1]-XValues[0];
    Delete(0);
    AddXY(XValues.Last+tmpX,Random(200),'',clTeeColor);
  end;
  With Series1 do
  begin
    tmpX:=XValues[1]-XValues[0];
    Delete(0);
    AddXY(XValues.Last+tmpX,Random(100),'',clTeeColor);
  end;

StatusBar1.Panels[0].Text:=TimeToStr(Time);
StatusBar1.Panels[1].Text:=DateToStr(Date);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 Timer1.Enabled:=False;
 Timer1.Enabled:=True;
end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
BrMainSForm.Show;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
 EdImportForm.Enter;
 //EdImportForm.ShowModal;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
 BrProvImpForm.Show;
end;

procedure TMainForm.CloseBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
PlaySound('C:\WINDOWS\MEDIA\LOGOFF', 0, SND_ASYNC);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
PasswordDlg.Close;
end;

procedure TMainForm.ChangeIt1Click(Sender: TObject);
begin
    Screen.Cursor :=crHourGlass;
    Screen.Cursor :=crHandPoint;
    PassChange.Visible:=True;
    PassChange.Show;
    PlaySound('C:\WINDOWS\MEDIA\CHORD', 0, SND_ASYNC);
end;

procedure TMainForm.NewImports1Click(Sender: TObject);
begin
EdImportForm.Enter;
end;

procedure TMainForm.Imports1Click(Sender: TObject);
begin
case GetDateOrder(ShortDateFormat) of
    doYMD: ShortDateFormat := 'yy/mm/dd';
    doMDY: ShortDateFormat := 'mm/dd/yy';
    doDMY: ShortDateFormat := 'dd/mm/yy';
  end;
BrProvImpForm.Show;
end;

procedure TMainForm.Order1Click(Sender: TObject);
begin
EdOrderForm.Show;
end;

procedure TMainForm.Import1Click(Sender: TObject);
begin
EdImportForm.Show;
end;

procedure TMainForm.Chart2Click(Sender: TObject);
begin
{$IFNDEF NODB}
  ShowForm(TLinkedTablesForm);
  {$ELSE}
   ShowNeedsBDE;
  {$ENDIF}
end;

end.
