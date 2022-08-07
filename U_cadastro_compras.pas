unit U_cadastro_compras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.WinXCalendars, JvComponentBase, JvBalloonHint,
  JvHint, JvExControls, JvAnimatedImage, JvGIFCtrl, JvExComCtrls, JvAnimate,
  Vcl.ComCtrls, Vcl.BaseImageCollection, Vcl.ImageCollection, JvBmpAnimator,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, JvExStdCtrls, JvGroupBox,
  JvGroupHeader, JvButton, JvControlPanelButton, JvComponentPanel,
  JvExExtCtrls, JvSecretPanel, JvGradientHeaderPanel, JvExtComponent,
  JvItemsPanel, JvDBLookup, Data.DB, Data.Win.ADODB, Vcl.Imaging.pngimage,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrm_cadastro_compras = class(TForm)
    CardPanel1: TCardPanel;
    Card1: TCard;
    CalendarPicker_compra: TCalendarPicker;
    JvDBLookupCombo1: TJvDBLookupCombo;
    Label1: TLabel;
    ADOQuery_comercio: TADOQuery;
    DataSource1: TDataSource;
    LabeledEdit_categoria: TLabeledEdit;
    Image1: TImage;
    JvGIFAnimator1: TJvGIFAnimator;
    JvGIFAnimator2: TJvGIFAnimator;
    ButtonedEdit_pesquisa: TButtonedEdit;
    ImageList1: TImageList;
    SB_busca_categoria_prod: TSpeedButton;
    JvDBLookupCombo_categ_produto: TJvDBLookupCombo;
    Image2: TImage;
    ADOQuery_grid: TADOQuery;
    DS_grid: TDataSource;
    ADOQuery_gridcod_prod: TAutoIncField;
    ADOQuery_gridnome: TStringField;
    ADOQuery_gridNOME_CAT: TStringField;
    ADOQuery_gridDESCRICAO: TStringField;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DS_categoria_prod: TDataSource;
    ADOQuery_categoria_prod: TADOQuery;
    ADOQuery_categoria_prodCOD_CAT_PROD: TAutoIncField;
    ADOQuery_categoria_prodNOME_CAT: TStringField;
    ADOQuery_gridSELECIONE: TStringField;
    procedure FormShow(Sender: TObject);
    procedure JvDBLookupCombo1Change(Sender: TObject);
    procedure JvGIFAnimator2Click(Sender: TObject);
    procedure JvGIFAnimator1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    procedure Collapse(acao: Boolean; altura_card: Integer);
    { Private declarations }
  public
    { Public declarations }
    var altura_card: Integer;
  end;

var
  Frm_cadastro_compras: TFrm_cadastro_compras;

implementation

{$R *.dfm}

uses U_principal;


procedure TFrm_cadastro_compras.DBGrid1CellClick(Column: TColumn);
begin
  if Column.Field.FieldName = AnsiUpperCase('SELECIONE') then begin
    //with DBGrid2.DataSource.DataSet do begin
      DBGrid1.DataSource.DataSet.Edit;

        if DBGrid1.DataSource.DataSet.FieldByName('SELECIONE').AsString = '1' then begin
          DBGrid1.DataSource.DataSet.FieldByName('SELECIONE').AsString:= '0';
        end else begin
          DBGrid1.DataSource.DataSet.FieldByName('SELECIONE').AsString:= '1';
        end;

      DBGrid1.DataSource.DataSet.Post;

  end;

end;

procedure TFrm_cadastro_compras.DBGrid1ColEnter(Sender: TObject);
begin
  //para manter o DBGRID como somente leitura
  if UpperCase(DBGrid1.SelectedField.FieldName) = 'SELECIONE' then begin
    DBGrid1.Options := DBGrid1.Options - [dgEditing];
  end else begin
    DBGrid1.Options := DBGrid1.Options + [dgEditing];
  end;
end;

procedure TFrm_cadastro_compras.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  nMarcar: word;
  oRetangulo: TRect;
begin
  if UpperCase(Column.FieldName) = 'SELECIONE' then
  begin
    DBGrid1.Canvas.FillRect(Rect);

    if Column.Field.AsString = '1' then
      nMarcar := DFCS_CHECKED
    else
      nMarcar := DFCS_BUTTONCHECK;

    // ajusta o tamanho do CheckBox
    oRetangulo := Rect;
    InflateRect(oRetangulo, -2, -2);

    // desenha o CheckBox conforme a condi��o acima
    DrawFrameControl(DBGrid1.Canvas.Handle, oRetangulo, DFC_BUTTON, nMarcar);
  end;
