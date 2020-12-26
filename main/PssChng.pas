unit PssChng;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,Registry;

type
  TPassChange = class(TForm)
    Panel1: TPanel;
    OldPass: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    NewPass: TEdit;
    Label5: TLabel;
    UserNam: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure NewPassChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PassChange: TPassChange;

implementation



{$R *.DFM}

procedure TPassChange.BitBtn3Click(Sender: TObject);
var
Reg:TRegistry;
begin
 if (NewPass.Text = '' ) and (NewPass.Enabled) then
    showmessage('Enter The New PassWord....')
 else
 begin
  Reg :=TRegistry.Create;
  try
    if reg.OpenKey('HKEY_LOCAL_MACHINE\Software\Planing',true)then
     reg.WriteString('pasword',NewPass.Text);
     reg.WriteString('userName',UserNam.Text);
     reg.CloseKey;
  finally
  Reg.Free;
  end;
  end;


end;

procedure TPassChange.SpeedButton1Click(Sender: TObject);
var
Reg:TRegistry;
pass,UsrName:String;
begin
Reg :=TRegistry.Create;
try
 if reg.OpenKey('HKEY_LOCAL_MACHINE\Software\Planing',false)then
 begin
  pass:=reg.ReadString('pasword');
  UsrName:=reg.ReadString('UserName');
 end;
finally
Reg.Free;
end;
       Newpass.text:='';
       NewPass.Enabled:=false;
       NewPass.Color:=clInfoBk;
       UserNam.text:='';
       UserNam.Enabled:=false;
       UserNam.Color:=clInfoBk;
if Pass <> OldPass.Text then
       begin
       showmessage('The Entred PassWord Is Wrong...');
       OldPass.Text :='';
       OldPass.setfocus;
       end
      else
      begin
       NewPass.Enabled:=true;
       NewPass.Color:=clWhite;
       UserNam.Enabled:=true;
       UserNam.Color:=clWhite;
       end;
end;

procedure TPassChange.FormActivate(Sender: TObject);
begin
       OldPass.Clear;
       Newpass.text:='';
       NewPass.Enabled:=false;
       NewPass.Color:=clInfoBk;
       UserNam.text:='';
       UserNam.Enabled:=false;
       UserNam.Color:=clInfoBk;

end;

procedure TPassChange.NewPassChange(Sender: TObject);
begin
BitBtn3.Enabled := NewPass.Text <> ''; 
end;

procedure TPassChange.BitBtn4Click(Sender: TObject);
begin
Close;
end;

end.
