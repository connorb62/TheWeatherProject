{ The Weather Project - SETTINGS UNIT
(C) 2022 Connor Bell - ALL RIGHTS RESERVED
}
unit Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Themes;

type
  TfrmSettings = class(TForm)
    clbrMain: TCoolBar;
    tlbrMain: TToolBar;
    tlbtnClose: TToolButton;
    pgcSettings: TPageControl;
    tbsPersonalisation: TTabSheet;
    grpTheme: TGroupBox;
    pnlBase: TPanel;
    btnSave: TButton;
    btnClose: TButton;
    btnDefault: TButton;
    cbbTheme: TComboBox;
    procedure tlbtnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cbbThemeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure WriteTheme;
  end;

var
  frmSettings: TfrmSettings;

implementation

uses
  Main;

{$R *.dfm}

procedure TfrmSettings.btnCloseClick(Sender: TObject);
begin
  // CLOSE FORM
  frmSettings.Close;
end;

procedure TfrmSettings.btnDefaultClick(Sender: TObject);
var
  txtFile : TextFile;
begin
  // SET DEFAULT THEME
  if not FileExists('Theme.txt') then
    begin
      // File doesn't exist
      MessageDlg('Error: Cannot save settings because the file "Theme" could not be located' + #13 +
      'Locate the file and try again', mtError, [mbOK], 0);
      Exit;
    end
  else
    begin
      // Write to File
      AssignFile(txtFile, 'Theme.txt');
      Rewrite(txtFile);
      Writeln(txtFile, 'Luna');
    end;
  CloseFile(txtFile);

  // Set Theme
  TStyleManager.TrySetStyle('Luna');
  MessageDlg('Saved', mtInformation, [mbOK], 0);
end;

procedure TfrmSettings.btnSaveClick(Sender: TObject);
begin
  // READ SETTINGS
  // Set Theme
  WriteTheme;
  MessageDlg('Saved', mtInformation, [mbOK], 0);
end;

procedure TfrmSettings.cbbThemeChange(Sender: TObject);
begin
  // ENABLE BUTTONS
  btnSave.Enabled := True;
  btnDefault.Enabled := True;
end;

procedure TfrmSettings.tlbtnCloseClick(Sender: TObject);
begin
  // CLOSE SETTINGS
  frmSettings.Close;
end;

procedure TfrmSettings.WriteTheme;
var
  txtFile : TextFile;
begin
  // SAVE AND SET THEME
  if not FileExists('Theme.txt') then
    begin
      // File doesn't exist
      MessageDlg('Error: Cannot save settings because the file "Theme" could not be located' + #13 +
      'Locate the file and try again', mtError, [mbOK], 0);
      Exit;
    end
  else
    begin
      // Write to File
      AssignFile(txtFile, 'Theme.txt');
      Rewrite(txtFile);
      Writeln(txtFile, cbbTheme.Text);
    end;
  CloseFile(txtFile);

  // Set Theme
  TStyleManager.TrySetStyle(cbbTheme.Text);
end;

end.
