{ The Weather Project - MAIN UNIT
(C) 2022 Connor Bell - ALL RIGHTS RESERVED
}
unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.StdCtrls, Data.Bind.DBScope, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Themes, Vcl.ExtDlgs, DateUtils, Vcl.Menus;

type
  TfrmMain = class(TForm)
    clbrMain: TCoolBar;
    statMain: TStatusBar;
    pgcMain: TPageControl;
    tbsWeather: TTabSheet;
    tbsAQI: TTabSheet;
    rclConditions: TRESTClient;
    rrqConditions: TRESTRequest;
    rrsConditions: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    tmrTime: TTimer;
    pnlTop: TPanel;
    grpParameters: TGroupBox;
    lbledtLat: TLabeledEdit;
    lbledtLon: TLabeledEdit;
    cbbUnits: TComboBox;
    lblUnits: TLabel;
    imglstIcons: TImageList;
    tlbrMain: TToolBar;
    tlbtnExecute: TToolButton;
    tlbtnSep1: TToolButton;
    tlbtnSetAsDefault: TToolButton;
    tlbtnSep2: TToolButton;
    mmoConMain: TMemo;
    LinkControlToFieldmain: TLinkControlToField;
    mmoConDescrip: TMemo;
    LinkControlToFielddescription: TLinkControlToField;
    rclMain: TRESTClient;
    rrqMain: TRESTRequest;
    rrsMain: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    FDMemTable2: TFDMemTable;
    BindSourceDB2: TBindSourceDB;
    mmoTemp: TMemo;
    LinkControlToFieldtemp: TLinkControlToField;
    mmoFeelsLike: TMemo;
    LinkControlToFieldfeels_like: TLinkControlToField;
    mmoTempMin: TMemo;
    LinkControlToFieldtemp_min: TLinkControlToField;
    mmoTempMax: TMemo;
    LinkControlToFieldtemp_max: TLinkControlToField;
    mmoPressure: TMemo;
    LinkControlToFieldpressure: TLinkControlToField;
    mmoHumidity: TMemo;
    LinkControlToFieldhumidity: TLinkControlToField;
    lblTemp: TLabel;
    lblMax: TLabel;
    lblMin: TLabel;
    grpTemp: TGroupBox;
    lblFeelsLike: TLabel;
    lblDeg1: TLabel;
    lblDeg2: TLabel;
    lblDeg3: TLabel;
    lblDeg4: TLabel;
    grpConditions: TGroupBox;
    lblPressure: TLabel;
    lblHumidity: TLabel;
    lblPresUnit: TLabel;
    lblHumUnit: TLabel;
    rclWind: TRESTClient;
    rrqWind: TRESTRequest;
    rrsWind: TRESTResponse;
    RESTResponseDataSetAdapter3: TRESTResponseDataSetAdapter;
    FDMemTable3: TFDMemTable;
    grpWind: TGroupBox;
    BindSourceDB3: TBindSourceDB;
    mmoWindSpeed: TMemo;
    LinkControlToFieldspeed: TLinkControlToField;
    mmoWindDeg: TMemo;
    LinkControlToFielddeg: TLinkControlToField;
    mmoWindGust: TMemo;
    LinkControlToFieldgust: TLinkControlToField;
    lblWindSpeed: TLabel;
    lblGust: TLabel;
    lblDirection: TLabel;
    lblWSUnit: TLabel;
    lblGustUnit: TLabel;
    lblDirDeg: TLabel;
    mmoWeatherID: TMemo;
    LinkControlToFieldid: TLinkControlToField;
    tlbtnBack: TToolButton;
    tlbtnForward: TToolButton;
    tlbtnSep3: TToolButton;
    tlbtnPrint: TToolButton;
    tlbtnSave: TToolButton;
    tlbtnSep4: TToolButton;
    tlbtnSettings: TToolButton;
    tlbtnHelp: TToolButton;
    tlbtnAnalytics: TToolButton;
    tlbtnAbout: TToolButton;
    tlbtnClose: TToolButton;
    rclClouds: TRESTClient;
    rrqClouds: TRESTRequest;
    rrsClouds: TRESTResponse;
    RESTResponseDataSetAdapter4: TRESTResponseDataSetAdapter;
    FDMemTable4: TFDMemTable;
    rclVis: TRESTClient;
    rrqVIs: TRESTRequest;
    rrsVis: TRESTResponse;
    RESTResponseDataSetAdapter5: TRESTResponseDataSetAdapter;
    FDMemTable5: TFDMemTable;
    BindSourceDB4: TBindSourceDB;
    BindSourceDB5: TBindSourceDB;
    redOut: TRichEdit;
    dlgSaveText: TSaveTextFileDialog;
    dlgPrint: TPrintDialog;
    rclAQI: TRESTClient;
    rrqAQI: TRESTRequest;
    rrsAQI: TRESTResponse;
    RESTResponseDataSetAdapter6: TRESTResponseDataSetAdapter;
    FDMemTable6: TFDMemTable;
    grpClouds: TGroupBox;
    lblCloudCov: TLabel;
    lblVis: TLabel;
    lblCCUnit: TLabel;
    lblVisUnit: TLabel;
    grpAQI: TGroupBox;
    BindSourceDB6: TBindSourceDB;
    mmoAQI: TMemo;
    LinkControlToFieldaqi: TLinkControlToField;
    lblAQI: TLabel;
    grpAQIStats: TGroupBox;
    mmoStatus: TMemo;
    rclAQIComps: TRESTClient;
    rrqAQIComps: TRESTRequest;
    rrsAQIComps: TRESTResponse;
    RESTResponseDataSetAdapter7: TRESTResponseDataSetAdapter;
    FDMemTable7: TFDMemTable;
    BindSourceDB7: TBindSourceDB;
    mmoCO: TMemo;
    LinkControlToFieldco: TLinkControlToField;
    mmoNO: TMemo;
    LinkControlToFieldno: TLinkControlToField;
    mmono1: TMemo;
    LinkControlToFieldno2: TLinkControlToField;
    mmoo: TMemo;
    LinkControlToFieldo3: TLinkControlToField;
    mmoso: TMemo;
    LinkControlToFieldso2: TLinkControlToField;
    mmopm2_1: TMemo;
    LinkControlToFieldpm2_5: TLinkControlToField;
    mmopm: TMemo;
    LinkControlToFieldpm10: TLinkControlToField;
    mmonh: TMemo;
    LinkControlToFieldnh3: TLinkControlToField;
    lblU1: TLabel;
    lblU2: TLabel;
    lblU4: TLabel;
    lblU5: TLabel;
    lblU6: TLabel;
    lblU7: TLabel;
    lblU9: TLabel;
    lblU10: TLabel;
    lblL1: TLabel;
    lblL2: TLabel;
    lblNO: TLabel;
    lblNO2: TLabel;
    lblO3: TLabel;
    lblPM10: TLabel;
    lblPM25: TLabel;
    lblSO2: TLabel;
    mmoCloudCover: TMemo;
    LinkControlToFieldall: TLinkControlToField;
    mmovisibility: TMemo;
    LinkControlToFieldvisibility: TLinkControlToField;
    lblLastUpdate: TLabel;
    BalloonHint1: TBalloonHint;
    trycnMain: TTrayIcon;
    mnmnMain: TMainMenu;
    File1: TMenuItem;
    File2: TMenuItem;
    Save1: TMenuItem;
    Save2: TMenuItem;
    Close1: TMenuItem;
    Close2: TMenuItem;
    Change1: TMenuItem;
    Latitude1: TMenuItem;
    Latitude2: TMenuItem;
    Units1: TMenuItem;
    Units2: TMenuItem;
    Settings1: TMenuItem;
    Settings2: TMenuItem;
    PageForward1: TMenuItem;
    SetDefaultLocation1: TMenuItem;
    Help1: TMenuItem;
    Help2: TMenuItem;
    About1: TMenuItem;
    Analytics1: TMenuItem;
    procedure tmrTimeTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tlbtnAnalyticsClick(Sender: TObject);
    procedure tlbtnCloseClick(Sender: TObject);
    procedure tlbtnSettingsClick(Sender: TObject);
    procedure tlbtnExecuteClick(Sender: TObject);
    procedure tlbtnSetAsDefaultClick(Sender: TObject);
    procedure tlbtnBackClick(Sender: TObject);
    procedure tlbtnForwardClick(Sender: TObject);
    procedure tlbtnSaveClick(Sender: TObject);
    procedure tlbtnPrintClick(Sender: TObject);
    procedure mmoAQIChange(Sender: TObject);
    procedure tlbtnAboutClick(Sender: TObject);
    procedure tlbtnHelpClick(Sender: TObject);
    procedure File2Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Latitude1Click(Sender: TObject);
    procedure Latitude2Click(Sender: TObject);
    procedure Units1Click(Sender: TObject);
    procedure SetDefaultLocation1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure Settings2Click(Sender: TObject);
    procedure PageForward1Click(Sender: TObject);
    procedure Analytics1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    // Def Loc Var
    bDefLoc : Boolean;
    // User Def Proc
    procedure SetUnits;
    procedure WeatherIcon;
    procedure TrySetStyle;
    procedure ExecuteAPI;
    procedure ReadDefLoc;
    procedure CreateWR;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  Analytics, Settings, About, Help_Doc;

