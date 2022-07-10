program Weather;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Analytics in 'Analytics.pas' {frmAnalytics},
  Settings in 'Settings.pas' {frmSettings},
  Vcl.Themes,
  Vcl.Styles,
  Help_Doc in 'Help_Doc.pas' {frmHelp},
  About in 'About.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'The Weather Project';
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAnalytics, frmAnalytics);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
