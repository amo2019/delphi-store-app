unit Pssword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,Registry;

type
  TPasswordDlg = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Password: TEdit;
    UserName: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

uses Splash, Main;


{$R *.DFM}

procedure TPasswordDlg.BitBtn1Click(Sender: TObject);
var
Reg:TRegistry;
pass,UsrName:String;
begin
Reg :=TRegistry.Create;
try
if not reg.KeyExists('HKEY_LOCAL_MACHINE\Software\Planing')then
 begin
 if reg.OpenKey('HKEY_LOCAL_MACHINE\Software\Planing',true)then
 reg.WriteString('pasword','OK');
 reg.WriteString('userName','AMIN');
 reg.CloseKey;
 end
else
 if reg.OpenKey('HKEY_LOCAL_MACHINE\Software\Planing',false)then
 begin
  pass:=reg.ReadString('pasword');
  UsrName:=reg.ReadString('UserName');
 end;
finally
Reg.Free;
end;
if Password.Text = '' then
  begin
  showmessage('Please...Enter The PassWord Firstly ');
  Password.setfocus;
  end
 else
   if (Pass = Password.Text )and (UsrName = UserName.text ) then
        begin
         // SplashForm.Close;
         // PasswordDlg.Hide;
         // MainForm.Visible:=True;
          MainForm.Show;
          //BrDateForm.Enabled:=True;
          {Screen.Cursor :=crHourGlass;
          Application.CreateForm(TPassChange, PassChange);
          Screen.Cursor :=crHandPoint;}
          PasswordDlg.Hide;
        end
   else
    if (Pass <> Password.Text )and (UsrName <> UserName.text ) then
      begin
      showmessage('The PassWord And The UserName Are Wrong');
      UserName.text :='';
      Password.Text :='';
      Password.setfocus;
      end
    else
     begin
     if Pass <> Password.Text then
       begin
       showmessage('The Enterd PassWord Is Wrong...');
       Password.Text :='';
       Password.setfocus;
       end;
     if UsrName <> UserName.text then
       begin
       showmessage('The Enterd UserName Is Wrong');
       UserName.text :='';
       UserName.setfocus;
       end;
    end;
end;

procedure TPasswordDlg.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TPasswordDlg.FormActivate(Sender: TObject);
begin
//MainForm.Hide;
Application.BiDiMode:=bdRightToLeft;
LOADKEYBOARDLAYOUT('KLF_ACTIVATE',00000401);
ACTIVATEKEYBOARDLAYOUT(LANG_ENGLISH,00000401);

end;

procedure TPasswordDlg.BitBtn3Click(Sender: TObject);
begin
{  Screen.Cursor :=crHourGlass;
          Application.CreateForm(TPassChange, PassChange);
          Screen.Cursor :=crHandPoint;
          PassChange.Visible:=True;}
end;

procedure TPasswordDlg.FormCreate(Sender: TObject);
begin
//SplashForm.Close;
end;

end.
