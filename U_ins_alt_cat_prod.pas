unit U_ins_alt_cat_prod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrm_ins_alt_cat_prod = class(TForm)
    SB_salvar: TSpeedButton;
    SB_cancelar: TSpeedButton;
    LblEdit_cod: TLabeledEdit;
    LblEdit_categoria: TLabeledEdit;
    ADOQuery_cat_prod: TADOQuery;
    procedure SB_salvarClick(Sender: TObject);
    procedure SB_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LblEdit_categoriaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ins_alt_cat_prod: TFrm_ins_alt_cat_prod;

implementation

uses U_cad_cat_prod;

{$R *.dfm}

procedure TFrm_ins_alt_cat_prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrm_ins_alt_cat_prod.FormShow(Sender: TObject);
begin
  LblEdit_cod.Enabled:= False;
end;

procedure TFrm_ins_alt_cat_prod.LblEdit_categoriaKeyPress(Sender: TObject;
  var Key: Char);
begin //se apertar enter no campo de categoria, já salva
  if Key = #13 then begin
    SB_salvar.Click();
  end;

end;

procedure TFrm_ins_alt_cat_prod.SB_salvarClick(Sender: TObject);
var msg: String;
begin
  if LblEdit_categoria.Text = '' then begin
    ShowMessage('O campo de categoria não pode ser vazio!');
    LblEdit_categoria.SetFocus;
    Abort;
  end;

  ADOQuery_cat_prod.Close;
  ADOQuery_cat_prod.SQL.Clear;

  if LblEdit_cod.Text = '' then begin
    ADOQuery_cat_prod.SQL.Add('insert into cat_produto values('+chr(39)+LblEdit_categoria.Text+chr(39)+')');
    msg:= 'Cadastro realizado com sucesso!';
  end else begin
    ADOQuery_cat_prod.SQL.Add('update cat_produto set '+
                              'nome_cat = '+chr(39)+LblEdit_categoria.Text+chr(39)+
                              ' where '+chr(39)+LblEdit_cod.Text+chr(39)+' = cod_cat_prod');
    msg:= 'Alteração realizada com sucesso!';
  end;

  try
    ADOQuery_cat_prod.ExecSQL;
    Application.MessageBox(pchar(msg),'Informação',mb_Ok+mb_IconInformation+mb_DefButton1);
//    ShowMessage(msg);
    Frm_cad_cat_prod.FormShow(Self);
    Close;
  Except
    Application.MessageBox('Erro ao cadastrar categoria','ERRO',mb_Ok+mb_IconError+mb_DefButton1);
  end;

end;

procedure TFrm_ins_alt_cat_prod.SB_cancelarClick(Sender: TObject);
begin
  Close;
end;

end.
