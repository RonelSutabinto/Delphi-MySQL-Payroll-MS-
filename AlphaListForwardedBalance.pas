unit AlphaListForwardedBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBAccess, MyAccess, Grids, DBGrids,
  CRGrid, NxEdit, NxCollection, MemDS, Mask, DBCtrls;

type
  TfrmYearEndAlphaListFB = class(TForm)
    ForwardedBalance: TMyQuery;
    quemployee: TMyQuery;
    NxLabel1: TNxLabel;
    neSearch: TNxEdit;
    crdbEmployeeList: TCRDBGrid;
    dsquEmployee: TMyDataSource;
    dsForwardedBalance: TMyDataSource;
    crdbForwardedBalance: TCRDBGrid;
    nlAddFB: TNxLabel;
    nlEditFB: TNxLabel;
    nlDeleteFB: TNxLabel;
    rgSearchOption: TRadioGroup;
    nhpAlphaList: TNxHeaderPanel;
    NxLabel2: TNxLabel;
    NxLabel3: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel5: TNxLabel;
    NxLabel6: TNxLabel;
    NxLabel7: TNxLabel;
    NxLabel8: TNxLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    DBEdit8: TDBEdit;
    NxLabel9: TNxLabel;
    ForwardedBalanceidEmployee: TLargeintField;
    ForwardedBalanceempnumber: TStringField;
    ForwardedBalancebionumber: TStringField;
    ForwardedBalancebenefits: TFloatField;
    ForwardedBalanceLastName: TStringField;
    ForwardedBalanceFirstName: TStringField;
    ForwardedBalanceMiddleName: TStringField;
    ForwardedBalancenonTaxable: TFloatField;
    ForwardedBalanceTaxable: TFloatField;
    ForwardedBalanceWTax: TFloatField;
    quemployeeidemployee: TLongWordField;
    quemployeeempnumber: TStringField;
    quemployeebionumber: TStringField;
    quemployeeLastName: TStringField;
    quemployeeFirstName: TStringField;
    quemployeeMiddleName: TStringField;
    procedure dsForwardedBalanceStateChange(Sender: TObject);
    procedure dsquEmployeeDataChange(Sender: TObject; Field: TField);
    procedure neSearchChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure nlAddFBClick(Sender: TObject);
    procedure nlEditFBClick(Sender: TObject);
    procedure nlDeleteFBClick(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    procedure SelectEmployee();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmYearEndAlphaListFB: TfrmYearEndAlphaListFB;

implementation

uses Data;

{$R *.dfm}

procedure TfrmYearEndAlphaListFB.SelectEmployee;
begin
  ForwardedBalanceidEmployee.Text := quemployeeidemployee.Text;
  ForwardedBalanceempnumber.Text  := quemployeeempnumber.Text;
  ForwardedBalancebionumber.Text  := quemployeebionumber.Text;
  ForwardedBalanceFirstName.Text  := quemployeeFirstName.Text;
  ForwardedBalanceLastName.Text   := quemployeeLastName.Text;
  ForwardedBalanceMiddleName.Text := quemployeeMiddleName.Text;
end;

procedure TfrmYearEndAlphaListFB.dsForwardedBalanceStateChange(
  Sender: TObject);
begin
  nlAddFB.Visible      := ForwardedBalance.State = dsBrowse;
  nlEditFB.Visible     := nlAddFB.Visible and (ForwardedBalance.RecordCount > 1);
  nlDeleteFB.Visible   := nlEditFB.Visible;
  nhpAlphaList.Visible := ForwardedBalance.State in [dsInsert,dsEdit];
  if nhpAlphaList.Visible then
   begin
     nhpAlphaList.Left := 64;
     nhpAlphaList.Top  := 96;
   end;
end;

procedure TfrmYearEndAlphaListFB.dsquEmployeeDataChange(Sender: TObject;
  Field: TField);
begin
  crdbEmployeeList.Visible := (quemployee.RecordCount > 0) and
                              (not quemployee.IsEmpty);
  if crdbEmployeeList.Visible then
   begin
     crdbEmployeeList.Left := 120;
     crdbEmployeeList.Top  := 168;
   end;
end;

procedure TfrmYearEndAlphaListFB.neSearchChange(Sender: TObject);
begin
  case rgSearchOption.ItemIndex of
   0 : ForwardedBalance.FilterSQL := 'afb.empnumber like ' + QuotedStr(neSearch.Text + '%');
   1 : ForwardedBalance.FilterSQL := 'afb.bionumber like ' + QuotedStr(neSearch.Text + '%');
   2 : ForwardedBalance.FilterSQL := 'e.Lastname like ' + QuotedStr(neSearch.Text + '%');
   3 : ForwardedBalance.FilterSQL := 'e.Firstname like ' + QuotedStr(neSearch.Text + '%');
  end;
end;

procedure TfrmYearEndAlphaListFB.DBEdit1Change(Sender: TObject);
begin
  if Length(DBEdit1.Text) >= 3 then
   begin
     quemployee.FilterSQL := '(FirstName like '+ QuotedStr(dbedit1.Text + '%') +') or '+
                             '(LastName like ' + QuotedStr(dbedit1.Text + '%') +') or '+
                             '(empNumber like ' + QuotedStr(dbedit1.Text + '%') + ') or ' +
                             '(bioNumber like ' + QuotedStr(dbedit1.Text + '%') + ')';
     if quemployee.State = dsInactive then quemployee.Open;
   end
  else
   begin
     quemployee.Close;
     quemployee.FilterSQL := '';
   end;
end;

procedure TfrmYearEndAlphaListFB.nlAddFBClick(Sender: TObject);
begin
  ForwardedBalance.Append;
  DBEdit1.SetFocus;
end;

procedure TfrmYearEndAlphaListFB.nlEditFBClick(Sender: TObject);
begin
  ForwardedBalance.Edit;
  DBEdit1.SetFocus;
end;

procedure TfrmYearEndAlphaListFB.nlDeleteFBClick(Sender: TObject);
begin
  if (MessageDlg('Do you want to delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) in [mrNo, mrNone]) then exit;
  ForwardedBalance.Delete;
end;

procedure TfrmYearEndAlphaListFB.NxButton1Click(Sender: TObject);
begin
  ForwardedBalance.Post;
end;

procedure TfrmYearEndAlphaListFB.NxButton2Click(Sender: TObject);
begin
  ForwardedBalance.Cancel;
end;

procedure TfrmYearEndAlphaListFB.FormShow(Sender: TObject);
begin
  ForwardedBalance.Open;
end;

procedure TfrmYearEndAlphaListFB.DBEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
   begin
     if quemployee.RecordCount = 1 then
   end;
end;

end.
