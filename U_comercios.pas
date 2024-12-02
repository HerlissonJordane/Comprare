unit U_comercios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, JvExStdCtrls, JvCombobox;

type
  TFrm_comercios = class(TForm)
    LblEdit_categoria: TLabeledEdit;
    Btn_cancelar: TButton;
    DBGrid1: TDBGrid;
    Btn_inserir: TButton;
    Btn_alterar: TButton;
    Btn_excluir: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    JvComboBox_TIPO: TJvComboBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_inserirClick(Sender: TObject);
    procedure Btn_alterarClick(Sender: TObject);
    procedure Btn_excluirClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure JvComboBox_TIPOChange(Sender: TObject);
    procedure LblEdit_categoriaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var acao: String;
  end;

var
  Frm_comercios: TFrm_comercios;

implementation

Uses U_principal, U_cadastra_comercio;

{$R *.dfm}

procedure TFrm_comercios.Btn_alterarClick(Sender: TObject);
begin
  acao:= 'A';
  Frm_cad_comercio:= TFrm_cad_comercio.Create(Application);
  Frm_cad_comercio.LblEdit_cod_loja.Text:= ADODataSet1.FieldByName('cod_sup').AsString;
  Frm_cad_comercio.LblEdit_nome.Text:= ADODataSet1.FieldByName('nome').AsString;
  Frm_cad_comercio.LblEdit_rua.Text:= ADODataSet1.FieldByName('rua').AsString;
  Frm_cad_comercio.LblEdit_numero.Text:= ADODataSet1.FieldByName('numero').AsString;
  Frm_cad_comercio.LblEdit_bairro.Text:= ADODataSet1.FieldByName('bairro').AsString;
  Frm_cad_comercio.LblEdit_cidade.Text:= ADODataSet1.FieldByName('cidade').AsString;
  Frm_cad_comercio.LblEdit_uf.Text:= ADODataSet1.FieldByName('estado').AsString;
  //Frm_cad_comercio.FormShow(Self);
  Frm_cad_comercio.DBLookupComboBox_categoria.KeyValue:= ADODataSet1.FieldByName('cod_cat').AsInteger;
  Frm_cad_comercio.ShowModal;
end;

procedure TFrm_comercios.Btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_comercios.Btn_inserirClick(Sender: TObject);
begin
  Frm_cad_comercio:= TFrm_cad_comercio.Create(Application);
  acao:= 'I';
  Frm_cad_comercio.Show;
end;

procedure TFrm_comercios.DBGrid1TitleClick(Column: TColumn);
var i: smallint;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
    ADODataSet1.IndexFieldNames := Column.FieldName;
    Column.Title.Font.Style := [fsBold];
    JvComboBox_tipo.ItemIndex:= Column.Index;
end;

procedure TFrm_comercios.Btn_excluirClick(Sender: TObject);
var codigo, comercio:String;
begin
  codigo:= ADODataSet1.FieldByName('cod_sup').AsString;
  comercio:= ADODataSet1.FieldByName('nome').AsString;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('DELETE COMERCIO WHERE cod_sup = '+chr(39)+codigo+chr(39));

  try
    if Application.MessageBox(pchar('Deseja apagar a categoria '+comercio+' ?'),'Alerta',mb_YesNo+mb_IconError+mb_DefButton2)=mrno then begin
      Abort;
    end;
    ADOQuery1.ExecSQL;
    ShowMessage('Com�rcio '+comercio+' deletado com sucesso!');
    //atualiza Grid
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

procedure TFrm_comercios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrm_comercios.FormShow(Sender: TObject);
begin
  ADODataSet1.Open;

end;

procedure TFrm_comercios.JvComboBox_TIPOChange(Sender: TObject);
var Coluna: TColumn;
begin
  //ordena o Grid de acordo com a ordena��o do ComboBox
  Coluna:= DBGrid1.Columns.Items[JvComboBox_TIPO.ItemIndex];
  DBGrid1TitleClick(Coluna);
end;

procedure TFrm_comercios.LblEdit_categoriaChange(Sender: TObject);
begin
  ADODataSet1.Close;
  ADODataSet1.CommandText:= 'SP_busca_comercio '+chr(39)+LblEdit_categoria.Text+chr(39)+', '+
                             chr(39)+IntToStr(JvComboBox_TIPO.ItemIndex)+chr(39);
  ADODataSet1.Open;
end;

end.
