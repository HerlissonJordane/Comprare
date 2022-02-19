unit U_cadastra_prod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TFrm_cad_prod = class(TForm)
    LblEdit_cod_prod: TLabeledEdit;
    LblEdit_nome: TLabeledEdit;
    DBLookupComboBox_unidade: TDBLookupComboBox;
    Label1: TLabel;
    ADOQuery_unidade: TADOQuery;
    DataSource_unidade: TDataSource;
    Btn_salvar: TButton;
    Btn_cancelar: TButton;
    ADOQuery_aux: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_salvarClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
    unidade: Integer;
  public
    { Public declarations }
  end;

var
  Frm_cad_prod: TFrm_cad_prod;

implementation
uses U_principal;

{$R *.dfm}

procedure TFrm_cad_prod.Btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_cad_prod.Btn_salvarClick(Sender: TObject);
begin
  Try
    ADOQuery_aux.Close;
    ADOQuery_aux.SQL.Clear;
    ADOQuery_aux.SQL.Add('INSERT INTO produtos VALUES('
                                               +chr(39)+LblEdit_nome.Text+chr(39)+', '
                                               +chr(39)+IntToStr(DBLookupComboBox_unidade.KeyValue)+chr(39)+' )'
                                               );
    ADOQuery_aux.ExecSQL;
    ShowMessage('Cadastro realizado com sucesso!');
  Except
    ShowMessage('Erro ao gravar no banco de dados!'+#13+'Verifique a conexão e tenta novamente.');
    LblEdit_nome.SetFocus;
  End;
  LblEdit_nome.Text:= '';
  DBLookupComboBox_unidade.KeyValue:= unidade;
  LblEdit_nome.SetFocus;
end;

procedure TFrm_cad_prod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrm_cad_prod.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin  //se apertar enter, pula de campo também.
    Perform(WM_nextdlgctl,0,0)
  end else if Key =  #27 then begin
    Perform(WM_nextdlgctl,1,0)
  end;
end;

procedure TFrm_cad_prod.FormShow(Sender: TObject);
begin
  Try
    ADOQuery_unidade.Close;
    ADOQuery_unidade.SQL.Clear;
    ADOQuery_unidade.SQL.Add('SELECT cod_und, descricao FROM unidades ORDER BY DESCRICAO');
    ADOQuery_unidade.Open;
    unidade:= ADOQuery_unidade.FieldByName('cod_und').AsInteger;
    DBLookupComboBox_unidade.KeyValue:= unidade;
  Except
    ShowMessage('Erro ao carregar lista de unidades.');
  End;
  LblEdit_cod_prod.Enabled:= False;
  LblEdit_nome.SetFocus;
end;

end.
