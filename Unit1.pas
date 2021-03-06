unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  K.HTTP, K.Strings, Winapi.ShellAPI;

type
  TFrmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    Panel1: TPanel;
    Memo2: TMemo;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    URLFile: string;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

function GetStatusFromJSON(Data: string; var Host: string; Files: TStrings): integer;
var
  Temp, Item: string;
  Loop, ItemPos: integer;
begin
  Result := 0;

  Host := Parsing(Data, '"host":"', '"');
  Temp := Parsing(Data, '"suspicion":[', ']');

  ItemPos := 1;
  while True do
  begin
    Item := Parsing(Temp, '"', '"', ItemPos);
    if Item = '' then Break;

    Item := EscapeDecode(Item);
    Files.Add(Item);
    Inc(Result);
  end;
end;

procedure TFrmMain.Button1Click(Sender: TObject);
var
  HTTP: THTTP;
  Files: TStringList;
  Data, URL, Host, FileName: string;
  Loop, Loop2: integer;
begin
  ProgressBar1.Visible := True;
  ProgressBar1.Max := Memo1.Lines.Count;
  Button1.Visible := False;

  Memo2.Lines.Clear;

  for Loop := 0 to Memo1.Lines.Count-1 do
  begin
    ProgressBar1.Position := Loop;

    URL := Trim(Memo1.Lines.Strings[Loop]);
    if URL = '' then Continue;
    if URL[1] = '#' then Continue;

    HTTP := THTTP.Create;
    Data := HTTP.Get(URL);
    HTTP.Free;

    Files := TStringList.Create;

    if GetStatusFromJSON(Data, Host, Files)>0 then
    begin
      Memo2.Lines.Add('Host: '+Host);

      for Loop2 := 0 to Files.Count-1 do
        Memo2.Lines.Add(Files.Strings[Loop2]);

      Memo2.Lines.Add('');
    end;

    Files.Free;
  end;

  ProgressBar1.Position := 0;
  ProgressBar1.Visible := False;
  Button1.Visible := True;
end;

procedure TFrmMain.Label1Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://go.kilho.net?id=phpdiagnosis', nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmMain.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^A then
  begin
    (Sender as TMemo).SelectAll;
    Key := #0;
  end;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Memo1.Lines.SaveToFile(URLFile);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  URLFile := ExtractFilePath(Application.ExeName)+'PHPDiagnosis.txt';

  if FileExists(URLFile) then
    Memo1.Lines.LoadFromFile(URLFile);
end;

end.
