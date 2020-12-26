program Storeapp;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Brparts in 'BRPARTS.PAS' {BrPartsForm},
  QryCust in 'QryCust.pas' {QueryCustDlg},
  Edparts in 'EDPARTS.PAS' {EdPartsForm},
  BrCstOrd in 'BrCstOrd.pas' {BrCustOrdForm},
  Edcust in 'Edcust.pas' {EdCustForm},
  Edorders in 'EDOrders.pas' {EdOrderForm},
  SrchDlg in 'SrchDlg.pas' {SearchDlg},
  Splash in 'Splash.pas' {SplashForm},
  Pickdate in 'PICKDATE.PAS' {BrDateForm},
  About in 'About.pas' {AboutBox},
  Pickrep in 'PICKREP.PAS' {PickRpt},
  DataMod in 'DataMod.pas' {MastData: TDataModule},
  CustRpt in 'CustRpt.pas' {CustomerByInvoiceReport: TQuickRep},
  InvcRpt in 'InvcRpt.pas' {InvoiceByOrderNoReport: TQuickRep},
  PickInvc in 'PickInvc.pas' {PickOrderNoDlg},
  EDImports in 'EDImports.pas' {EdImportForm},
  BrProvImpo in 'BrProvImpo.pas' {BrProvImpForm},
  EdProv in 'EdProv.pas' {EdProvForm},
  mdrpt in 'mdrpt.pas' {frmMasterDetail},
  OrderRpt in 'OrderRpt.pas' {OrdersByDateReport: TQuickRep},
  OrderRpt2 in 'OrderRpt2.pas' {MasterByDateReport: TQuickRep},
  MainStoreG in 'MainStoreG.pas' {BrMainSForm},
  Pssword in 'Pssword.pas' {PasswordDlg},
  PssChng in 'PssChng.pas' {PassChange},
  Manygrp in 'Manygrp.pas' {ManyGrpForm},
  Md in 'Md.pas' {MDForm},
  linked in 'linked.pas' {LinkedTablesForm};

{$R *.RES}

begin
  Application.Initialize;
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Title := 'Main Stores Order & Import Entry';
  Application.HelpFile := 'C:\Program Files\FutureSoft\StoresApp\help\STORESAPP.HLP';
  Application.CreateForm(TMastData, MastData);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBrPartsForm, BrPartsForm);
  Application.CreateForm(TQueryCustDlg, QueryCustDlg);
  Application.CreateForm(TEdPartsForm, EdPartsForm);
  Application.CreateForm(TBrCustOrdForm, BrCustOrdForm);
  Application.CreateForm(TEdCustForm, EdCustForm);
  Application.CreateForm(TEdOrderForm, EdOrderForm);
  Application.CreateForm(TSearchDlg, SearchDlg);
  Application.CreateForm(TBrDateForm, BrDateForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TPickRpt, PickRpt);
  Application.CreateForm(TCustomerByInvoiceReport, CustomerByInvoiceReport);
  Application.CreateForm(TInvoiceByOrderNoReport, InvoiceByOrderNoReport);
  Application.CreateForm(TPickOrderNoDlg, PickOrderNoDlg);
  Application.CreateForm(TEdImportForm, EdImportForm);
  Application.CreateForm(TBrProvImpForm, BrProvImpForm);
  Application.CreateForm(TEdProvForm, EdProvForm);
  Application.CreateForm(TfrmMasterDetail, frmMasterDetail);
  Application.CreateForm(TOrdersByDateReport, OrdersByDateReport);
  Application.CreateForm(TMasterByDateReport, MasterByDateReport);
  Application.CreateForm(TBrMainSForm, BrMainSForm);
  Application.CreateForm(TPassChange, PassChange);
  Application.CreateForm(TManyGrpForm, ManyGrpForm);
  Application.CreateForm(TMDForm, MDForm);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
