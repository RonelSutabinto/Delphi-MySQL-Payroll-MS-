program fppayroll;

uses
  Forms,
  FlexiPackPayrollIntro in 'FlexiPackPayrollIntro.pas' {IntroForm},
  Data in 'Data.pas' {PayrollData: TDataModule},
  FlexMenu in 'FlexMenu.pas' {FPPayrollMainMenuForm},
  MODTOOLS in 'MODTOOLS.PAS',
  dept in 'dept.pas' {DeptForm},
  AlphaListForwardedBalance in 'AlphaListForwardedBalance.pas' {frmYearEndAlphaListFB},
  Reportform in 'Reportform.pas' {Reports},
  budgetform in 'budgetform.pas' {BudgetoptForm},
  EmpnoAccount in 'EmpnoAccount.pas' {EmpNoAccounts},
  STCSPayrollLib in 'STCSPayrollLib.pas',
  DatasetModl in 'DatasetModl.pas' {DataSetMod: TDataModule},
  YearlyAlphalist in 'YearlyAlphalist.pas' {AnnualAlphalist},
  pagibigsavingsFrm in 'pagibigsavingsFrm.pas' {pagibigsavings},
  searchemployeeFrm in 'searchemployeeFrm.pas' {searchEmployee},
  pagibigsavingsDetail in 'pagibigsavingsDetail.pas' {pagibigsavingsDetailsFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TIntroForm, IntroForm);
  Application.CreateForm(TPayrollData, PayrollData);
  Application.CreateForm(TReports, Reports);
  Application.CreateForm(TBudgetoptForm, BudgetoptForm);
  Application.CreateForm(TEmpNoAccounts, EmpNoAccounts);
  Application.CreateForm(TDataSetMod, DataSetMod);
  Application.CreateForm(TAnnualAlphalist, AnnualAlphalist);
  Application.CreateForm(Tpagibigsavings, pagibigsavings);
  Application.CreateForm(TsearchEmployee, searchEmployee);
  Application.CreateForm(TpagibigsavingsDetailsFrm, pagibigsavingsDetailsFrm);
  Application.Run;
end.
