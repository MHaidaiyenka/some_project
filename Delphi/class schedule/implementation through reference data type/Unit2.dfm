object Form2: TForm2
  Left = 680
  Top = 332
  Caption = #1042#1089#1077' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
  ClientHeight = 427
  ClientWidth = 687
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 3
    Top = 4
    Width = 42
    Height = 14
    Caption = #1055#1054#1048#1057#1050
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 604
    Top = 24
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 604
    Top = 104
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 604
    Top = 184
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = Button4Click
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 24
    Width = 598
    Height = 395
    Color = clWhite
    FixedCols = 0
    RowCount = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
    TabOrder = 3
    ColWidths = (
      106
      165
      138
      109
      50)
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object Button3: TButton
    Left = 604
    Top = 64
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 49
    Top = 2
    Width = 467
    Height = 21
    TabOrder = 5
  end
  object Button5: TButton
    Left = 520
    Top = 1
    Width = 67
    Height = 23
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 604
    Top = 144
    Width = 75
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 7
    OnClick = Button6Click
  end
  object MainMenu1: TMainMenu
    Left = 632
    Top = 232
    object N1: TMenuItem
      Caption = #1052#1077#1085#1102
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N4Click
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object N2: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N2Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 632
    Top = 288
  end
end
