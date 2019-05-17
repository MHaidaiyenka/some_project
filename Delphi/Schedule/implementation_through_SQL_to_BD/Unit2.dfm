object Form2: TForm2
  Left = 593
  Top = 447
  Caption = #1042#1089#1077' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077
  ClientHeight = 432
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 576
    Height = 399
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Day'
        Title.Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Discipline'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1077#1076#1084#1077#1090#1072
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Teacher'
        Title.Caption = #1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Type'
        Title.Caption = #1058#1080#1087' '#1087#1072#1088#1099
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Studyroom'
        Title.Caption = #1050#1072#1073#1080#1085#1077#1090
        Width = 50
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 576
    Height = 33
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 29
      Top = 8
      Width = 40
      Height = 16
      Caption = #1055#1086#1080#1089#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 75
      Top = 6
      Width = 465
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 368
    object N7: TMenuItem
      Caption = #1060#1072#1081#1083
      object N8: TMenuItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1095#1077#1090#1072
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1086#1090#1095#1077#1090#1072
        object PDF1: TMenuItem
          Caption = #1042' PDF'
          OnClick = PDF1Click
        end
        object RTF1: TMenuItem
          Caption = #1042' RTF'
          OnClick = RTF1Click
        end
        object HTML1: TMenuItem
          Caption = #1042' HTML'
          OnClick = HTML1Click
        end
      end
      object N10: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N11Click
      end
    end
    object N1: TMenuItem
      Caption = #1047#1072#1087#1080#1089#1100
      object N4: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N6Click
      end
    end
    object N2: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N2Click
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Baza1.mdb;Persist S' +
      'ecurity Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 96
    Top = 368
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 248
    Top = 368
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Baza ORDER BY Day')
    Left = 176
    Top = 368
  end
end
