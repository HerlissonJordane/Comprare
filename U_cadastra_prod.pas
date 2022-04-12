unit U_cadastra_prod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, JvExControls,
  JvDBLookup;

type
  TFrm_cad_prod = class(TForm)
    LblEdit_cod_prod: TLabeledEdit;
    LblEdit_nome: TLabeledEdit;
    Label1: TLabel;
    ADOQuery_unidade: TADOQuery;
    DataSource_unidade: TDataSource;
    Btn_salvar: TButton;
    Btn_cancelar: TButton;
    ADOQuery_aux: TADOQuery;
    Label2: TLabel;
    ADOQuery_categoria: TADOQuery;
    DataSource_categoria: TDataSource;
    ImageList1: TImageList;
    Btn_add_categoria: TButton;
    JvDBLookupCombo_categoria: TJvDBLookupCombo;
    JvDBLookupCombo_unidade: TJvDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_salvarClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure Btn_add_categoriaClick(Sender: TObject);
  private
    { Private declarations }
    unidade, categoria: Integer;
  public
    { Public declarations }
    bookmark: TBookMark;
  end;

var
  Frm_cad_prod: TFrm_cad_prod;

implementation
uses U_principal, U_produtos, U_ins_alt_cat_prod;

{$R *.dfm}

procedure TFrm_cad_prod.Btn_add_categoriaClick(Sender: TObject);
begin
  Frm_ins_alt_cat_prod:= TFrm_ins_alt_cat_prod.Create(Application);
  Frm_ins_alt_cat_prod.ShowModal;
  JvDBLookupCombo_categoria.Refresh;
end;

procedure TFrm_cad_prod.Btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_cad_prod.Btn_salvarClick(Sender: TObject);
var msg: String;
begin
  if LblEdit_nome.Text = '' then begin
    ShowMessage('O campo de produto não pode ser vazio!');
    Abort;
    LblEdit_nome.SetFocus;
  end;

  //pega a posição do registro atual no Grid
  bookmark:= Frm_produtos.ADODataSet1.Bookmark;
  ADOQuery_aux.Close;
  ADOQuery_aux.SQL.Clear;

  Try
    if LblEdit_cod_prod.Text = '' then begin
      ADOQuery_aux.SQL.Add('INSERT INTO produtos VALUES('
                                           +chr(39)+LblEdit_nome.Text+chr(39)+', '
                                           +chr(39)+IntToStr(JvDBLookupCombo_unidade.KeyValue)+chr(39)+', '
                                           +chr(39)+IntToStr(JvDBLookupCombo_categoria.KeyValue)+chr(39)+')'
                                           );
      ADOQuery_aux.ExecSQL;
      msg:= 'Cadastro realizado com sucesso!';
      Application.MessageBox(pChar(msg),'Informação',mb_Ok+mb_IconInformation+mb_DefButton1);

      LblEdit_cod_prod.Text:= '';
      LblEdit_nome.Text:= '';
      //DBLookupComboBox_unidade.KeyValue:= unidade;
      LblEdit_nome.SetFocus;

    end else begin
      ADOQuery_aux.SQL.Add('update produtos set '+
                           'nome = '+chr(39)+LblEdit_nome.Text+chr(39)+', '+
                           'cod_und = '+chr(39)+IntToStr(JvDBLookupCombo_unidade.KeyValue)+chr(39)+','+
                           'cod_cat_prod = '+chr(39)+IntToStr(JvDBLookupCombo_categoria.KeyValue)+chr(39)+
                           ' where '+chr(39)+LblEdit_cod_prod.Text+chr(39)+' = cod_prod');
      msg:= 'Alteração realizada com sucesso!';
      ADOQuery_aux.ExecSQL;
      Application.MessageBox(pChar(msg),'Informação',mb_Ok+mb_IconInformation+mb_DefButton1);
      Close;
    end;

    Frm_produtos.ADODataSet1.Active:= False;
    Frm_produtos.ADODataSet1.Active:= True;
  Except
    msg:= 'Erro ao gravar no banco de dados!'+#13+'Verifique a conexão e tenta novamente.';
    Application.MessageBox(pChar(msg),'ERRO',mb_Ok+mb_IconError+mb_DefButton1);
    LblEdit_nome.SetFocus;
  End;

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
    ADOQuery_unidade.Open;
    unidade:= ADOQuery_unidade.FieldByName('cod_und').AsInteger;
    JvDBLookupCombo_unidade.KeyValue:= unidade;
  Except
    ShowMessage('Erro ao carregar lista de unidades.');
    Abort;
  End;

  Try
    ADOQuery_categoria.Open;
    categoria:= ADOQuery_categoria.FieldByName('cod_cat_prod').AsInteger;
    JvDBLookupCombo_categoria.KeyValue:= categoria;
  Except
    ShowMessage('Erro ao carregar lista de categorias.');
    Abort;
  End;

  LblEdit_cod_prod.Enabled:= False;
  LblEdit_nome.SetFocus;
end;

end.
