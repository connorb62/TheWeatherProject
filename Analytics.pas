{ The Weather Project - SETTINGS UNIT
(C) 2022 Connor Bell - ALL RIGHTS RESERVED
}
unit Analytics;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids,
  Vcl.ValEdit;

type
  TfrmAnalytics = class(TForm)
    clbrMain: TCoolBar;
    tlbrMain: TToolBar;
    pgcMain: TPageControl;
    tbsWeather: TTabSheet;
    tbsAQI: TTabSheet;
    pgcWeather: TPageControl;
    tbsParameters: TTabSheet;
    tbsAPI: TTabSheet;
    strWP: TStringGrid;
    strWAPI: TStringGrid;
    pgcAQI: TPageControl;
    tbsParamAQI: TTabSheet;
    tbsAQIAPI: TTabSheet;
    strAQIA: TStringGrid;
    tlbtnClose: TToolButton;
    strAQIP: TStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure tlbtnCloseClick(Sender: TObject);
    procedure tlbtnPrintClick(Sender: TObject);
    procedure tlbtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    // User Def Proc
    procedure LoadParams;
  end;

var
  frmAnalytics: TfrmAnalytics;

implementation

uses
  Main;

{$R *.dfm}

procedure TfrmAnalytics.FormActivate(Sender: TObject);
begin
  // ON ACTIVATE
  LoadParams;
end;

procedure TfrmAnalytics.LoadParams;
begin
  // LOAD PARAMS
  // Weather Params
  with strWP do
    begin
      Cells[0, 0] := 'Parameter';
      Cells[1, 0] := 'Value';
      Cells[0, 1] := frmMain.rrqMain.Params[0].Name;
      Cells[1, 1] := frmMain.rrqMain.Params[0].Value;
      Cells[0, 2] := frmMain.rrqMain.Params[2].Name;
      Cells[1, 2] := frmMain.rrqMain.Params[2].Value;
    end;

  // Weather API
  with strWAPI do
    begin
      Cells[0, 0] := 'Status Code';
      Cells[1, 0] := frmMain.rrsMain.StatusCode.ToString;
      Cells[0, 1] := 'Status Message';
      Cells[1, 1] := frmMain.rrsMain.StatusText;
      Cells[0, 2] := 'Server';
      Cells[1, 2] := frmMain.rrsConditions.Server;
    end;

  // AQI Params
    with strAQIP do
    begin
      Cells[0, 0] := 'Parameter';
      Cells[1, 0] := 'Value';
      Cells[0, 1] := frmMain.rrqAQI.Params[0].Name;
      Cells[1, 1] := frmMain.rrqAQI.Params[0].Value;
    end;

  // AQI API
  with strAQIA do
    begin
      Cells[0, 0] := 'Status Code';
      Cells[1, 0] := frmMain.rrsAQI.StatusCode.ToString;
      Cells[0, 1] := 'Status Message';
      Cells[1, 1] := frmMain.rrsAQI.StatusText;
      Cells[0, 2] := 'Server';
      Cells[1, 2] := frmMain.rrsAQI.Server;
    end;

end;
procedure TfrmAnalytics.tlbtnCloseClick(Sender: TObject);
begin
  // CLOSE ANALYTICS
  frmAnalytics.Close;
end;

procedure TfrmAnalytics.tlbtnPrintClick(Sender: TObject);
begin
  // PRINT ANALYTICS
  if tbsWeather.Showing = True then
    begin
      // Print Weather Tabsheet contents
      if tbsAPI.Showing = True then
        begin
          // Print API Stats
        end
      else
      if tbsParameters.Showing = True then
        begin
          // Print the Parameter Stats
        end;
    end
  else
  if tbsAQI.Showing = True then
    begin
      // Print AQI Tabsheet contents
      if tbsAQIAPI.Showing = True then
        begin
          // Print AQI API Stats
        end
      else
      if tbsParamAQI.Showing = True then
        begin
          // Print the AQI Parameter Stats
        end;
    end;
end;

procedure TfrmAnalytics.tlbtnSaveClick(Sender: TObject);
begin
   // SAVE ANALYTICS
  if tbsWeather.Showing = True then
    begin
      // Save Weather Tabsheet contents
      if tbsAPI.Showing = True then
        begin
          // Save API Stats
        end
      else
      if tbsParameters.Showing = True then
        begin
          // Save the Parameter Stats
        end;
    end
  else
  if tbsAQI.Showing = True then
    begin
      // Save AQI Tabsheet contents
      if tbsAQIAPI.Showing = True then
        begin
          // Save AQI API Stats
        end
      else
      if tbsParamAQI.Showing = True then
        begin
          // Save the AQI Parameter Stats
        end;
    end;
end;

end.
