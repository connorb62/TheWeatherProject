object frmAnalytics: TfrmAnalytics
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Analytics'
  ClientHeight = 389
  ClientWidth = 556
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  StyleElements = [seFont, seClient]
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object clbrMain: TCoolBar
    Left = 0
    Top = 0
    Width = 556
    Height = 26
    AutoSize = True
    Bands = <
      item
        Control = tlbrMain
        ImageIndex = -1
        MinHeight = 22
        Width = 550
      end>
    object tlbrMain: TToolBar
      Left = 11
      Top = 0
      Width = 541
      Height = 22
      AutoSize = True
      Caption = 'tlbrMain'
      Images = frmMain.imglstIcons
      TabOrder = 0
      object tlbtnClose: TToolButton
        Left = 0
        Top = 0
        Caption = 'tlbtnClose'
        ImageIndex = 177
        OnClick = tlbtnCloseClick
      end
    end
  end
  object pgcMain: TPageControl
    Left = 0
    Top = 26
    Width = 556
    Height = 363
    ActivePage = tbsWeather
    Align = alClient
    Images = frmMain.imglstIcons
    TabOrder = 1
    StyleElements = []
    object tbsWeather: TTabSheet
      Caption = 'Weather'
      ImageIndex = 977
      object pgcWeather: TPageControl
        Left = 0
        Top = 0
        Width = 548
        Height = 334
        ActivePage = tbsParameters
        Align = alClient
        Images = frmMain.imglstIcons
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        StyleElements = []
        object tbsParameters: TTabSheet
          Caption = 'Parameters'
          ImageIndex = 674
          object strWP: TStringGrid
            Left = 0
            Top = 0
            Width = 520
            Height = 326
            Align = alClient
            ColCount = 2
            DefaultColWidth = 250
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 3
            TabOrder = 0
            StyleElements = []
          end
        end
        object tbsAPI: TTabSheet
          Caption = 'API'
          ImageIndex = 989
          object strWAPI: TStringGrid
            Left = 0
            Top = 0
            Width = 520
            Height = 326
            Align = alClient
            ColCount = 2
            DefaultColWidth = 250
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 3
            FixedRows = 0
            TabOrder = 0
            StyleElements = []
          end
        end
      end
    end
    object tbsAQI: TTabSheet
      Caption = 'Air Quality'
      ImageIndex = 209
      object pgcAQI: TPageControl
        Left = 0
        Top = 0
        Width = 548
        Height = 334
        ActivePage = tbsParamAQI
        Align = alClient
        Images = frmMain.imglstIcons
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        StyleElements = []
        object tbsParamAQI: TTabSheet
          Caption = 'Parameters'
          ImageIndex = 674
          object strAQIP: TStringGrid
            Left = 0
            Top = 0
            Width = 520
            Height = 326
            Align = alClient
            ColCount = 2
            DefaultColWidth = 250
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            TabOrder = 0
            StyleElements = []
          end
        end
        object tbsAQIAPI: TTabSheet
          Caption = 'API'
          ImageIndex = 989
          object strAQIA: TStringGrid
            Left = 0
            Top = 0
            Width = 520
            Height = 326
            Align = alClient
            ColCount = 2
            DefaultColWidth = 250
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 3
            FixedRows = 0
            TabOrder = 0
            StyleElements = []
          end
        end
      end
    end
  end
end
