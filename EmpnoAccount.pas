unit EmpnoAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, NxCollection, Grids, DBGrids,
  CRGrid, ExtCtrls;

type
  TEmpNoAccounts = class(TForm)
    quEmpnoAcc: TMyQuery;
    NxHeaderPanel1: TNxHeaderPanel;
    dsquEmpnoAcc: TMyDataSource;
    Panel1: TPanel;
    CRDBGrid1: TCRDBGrid;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    NxButton3: TNxButton;
    quEmpnoAccidemployee: TLongWordField;
    quEmpnoAccName: TStringField;
    quEmpnoAccRP: TLargeintField;
    quEmpnoAccLargeintField13th: TLargeintField;
    quEmpnoAccRice: TLargeintField;
    quEmpnoAccOvertime: TLargeintField;
    quEmpnoAccCP: TLargeintField;
    quEmpnoAccOtherPayroll: TLargeintField;
    quEmpnoAccdescription: TStringField;
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmpNoAccounts: TEmpNoAccounts;

implementation

uses Data;

{$R *.dfm}

procedure TEmpNoAccounts.NxButton1Click(Sender: TObject);
begin
  quEmpnoAcc.Close;
  quEmpnoAcc.ParamByName('stat').Text := 'R';
  quEmpnoAcc.Open;

  crdbgrid1.Columns.Items[3].Visible := false;
  crdbgrid1.Columns.Items[2].Visible := true;
end;

procedure TEmpNoAccounts.NxButton2Click(Sender: TObject);
begin
  quEmpnoAcc.Close;
  quEmpnoAcc.ParamByName('stat').Text := 'C';
  quEmpnoAcc.Open;
  crdbgrid1.Columns.Items[2].Visible := false;
  crdbgrid1.Columns.Items[3].Visible := true;
end;

procedure TEmpNoAccounts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
   EmpNoAccounts := Nil;
end;

procedure TEmpNoAccounts.NxButton3Click(Sender: TObject);
begin
 Close;
end;

end.