end;


procedure TFrm_cadastro_compras.FormShow(Sender: TObject);
begin
  ADOQuery_comercio.Close;
  ADOQuery_comercio.SQL.Clear;
  ADOQuery_comercio.SQL.Add('SELECT COM.COD_SUP,NOME,CAT.COD_CAT,CATEGORIA '+
                            'FROM COMERCIO AS COM  INNER JOIN CAT_COMERCIO AS CAT '+
                            '    ON COM.COD_CAT = CAT.COD_CAT '+
                            '  ORDER BY NOME');
  ADOQuery_comercio.Open;

  JvDBLookupCombo1.KeyValue:= ADOQuery_comercio.FieldByName('cod_sup').AsInteger;

  JvGIFAnimator2.Top:= (CardPanel1.Height - JvGIFAnimator2.Height)-15;
  JvGIFAnimator2.Left:= (CardPanel1.Width - JvGIFAnimator2.Width)-15;
  altura_card:= CardPanel1.Height;
end;

procedure TFrm_cadastro_compras.JvDBLookupCombo1Change(Sender: TObject);
begin
  LabeledEdit_categoria.Text:= ADOQuery_comercio.FieldByName('categoria').AsString;
end;

procedure TFrm_cadastro_compras.JvGIFAnimator1Click(Sender: TObject);
begin
  Collapse(True,altura_card);
end;

procedure TFrm_cadastro_compras.JvGIFAnimator2Click(Sender: TObject);
begin
  Collapse(False,altura_card);
end;

PROCEDURE TFrm_cadastro_compras.Collapse(acao: Boolean; altura_card: Integer);
begin
  Label1.Visible:= acao;
  JvDBLookupCombo1.Visible:= acao;
  CalendarPicker_compra.Visible:= acao;
  //SB_busca_categoria_prod.Visible:= acao;
  LabeledEdit_categoria.Visible:= acao;
  JvGIFAnimator2.Visible:= acao;
  JvGIFAnimator1.Visible:= Not(acao);
  Image2.Visible:= Not(acao);
  Image1.Visible:= acao;

  if acao = False then begin
    CardPanel1.Height:= (ButtonedEdit_pesquisa.Height + Round(ButtonedEdit_pesquisa.Top/3));
    ButtonedEdit_pesquisa.Width:= ButtonedEdit_pesquisa.Width - Round(ButtonedEdit_pesquisa.Width/3);
    JvGIFAnimator1.Top:= (CardPanel1.Height - JvGIFAnimator1.Height)-15;
    JvGIFAnimator1.Left:= (CardPanel1.Width - JvGIFAnimator1.Width)-15;
    Image2.Left:= (CardPanel1.Width - (Image2.Width*2));
    JvDBLookupCombo_categ_produto.Top:= ButtonedEdit_pesquisa.Top;
    JvDBLookupCombo_categ_produto.Left:= ButtonedEdit_pesquisa.Width + 15;
    JvDBLookupCombo_categ_produto.Height:= ButtonedEdit_pesquisa.Height;
    SB_busca_categoria_prod.Top:= Image2.Top;
    SB_busca_categoria_prod.Left:= JvDBLookupCombo_categ_produto.Left + JvDBLookupCombo_categ_produto.Width;
  end else begin
    CardPanel1.Height:= altura_card;
    ButtonedEdit_pesquisa.Width:= ButtonedEdit_pesquisa.Width + Round(ButtonedEdit_pesquisa.Width/2);
    JvGIFAnimator2.Top:= (CardPanel1.Height - JvGIFAnimator1.Height)-15;
    JvGIFAnimator2.Left:= (CardPanel1.Width - JvGIFAnimator1.Width)-15;
    JvDBLookupCombo_categ_produto.Top:= CalendarPicker_compra.Top;
    JvDBLookupCombo_categ_produto.Left:= LabeledEdit_categoria.Left;
    JvDBLookupCombo_categ_produto.Height:= CalendarPicker_compra.Height;
    SB_busca_categoria_prod.Top:= 56;
    SB_busca_categoria_prod.Left:= JvDBLookupCombo_categ_produto.Left + JvDBLookupCombo_categ_produto.Width;
  end;

end;

end.
