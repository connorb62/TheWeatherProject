object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Settings'
  ClientHeight = 304
  ClientWidth = 398
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  StyleElements = [seFont, seClient]
  PixelsPerInch = 96
  TextHeight = 13
  object clbrMain: TCoolBar
    Left = 0
    Top = 0
    Width = 398
    Height = 26
    AutoSize = True
    Bands = <
      item
        Control = tlbrMain
        ImageIndex = -1
        MinHeight = 22
        Width = 392
      end>
    object tlbrMain: TToolBar
      Left = 11
      Top = 0
      Width = 383
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
  object pgcSettings: TPageControl
    Left = 0
    Top = 26
    Width = 398
    Height = 278
    ActivePage = tbsPersonalisation
    Align = alClient
    Images = frmMain.imglstIcons
    TabOrder = 1
    StyleElements = [seFont]
    object tbsPersonalisation: TTabSheet
      Caption = 'Personalisation'
      ImageIndex = 245
      object grpTheme: TGroupBox
        Left = 0
        Top = 0
        Width = 390
        Height = 65
        Align = alTop
        Caption = 'Theme'
        TabOrder = 0
        StyleElements = []
        object cbbTheme: TComboBox
          Left = 16
          Top = 24
          Width = 145
          Height = 21
          TabOrder = 0
          Text = 'Luna'
          StyleElements = []
          OnChange = cbbThemeChange
          Items.Strings = (
            'Windows'
            'Emerald Light Slate'
            'Luna')
        end
      end
      object pnlBase: TPanel
        Left = 0
        Top = 199
        Width = 390
        Height = 50
        Align = alBottom
        ParentBackground = False
        TabOrder = 1
        ExplicitTop = 200
        object btnSave: TButton
          Left = 211
          Top = 13
          Width = 75
          Height = 25
          Caption = 'Save'
          Enabled = False
          TabOrder = 0
          StyleElements = []
          OnClick = btnSaveClick
        end
        object btnClose: TButton
          Left = 304
          Top = 13
          Width = 75
          Height = 25
          Caption = 'Close'
          TabOrder = 1
          StyleElements = []
          OnClick = btnCloseClick
        end
        object btnDefault: TButton
          Left = 10
          Top = 13
          Width = 75
          Height = 25
          Caption = 'Default'
          Enabled = False
          TabOrder = 2
          StyleElements = []
          OnClick = btnDefaultClick
        end
      end
    end
  end
end
