object Form1: TForm1
  Left = 192
  Top = 114
  Caption = #1048#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1103' '#1092#1091#1085#1082#1094#1080#1081
  ClientHeight = 564
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 191
    Top = 24
    Width = 165
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1091#1079#1083#1086#1074' '#1080#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1080
  end
  object Label2: TLabel
    Left = 191
    Top = 95
    Width = 165
    Height = 13
    Caption = #1058#1086#1095#1082#1072' '#1076#1083#1103' '#1085#1072#1093#1086#1078#1076#1077#1085#1080#1103' '#1079#1085#1072#1095#1077#1085#1080#1103
  end
  object Label3: TLabel
    Left = 191
    Top = 136
    Width = 52
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
  end
  object PaintBox1: TPaintBox
    Left = 184
    Top = 168
    Width = 489
    Height = 369
  end
  object Button1: TButton
    Left = 536
    Top = 90
    Width = 137
    Height = 64
    Caption = #1048#1085#1090#1077#1088#1087#1086#1083#1080#1088#1086#1074#1072#1090#1100'!'
    TabOrder = 0
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 8
    Width = 134
    Height = 529
    ColCount = 2
    FixedCols = 0
    RowCount = 21
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goTabs]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    ColWidths = (
      64
      64)
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
      24
      24)
  end
  object Edit2: TEdit
    Left = 384
    Top = 92
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 385
    Top = 133
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object RadioButton1: TRadioButton
    Left = 191
    Top = 58
    Width = 209
    Height = 17
    Caption = #1048#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1103' '#1087#1086' '#1084#1077#1090#1086#1076#1091' '#1051#1072#1075#1088#1072#1085#1078#1072
    TabOrder = 4
  end
  object RadioButton2: TRadioButton
    Left = 416
    Top = 58
    Width = 225
    Height = 17
    Caption = #1048#1085#1090#1077#1088#1087#1086#1083#1103#1094#1080#1103' '#1082#1091#1073#1080#1095#1077#1089#1082#1080#1084#1080' '#1089#1087#1083#1072#1081#1085#1072#1084#1080
    TabOrder = 5
  end
  object ListBox1: TListBox
    Left = 384
    Top = 24
    Width = 57
    Height = 17
    ItemHeight = 13
    Items.Strings = (
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20')
    TabOrder = 6
    OnClick = ListBox1Click
  end
end
