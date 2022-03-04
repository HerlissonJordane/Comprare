unit U_cad_cat_prod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Datasnap.DBClient, System.UITypes;

type
  TFrm_cad_cat_prod = class(TForm)
    LblEdit_categoria: TLabeledEdit;
    Btn_cancelar: TButton;
    DBGrid1: TDBGrid;
    Btn_inserir: TButton;
    Btn_alterar: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Btn_alterarClick(Sender: TObject);
    procedure Btn_inserirClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure LblEdit_categoriaChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
Type
  DBGrid_1 = class(TDBGrid);

var
  Frm_cad_cat_prod: TFrm_cad_cat_prod;

implementation

{$R *.dfm}
uses U_principal, U_ins_alt_cat_prod;

procedure TFrm_cad_cat_prod.Btn_alterarClick(Sender: TObject);
begin
 { Frm_ins_alt_cat_prod:= TFrm_ins_alt_cat_prod.Create(Application);
  Frm_ins_alt_cat_prod.LblEdit_cod.Text:= ADOQuery1.FieldByName('cod_cat_prod').AsString;
  Frm_ins_alt_cat_prod.LblEdit_categoria.Text:= ADOQuery1.FieldByName('nome_cat').AsString;
  Frm_ins_alt_cat_prod.ShowModal;}

   Frm_ins_alt_cat_prod:= TFrm_ins_alt_cat_prod.Create(Application);
   Frm_ins_alt_cat_prod.LblEdit_cod.Text:= ADODataSet1.FieldByName('cod_cat_prod').AsString;
   Frm_ins_alt_cat_prod.LblEdit_categoria.Text:= ADODataSet1.FieldByName('nome_cat').AsString;
   Frm_ins_alt_cat_prod.LblEdit_cod.Enabled:= False;
   Frm_ins_alt_cat_prod.ShowModal;
end;

procedure TFrm_cad_cat_prod.Btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_cad_cat_prod.Btn_inserirClick(Sender: TObject);
begin
  Frm_ins_alt_cat_prod:= TFrm_ins_alt_cat_prod.Create(Application);
  Frm_ins_alt_cat_prod.LblEdit_cod.Enabled:= False;
  Frm_ins_alt_cat_prod.ShowModal;

end;

procedure TFrm_cad_cat_prod.Button1Click(Sender: TObject);
var codigo, categoria: String;
begin
  codigo:= ADODataSet1.FieldByName('cod_cat_prod').AsString;
  categoria:= ADODataSet1.FieldByName('nome_cat').AsString;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('DELETE CAT_PRODUTO WHERE cod_cat_prod = '+chr(39)+codigo+chr(39));

  try
    if Application.MessageBox(pchar('Deseja apagar a categoria '+categoria+' ?'),'Alerta',mb_YesNo+mb_IconError+mb_DefButton2)=mrno then begin
    //MessageDlg('Deseja apagar a categoria '+ categoria+' ?',mtConfirmation,[mbYes, mbNo],0) = mrNo then begin
      Abort;
    end;
    ADOQuery1.ExecSQL;
    ShowMessage('Categoria '+categoria+' deletado com sucesso!');
    FormShow(Self);
  except on E: Exception do
    //if Application.MessageBox(pchar(E.MESSAGE),'Mensagem do Sistema',mb_iconerror+mb_ok)=mrok then begin
    if POS('aborted',E.Message)>0 then begin
      //ShowMessage('Erro ao deletar!'+ E.Message);
      
    end else begin
      FormShow(Self);  
    end;
  end;
  
end;

procedure TFrm_cad_cat_prod.DBGrid1DblClick(Sender: TObject);
begin //clicou duas vezes no Grid, altera a categoria
  Btn_alterar.Click();
end;

procedure TFrm_cad_cat_prod.DBGrid1TitleClick(Column: TColumn);
begin
  ADODataSet1.IndexFieldNames:= Column.FieldName;
end;

procedure TFrm_cad_cat_prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrm_cad_cat_prod.FormShow(Sender: TObject);
begin
 // LblEdit_categoria.SetFocus;

 { //tamanho de cada linha de registros
  DBGrid_1(DBGrid1).DefaultRowHeight:= 30;
  DBGrid_1(DBGrid1).ClientHeight:= (30 * DBGrid_1(DBGrid1).RowCount)+30;  }

  {ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM CAT_PRODUTO');
  ADOQuery1.Open;}
  ADODataSet1.Close;
  ADODataSet1.CommandText:='SELECT * FROM CAT_PRODUTO';
  ADODataSet1.Open;
end;

procedure TFrm_cad_cat_prod.LblEdit_categoriaChange(Sender: TObject);
begin
//  ADOQuery1.Close;
//  ADOQuery1.SQL.Clear;
//  ADOQuery1.SQL.Add('sp_busca_categoria_produto '+chr(39)+LblEdit_categoria.Text+chr(39));
//  ADOQuery1.Open;

  ADODataSet1.Close;
  ADODataSet1.CommandText:= 'sp_busca_categoria_produto '+chr(39)+LblEdit_categoria.Text+chr(39);
  ADODataSet1.Open;

end;

end.
