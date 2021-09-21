unit DatasetModl;

interface

uses
  SysUtils, Classes, DB, MemDS, DBAccess, MyAccess;

type
  TDataSetMod = class(TDataModule)
    MLCS: TMyQuery;
    quBudgetChart: TMyQuery;
    SearchOPid: TMyQuery;
    quBudgetInsert: TMyQuery;
    InsertRegDeductToBudget: TMyQuery;
    DelPmDeduction: TMyQuery;
    SelectAccountchart: TMyQuery;
    Massdelete: TMyQuery;
    SearchOPididopmaster: TLongWordField;
    InsertRegDeductToBudgetfirstname: TStringField;
    InsertRegDeductToBudgetlastname: TStringField;
    InsertRegDeductToBudgetmiddlename: TStringField;
    InsertRegDeductToBudgetpagibigno: TStringField;
    InsertRegDeductToBudgetsssnumber: TStringField;
    InsertRegDeductToBudgetphilhealthid: TStringField;
    InsertRegDeductToBudgettin: TStringField;
    InsertRegDeductToBudgetMonthlySalaryCredit: TStringField;
    InsertRegDeductToBudgetBracketNum: TStringField;
    InsertRegDeductToBudgetname: TStringField;
    InsertRegDeductToBudgetpaymonth: TDateField;
    InsertRegDeductToBudgetemployeecontribution: TFloatField;
    InsertRegDeductToBudgetemployercontribution: TFloatField;
    InsertRegDeductToBudgetemployeecompensation: TFloatField;
    InsertRegDeductToBudgetdescription: TStringField;
    InsertRegDeductToBudgetarea: TStringField;
    quBudgetChartidchart: TLongWordField;
    quBudgetChartidpcode: TLongWordField;
    quBudgetChartdescription: TStringField;
    quBudgetChartarea: TStringField;
    quBudgetChartaccountcode: TStringField;
    quBudgetChartaccountname: TStringField;
    quBudgetChartpcode: TStringField;
    quBudgetChartname: TStringField;
    quBudgetInsertNumRec: TLargeintField;
    quBudgetInsertGross: TFloatField;
    quBudgetInsertPayrollDeduction: TFloatField;
    quBudgetInsertarea: TStringField;
    quBudgetInsertdescription: TStringField;
    SelectAccountchartidEmployee: TLargeintField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataSetMod: TDataSetMod;

implementation

{$R *.dfm}

end.
