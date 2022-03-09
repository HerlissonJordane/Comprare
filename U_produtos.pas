unit U_produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TFrm_produtos = class(TForm)
    LblEdit_categoria: TLabeledEdit;
    Btn_cancelar: TButton;
    DBGrid1: TDBGrid;
    Btn_inserir: TButton;
    Btn_alterar: TButton;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    LabeledEdit1: TLabeledEdit;
    procedure Btn_inserirClick(Sender: TObject);
    procedure Btn_alterarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_produtos: TFrm_produtos;

implementation

uses U_cadastra_prod;

{$R *.dfm}

procedure TFrm_produtos.Btn_alterarClick(Sender: TObject);
begin
  Frm_cad_prod:= TFrm_cad_prod.Create(Application);
  Frm_cad_prod.LblEdit_cod_prod.Text:= Frm_cad_prod.ADOQuery_aux.FieldByName('cod_prod').AsString;
  Frm_cad_prod.LblEdit_nome.Text:= Frm_cad_prod.ADOQuery_aux.FieldByName('nome').AsString;
  Frm_cad_prod.DBLookupComboBox_categoria.KeyValue:= Frm_cad_prod.ADOQuery_aux.FieldByName('cod_cat_prod').AsInteger;
  Frm_cad_prod.DBLookupComboBox_unidade.KeyValue:= Frm_cad_prod.ADOQuery_aux.FieldByName('cod_und').AsInteger;
  Frm_cad_prod.LblEdit_cod_prod.Enabled:= False;
  Frm_cad_prod.ShowModal;
end;

procedure TFrm_produtos.Btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_produtos.Btn_inserirClick(Sender: TObject);
begin
  Frm_cad_prod:= TFrm_cad_prod.Create(Application);
  Frm_cad_prod.LblEdit_cod_prod.Enabled:= False;
  Frm_cad_prod.ShowModal;
end;

procedure TFrm_produtos.Button1Click(Sender: TObject);
var codigo, produto: String;
begin
  codigo:= ADODataSet1.FieldByName('cod_prod').AsString;
  produto:= ADODataSet1.FieldByName('nome').AsString;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('DELETE produtos WHERE cod_prod = '+chr(39)+codigo+chr(39));

   try
    if Application.MessageBox(pchar('Deseja apagar a categoria '+produto+' ?'),'Alerta',mb_YesNo+mb_IconError+mb_DefButton2)=mrno then begin
      Abort;
    end;
    ADOQuery1.ExecSQL;
    ShowMessage('Produto '+produto+' deletado com sucesso!');

    ADODataSet1.Active:= False;
    ADODataSet1.Active:= True;

  except on E: Exception do
    if POS('aborted',E.Message)>0 then begin
      //ShowMessage('Erro ao deletar!'+ E.Message);

    end else begin
      ADODataSet1.Active:= False;
      ADODataSet1.Active:= True;
    end;

  end;
end;

procedure TFrm_produtos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrm_produtos.FormShow(Sender: TObject);
begin
  ADODataSet1.Open;
end;

end.
