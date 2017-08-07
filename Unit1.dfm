object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'PHPDiagnosis'
  ClientHeight = 356
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 5
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 5
    Top = 5
    Width = 423
    Height = 274
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'URL(s)'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 415
        Height = 246
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        OnKeyPress = Memo1KeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Result'
      ImageIndex = 1
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 415
        Height = 246
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        OnKeyPress = Memo1KeyPress
      end
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 279
    Width = 423
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object ProgressBar1: TProgressBar
      Left = 0
      Top = 6
      Width = 423
      Height = 38
      Align = alBottom
      TabOrder = 0
      Visible = False
    end
    object Button1: TButton
      Left = 350
      Top = 5
      Width = 73
      Height = 39
      Caption = 'Diagnose'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 5
    Top = 323
    Width = 423
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 329
    object Label1: TLabel
      Left = 366
      Top = 12
      Width = 53
      Height = 13
      Cursor = crHandPoint
      Alignment = taRightJustify
      Caption = 'by Kilhonet'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label1Click
    end
  end
end
