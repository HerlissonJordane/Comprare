unit U_cadastra_comercio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrm_cad_comercio = class(TForm)
    LblEdit_cod_loja: TLabeledEdit;
    LblEdit_nome: TLabeledEdit;
    LblEdit_rua: TLabeledEdit;
    LblEdit_cidade: TLabeledEdit;
    LblEdit_uf: TLabeledEdit;
    DBLookupComboBox_categoria: TDBLookupComboBox;
    Label1: TLabel;
    ADOQuery_categoria: TADOQuery;
    DataSource_categoria: TDataSource;
    LblEdit_numero: TLabeledEdit;
    ADOQuery_cad_loja: TADOQuery;
    LblEdit_bairro: TLabeledEdit;
    Btn_salvar: TButton;
    Btn_cancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_salvarClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    categoria: Integer;
  public
    { Public declarations }
  end;

var
  Frm_cad_comercio: TFrm_cad_comercio;

implementation
uses U_principal, U_comercios;

{$R *.dfm}

procedure TFrm_cad_comercio.Btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_cad_comercio.Btn_salvarClick(Sender: TObject);
begin
  try
    ADOQuery_cad_loja.Close;
    ADOQuery_cad_loja.SQL.Clear;
    ADOQuery_cad_loja.SQL.Add('INSERT INTO comercio VALUES('+chr(39)+LblEdit_nome.Text+chr(39)+','
                                                            +chr(39)+LblEdit_rua.Text+chr(39)+','
                                                            +chr(39)+LblEdit_numero.Text+chr(39)+','
                                                            +chr(39)+LblEdit_bairro.Text+chr(39)+','
                                                            +chr(39)+LblEdit_cidade.Text+chr(39)+','
                                                            +chr(39)+LblEdit_uf.Text+chr(39)+','
                                                            +chr(39)+IntToStr(DBLookupComboBox_categoria.KeyValue)+chr(39)+')');
    ADOQuery_cad_loja.ExecSQL;

    Application.MessageBox('Cadastrado com sucesso!', 'Informação', mb_Ok+mb_IconInformation+mb_DefButton1);
    Close;
    Frm_comercios.FormShow(Self);
//    LblEdit_nome.Text:= '';
//    LblEdit_rua.Text:= '';
//    LblEdit_numero.Text:= '';
//    LblEdit_bairro.Text:= '';
//    LblEdit_cidade.Text:= '';
//    LblEdit_uf.Text:= '';
//    DBLookupComboBox_categoria.KeyValue:= categoria;
//    LblEdit_nome.SetFocus;

  except
    Application.MessageBox('Erro ao gravar. Verifique o motivo!', 'Alerta', mb_Ok+mb_IconError+mb_DefButton1);
//    ShowMessage('Erro ao gravar. Verifique o motivo!');
  end;
end;

procedure TFrm_cad_comercio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree; //limpa a instância da memória quando fechar
end;

procedure TFrm_cad_comercio.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin  //se apertar enter, pula de campo também.
    Perform(WM_nextdlgctl,0,0)
  end else if Key =  #27 then begin
    Perform(WM_nextdlgctl,1,0)
  end;

end;

procedure TFrm_cad_comercio.FormShow(Sender: TObject);
begin
  try
    ADOQuery_categoria.Close;
    ADOQuery_categoria.SQL.Clear;
    ADOQuery_categoria.SQL.Add('SELECT * FROM CAT_COMERCIO ORDER BY CATEGORIA');
    ADOQuery_categoria.Open;
    //se for alteração, mantem a categoria certa no lookUp
    if Frm_comercios.acao = 'I' then begin
      categoria:= ADOQuery_categoria.FieldByName('cod_cat').AsInteger;
      DBLookupComboBox_categoria.KeyValue:= categoria; //recebe o primeiro por ordem alfabética
    end;

    LblEdit_cod_loja.Enabled:= False;
    LblEdit_nome.SetFocus;
  Except
    ShowMessage('Houve um erro de conexão. Tente novamente ou verifique a rede interna.');
    //tem que colocar algo aqui ainda
  end;
end;

end.