{$R *.dfm}

procedure TfrmMain.About1Click(Sender: TObject);
begin
  // SHOW ABOUT
  MessageDlg('The Weather Project®' + #13 + '© 2022 Connor Bell' + #13 +
  'Version: 1.0.0.0' + #13 +
  'Weather Source: OpenWeatherMap', mtInformation, [mbClose], 0);
end;

procedure TfrmMain.Analytics1Click(Sender: TObject);
begin
  // SHOW ANALYTICS
  frmAnalytics.Show;
end;

procedure TfrmMain.Close1Click(Sender: TObject);
begin
   // TERMINATE THE APPLICATION
  Application.Terminate;
end;

procedure TfrmMain.CreateWR;
var
  sUnit, sWUnit : string;
begin
  // CREATE WEATHER REPORT
  dlgSaveText.Filter := 'Text files (*.txt)|*.TXT|Any file (*.*)|*.*';
  with redOut do
    begin
      // Clear Lines
      Lines.Clear;
      Clear;

      // Add Date and Time
      Lines.Add(DateToStr(Now) + #9 + TimeToStr(Now));

      // Set TabStops
      TabStop := True;
      Paragraph.TabCount := 2;
      Paragraph.Tab[0] := 300;
      Paragraph.Tab[1] := 600;

      // Add Location
      Lines.Add(#13 + 'Location: ' + #9 + lbledtLat.Text + ', ' + lbledtLon.Text);

      // Set Units
      if cbbUnits.Text = 'Metric' then
        begin
          sUnit := ' °C';
          sWUnit := ' m/s';
        end
      else
        begin
          sUnit := ' ° F';
          sWUnit := ' mph';
        end;

      // Set Richedit Font
      Font.Size := 9;
      Font.Name := 'Consolas';

      // Add Weather Information
      // Temperature
      Lines.Add(#13 + 'Current Temp:' + #9 + mmoTemp.Text + sUnit);
      Lines.Add('Max Temp:' + #9 + mmoTempMax.Text + sUnit);
      Lines.Add('Min Temp:' + #9 + mmoTempMin.Text + sUnit);
      Lines.Add('Feels Like:' + #9 + mmoFeelsLike.Text + sUnit);

      //Conditions
      Lines.Add(#13 + mmoConMain.Text + #9 + mmoConDescrip.Text);
      Lines.Add('Pressure:' + #9 + mmoPressure.Text + ' hPa');
      Lines.Add('Humidity:' + #9 + mmoHumidity.Text + ' %');

      // Wind
      Lines.Add(#13 + 'Wind:' + #9 + mmoWindSpeed.Text + sWUnit + ' @ ' +
      mmoWindDeg.Text + '°');
      Lines.Add('Gust:' + #9 + mmoWindGust.Text + sWUnit);

      // Clouds
      Lines.Add(#13 + 'Cloud Cover:' + #9 + mmoCloudCover.Text + '%');
      Lines.Add('Visibility:' + #9 + mmovisibility.Text + ' m');

      // *********** ADD AIR QUALITY INFORMATION HERE *******************
      Lines.Add(#13 + 'AQI:' + #9 + mmoAQI.Text + #9 + mmoStatus.Text);
      //Specific Gasses:
      //μg/m³
      Lines.Add(#13 + 'CO:' + #9 + mmoCO.Text + ' μg/m³');
      Lines.Add('NH3:' + #9 + mmonh.Text + ' μg/m³');
      Lines.Add('NO:' + #9 + mmoNO.Text + ' μg/m³');
      Lines.Add('NO2:' + #9 + mmono1.Text + ' μg/m³');
      Lines.Add('O3:' + #9 + mmoo.Text + ' μg/m³');
      Lines.Add('PM 10:' + #9 + mmopm.Text + ' μg/m³');
      Lines.Add('PM 2.5:' + #9 + mmopm2_1.Text + ' μg/m³');
      Lines.Add('SO2:' + #9 + mmoso.Text + ' μg/m³');
    end;

end;

procedure TfrmMain.ExecuteAPI;
var
  // Param Var
  sLat1, sLon1, sLatLon1, sUnit1 : string;
begin
  // EXECUTE API
    // SET PARAMETERS
  // Lat Lon Param
  sLat1 := lbledtLat.Text;
  sLon1 := lbledtLon.Text;
  sLatLon1 := sLat1 + ', ' + sLon1;

  // Units Param
  sUnit1 := LowerCase(cbbUnits.Text);

  // EXECUTE RESTREQUEST
  // Base URL
  rclConditions.BaseURL := 'https://api.openweathermap.org/data/2.5/weather?lat=' + sLat1 + '&lon=' + sLon1 +'&appid=79b6af39e97f6dc60edaf1f1412c33c5';
  rclMain.BaseURL :=  'https://api.openweathermap.org/data/2.5/weather?lat=' + sLat1 + '&lon=' + sLon1 +'&appid=79b6af39e97f6dc60edaf1f1412c33c5';
  rclWind.BaseURL :=  'https://api.openweathermap.org/data/2.5/weather?lat=' + sLat1 + '&lon=' + sLon1 +'&appid=79b6af39e97f6dc60edaf1f1412c33c5';
  rclClouds.BaseURL := 'https://api.openweathermap.org/data/2.5/weather?lat=' + sLat1 + '&lon=' + sLon1 +'&appid=79b6af39e97f6dc60edaf1f1412c33c5';
  rclVis.BaseURL := 'https://api.openweathermap.org/data/2.5/weather?lat=' + sLat1 + '&lon=' + sLon1 +'&appid=79b6af39e97f6dc60edaf1f1412c33c5';
  rclAQI.BaseURL := 'http://api.openweathermap.org/data/2.5/air_pollution?lat=' + sLat1 + '&lon=' + sLon1 + '&appid=79b6af39e97f6dc60edaf1f1412c33c5';
  rclAQIComps.BaseURL := 'http://api.openweathermap.org/data/2.5/air_pollution?lat=' + sLat1 + '&lon=' + sLon1 + '&appid=79b6af39e97f6dc60edaf1f1412c33c5';

  // Set Param
  rrqConditions.Params[0].Value := sLatLon1;
  rrqConditions.Params[2].Value := sUnit1;

  rrqMain.Params[0].Value := sLatLon1;
  rrqMain.Params[2].Value := sUnit1;

  rrqWind.Params[0].Value := sLatLon1;
  rrqWind.Params[2].Value := sUnit1;

  rrqClouds.Params[0].Value := sLatLon1;
  rrqClouds.Params[2].Value := sUnit1;

  rrqVis.Params[0].Value := sLatLon1;
  rrqVis.Params[2].Value := sUnit1;

  rrqAQI.Params[0].Value := sLatLon1;
  rrqAQIComps.Params[0].Value := sLatLon1;

  {// Set Method
  rrqConditions.Method  := TRESTRequestMethod.rmPOST;
  rrqMain.Method  := TRESTRequestMethod.rmPOST;  }

  // Execute
  rrqConditions.Execute;
  rrqMain.Execute;
  rrqWind.Execute;
  rrqClouds.Execute;
  rrqVis.Execute;
  rrqAQI.Execute;
  rrqAQIComps.Execute;

  // Set Units
  SetUnits;

  // Update Statusbar
  with statMain do
    begin
      Panels[2].Text := rrsConditions.StatusCode.ToString;
      Panels[3].Text := rrqConditions.Params[2].Value;
      Panels[4].Text := rrqConditions.Params[0].Value;
    end;

  // Set Weather Icon
  WeatherIcon;

  // Enable Analytics
  tlbtnAnalytics.Enabled := True;

  // Show Update Status
  statMain.Panels[5].Text := 'Last Updated: ' + TimeToStr(Now);
end;

procedure TfrmMain.File2Click(Sender: TObject);
begin
  // EXECUTE API
  ExecuteAPI;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
   // ON ACTIVATE
   // Read the default location and execute the API if needed
  ReadDefLoc;
  ExecuteAPI;

  // Show Update Status
  statMain.Panels[5].Text := 'Last Updated: ' + TimeToStr(Now);
end;

procedure TfrmMain.Help2Click(Sender: TObject);
begin
  // VIEW HELP DOCS
  MessageDlg('Visit (https://github.com/connorb62/TheWeatherProject/) to download the Help Documentation PDF',
  mtInformation, [mbOK], 0);
end;

procedure TfrmMain.Latitude1Click(Sender: TObject);
begin
  // CHANGE LAT
  with lbledtLat do
    begin
      Clear;
      SetFocus;
    end;
end;

procedure TfrmMain.Latitude2Click(Sender: TObject);
begin
  // CHANGE LAT
  with lbledtLon do
    begin
      Clear;
      SetFocus;
    end;
end;

procedure TfrmMain.mmoAQIChange(Sender: TObject);
begin
 if mmoAQI.Text = '1' then
  begin
    mmoStatus.Text := 'Good';
  end
 else
 if mmoAQI.Text = '2' then
  begin
    mmoStatus.Text := 'Fair';
  end
 else
 if mmoAQI.Text = '3' then
  begin
    mmoStatus.Text := 'Moderate';
  end
 else
 if mmoAQI.Text = '4' then
  begin
    mmoStatus.Text := 'Poor';
  end
 else
 if mmoAQI.Text = '5' then
  begin
    mmoStatus.Text := 'Very Poor';
  end;

end;

procedure TfrmMain.PageForward1Click(Sender: TObject);
begin
   // PAGE FORWARD
  if tbsAQI.Showing = True then
    begin
      Beep;
    end
  else
  if tbsWeather.Showing = True then
    begin
      tbsAQI.Show;
    end;
end;

procedure TfrmMain.ReadDefLoc;
var
  txtFile : TextFile;
  iPos : Integer;
  sLine : string;
  sDLat, sDLon : string;
  sDUnit : string;
begin
  bDefLoc := False;
  // READ DEF LOCATION
  if not FileExists('Def_Loc.txt') then
    begin
      // File Doesn't exist
      Exit;
    end
  else
    begin
      AssignFile(txtFile, 'Def_Loc.txt');
      Reset(txtFile);
      while not Eof(txtFile) do
        begin
          Readln(txtFile, sLine);

          iPos := Pos(',', sLine);
          sDLat := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos + 1);

          iPos := Pos('#', sLine);
          sDLon := Copy(sLine, 1, iPos - 1);
          Delete(sLine, 1, iPos);

          sDUnit := sLine;
        end;
      // Apply Settings to the edits so they can be used
      lbledtLat.Text := sDLat;
      lbledtLon.Text := sDLon;
      cbbUnits.Text := sDUnit;
      bDefLoc := True;
    end;
  CloseFile(txtFile);
end;

procedure TfrmMain.Save1Click(Sender: TObject);
begin
    // SAVE WEATHER REPORT
  CreateWR;

  // Save RichEdit Lines to File
  dlgSaveText.FileName := 'Weather_Report_' + FormatDateTime('dddddd', Now) + '.txt';
  if dlgSaveText.Execute then
    begin
      redOut.Lines.SaveToFile(dlgSaveText.FileName);
      MessageDlg('Saved', TMsgDlgType.mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmMain.Save2Click(Sender: TObject);
begin
    // PRINT WEATHER REPORT
    CreateWR;
   // Print Richedit Lines
   if dlgPrint.Execute then
    begin
      redOut.Print('Weather Report - ' + DateToStr(Now));
    end;

end;

procedure TfrmMain.SetDefaultLocation1Click(Sender: TObject);
var
  txtFile : TextFile;
  sWLat, sWLon, sWLatLon, sWUnit : string;
begin
  // SET DEFAULT LOCATION
  // Write Def Location to File
  if not FileExists('Def_Loc.txt') then
    begin
      // File Doesn't Exist
      Exit;
    end
  else
    begin
      // Lat Lon Param
      sWLat := lbledtLat.Text;
      sWLon := lbledtLon.Text;
      sWLatLon := sWLat + ', ' + sWLon;

      // Units Param
      sWUnit := cbbUnits.Text;

      // Write to File
      AssignFile(txtFile, 'Def_Loc.txt');
      Rewrite(txtFile);
      Writeln(txtFile, sWLatLon + '#' + sWUnit);
      CloseFile(txtFile);
      MessageDlg(sWLatLon + ' is now the default location', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmMain.Settings1Click(Sender: TObject);
begin
  // OPEN SETTINGS
  frmSettings.Show;
end;

procedure TfrmMain.Settings2Click(Sender: TObject);
begin
   // PAGE BACK
  if tbsWeather.Showing = True then
    begin
      Beep;
    end
  else
  if tbsAQI.Showing = True then
    begin
      tbsWeather.Show;
    end;
end;

procedure TfrmMain.SetUnits;
begin
  // SET UNITS
  if cbbUnits.Text = 'Metric' then
    begin
      lblDeg1.Caption := '°C';
      lblDeg2.Caption := '°C';
      lblDeg3.Caption := '°C';
      lblDeg4.Caption := '°C';
      lblWSUnit.Caption := 'm/s';
      lblGustUnit.Caption := 'm/s';
      lblVisUnit.Caption := 'm';
    end
  else
  if cbbUnits.Text = 'Imperial' then
    begin
      lblDeg1.Caption := '° F';
      lblDeg2.Caption := '° F';
      lblDeg3.Caption := '° F';
      lblDeg4.Caption := '° F';
      lblWSUnit.Caption := 'mph';
      lblGustUnit.Caption := 'mph';
      lblVisUnit.Caption := 'm';
    end;

end;

procedure TfrmMain.tlbtnAboutClick(Sender: TObject);
begin
  // SHOW ABOUT FORM
  MessageDlg('The Weather Project®' + #13 + '© 2022 Connor Bell' + #13 +
  'Version: 1.0.0.0' + #13 +
  'Weather Source: OpenWeatherMap', mtInformation, [mbClose], 0);
end;

procedure TfrmMain.tlbtnAnalyticsClick(Sender: TObject);
begin
  // OPEN ANALYTICS
   frmAnalytics.Show;
end;

procedure TfrmMain.tlbtnBackClick(Sender: TObject);
begin
  // PAGE BACK
  if tbsWeather.Showing = True then
    begin
      Beep;
    end
  else
  if tbsAQI.Showing = True then
    begin
      tbsWeather.Show;
    end;
end;

procedure TfrmMain.tlbtnCloseClick(Sender: TObject);
begin
  // TERMINATE THE APPLICATION
  Application.Terminate;
end;

procedure TfrmMain.tlbtnExecuteClick(Sender: TObject);
begin
  // EXECUTE API
  ExecuteAPI;
end;

procedure TfrmMain.tlbtnForwardClick(Sender: TObject);
begin
  // PAGE FORWARD
  if tbsAQI.Showing = True then
    begin
      Beep;
    end
  else
  if tbsWeather.Showing = True then
    begin
      tbsAQI.Show;
    end;
end;

procedure TfrmMain.tlbtnHelpClick(Sender: TObject);
begin
  // SHOW HELP DOC FORM
  MessageDlg('Visit (https://github.com/connorb62/TheWeatherProject/) to download the Help Documentation PDF',
  mtInformation, [mbOK], 0);
end;

procedure TfrmMain.tlbtnPrintClick(Sender: TObject);
begin
  // PRINT WEATHER REPORT
    CreateWR;
   // Print Richedit Lines
   if dlgPrint.Execute then
    begin
      redOut.Print('Weather Report - ' + DateToStr(Now));
    end;

end;

procedure TfrmMain.tlbtnSaveClick(Sender: TObject);
begin
  // SAVE WEATHER REPORT
  CreateWR;

  // Save RichEdit Lines to File
  dlgSaveText.FileName := 'Weather_Report_' + FormatDateTime('dddddd', Now) + '.txt';
  if dlgSaveText.Execute then
    begin
      redOut.Lines.SaveToFile(dlgSaveText.FileName);
      MessageDlg('Saved', TMsgDlgType.mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmMain.tlbtnSetAsDefaultClick(Sender: TObject);
var
  txtFile : TextFile;
  sWLat, sWLon, sWLatLon, sWUnit : string;
begin
  // SET DEFAULT LOCATION
  // Write Def Location to File
  if not FileExists('Def_Loc.txt') then
    begin
      // File Doesn't Exist
      Exit;
    end
  else
    begin
      // Lat Lon Param
      sWLat := lbledtLat.Text;
      sWLon := lbledtLon.Text;
      sWLatLon := sWLat + ', ' + sWLon;

      // Units Param
      sWUnit := cbbUnits.Text;

      // Write to File
      AssignFile(txtFile, 'Def_Loc.txt');
      Rewrite(txtFile);
      Writeln(txtFile, sWLatLon + '#' + sWUnit);
      CloseFile(txtFile);
      MessageDlg(sWLatLon + ' is now the default location', mtInformation, [mbOK], 0);
    end;
end;

procedure TfrmMain.tlbtnSettingsClick(Sender: TObject);
begin
  // OPEN SETTINGS
  frmSettings.Show;
end;

procedure TfrmMain.tmrTimeTimer(Sender: TObject);
begin
  // Set Statusbar Date/Time
  with statMain do
    begin
      Panels[0].Text := DateToStr(Now);
      Panels[1].Text := TimeToStr(Now);
    end;
end;

procedure TfrmMain.TrySetStyle;
var
  txtFile : TextFile;
  sTheme : string;
begin
  // SET THEME
  // Read from File
  if not FileExists('Theme.txt') then
    begin
      // File doesn't exist
      // Set Default Theme
      TStyleManager.TrySetStyle('Luna');
      Exit;
    end
  else
    begin
      // Read theme from File
      AssignFile(txtFile, 'Theme.txt');
      Reset(txtFile);
      while not Eof(txtFile) do
        begin
          Readln(txtFile, sTheme);
        end;

      // Set the Theme
      TStyleManager.TrySetStyle(sTheme);
    end;

  CloseFile(txtFile);
end;

procedure TfrmMain.Units1Click(Sender: TObject);
begin
  // CHANGE UNITS
  cbbUnits.SetFocus;
end;

procedure TfrmMain.WeatherIcon;
var
  iIcon : Integer;
begin
  // SET WEATHER ICON
 iIcon := StrToInt(mmoWeatherID.Text);
   case iIcon of
    // Thunderstorms
    200:  tbsWeather.ImageIndex := 976;
    201:  tbsWeather.ImageIndex := 976;
    202:  tbsWeather.ImageIndex := 976;
    210:  tbsWeather.ImageIndex := 976;
    211:  tbsWeather.ImageIndex := 976;
    212:  tbsWeather.ImageIndex := 976;
    221:  tbsWeather.ImageIndex := 976;
    230:  tbsWeather.ImageIndex := 976;
    231:  tbsWeather.ImageIndex := 976;
    232:  tbsWeather.ImageIndex := 976;

    //Clouds
    801:  tbsWeather.ImageIndex := 975;
    802:  tbsWeather.ImageIndex := 974;
    803:  tbsWeather.ImageIndex := 974;
    804:  tbsWeather.ImageIndex := 974;

    // Rain/Drizzle
    //Drizzle
    300:  tbsWeather.ImageIndex := 978;
    301:  tbsWeather.ImageIndex := 978;
    302:  tbsWeather.ImageIndex := 978;
    310:  tbsWeather.ImageIndex := 978;
    311:  tbsWeather.ImageIndex := 978;
    312:  tbsWeather.ImageIndex := 978;
    313:  tbsWeather.ImageIndex := 978;
    314:  tbsWeather.ImageIndex := 978;
    321:  tbsWeather.ImageIndex := 978;

    // Rain
    500:  tbsWeather.ImageIndex := 978;
    501:  tbsWeather.ImageIndex := 977;
    502:  tbsWeather.ImageIndex := 977;
    503:  tbsWeather.ImageIndex := 977;
    504:  tbsWeather.ImageIndex := 977;
    511:  tbsWeather.ImageIndex := 977;
    520:  tbsWeather.ImageIndex := 977;
    521:  tbsWeather.ImageIndex := 977;
    522:  tbsWeather.ImageIndex := 977;
    531:  tbsWeather.ImageIndex := 977;

    // Clear
    800: tbsWeather.ImageIndex := 979;
   end;

end;

end.
