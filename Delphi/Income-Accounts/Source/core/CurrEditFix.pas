unit CurrEditFix;

interface

uses
  Classes, FormMngr, Forms, Variants, Controls;

type
   TCurrencyEditFixer = class(TBaseFormNotifier)
   private
    procedure HandleForm(AForm: TCustomForm);
    procedure CurrencyPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
   protected
    procedure FormCreated(AForm: TCustomForm); override;
   end;

implementation

uses
  cxCurrencyEdit, SysUtils, Math, cxEdit, cxGridDBTableView, DB,
  cxGridCustomTableView, cxGridDBBandedTableView, cxMaskEdit;

resourcestring
   SMaxValueError = '¬водимое значение должно быть не больше чем %s';
   SMinValueError = '¬водимое значение должно быть больше чем %s';
   SMinMaxValueError = '¬водимое значение должно быть между %s и %s';

{ TCurrencyEditFixer }

procedure TCurrencyEditFixer.FormCreated(AForm: TCustomForm);
begin
  HandleForm(AForm);
end;

procedure TCurrencyEditFixer.HandleForm(AForm: TCustomForm);
var
  ACol: TcxGridDBBandedColumn;
  AComp: TComponent;
  I: Integer;
begin
  for I := 0 to AForm.ComponentCount - 1 do
  begin
    AComp := AForm.Components[I];
    if AComp is TcxCustomCurrencyEdit then
     with TcxCurrencyEdit(AForm.Components[I]).ActiveProperties do
     begin
       try
         LockUpdate(True);
         if not AssignedValues.DisplayFormat then
              DisplayFormat := ',0.00;-,0.00';
         if not AssignedValues.EditFormat then
             EditFormat := ',0.00;-,0.00';
  //         DecimalPlaces := 2;
         if not AssignedValues.MaxValue then
             MaxValue := 920000000000000.00;
         if not AssignedValues.MinValue then
             MinValue := 0.01;
         UseThousandSeparator := True;
         UseLeftAlignmentOnEditing := False;
         if not assigned(OnValidate) then
             OnValidate := CurrencyPropertiesValidate;
       finally
         LockUpdate(False);
       end;
     end
    else if //(AComp is TcxGridDBColumn) or
             (AComp is TcxGridDBBandedColumn) then
     begin
       ACol := TcxGridDBBandedColumn(AForm.Components[I]);
       if (ACol.PropertiesClass = TcxMaskEditProperties) and (ACol.DataBinding.Field <> nil) and
           (ACol.DataBinding.Field is TNumericField) and
           (TNumericField(ACol.DataBinding.Field).DisplayFormat <> '') then
       begin
         ACol.PropertiesClass := TcxCurrencyEditProperties;
         TcxCurrencyEditProperties(ACol.Properties).DisplayFormat := TNumericField(ACol.DataBinding.Field).DisplayFormat;
       end;
     end;
  end;
end;

function FloatAsStr(const Value: Extended; const DecimalPlaces: integer = 2): string;
begin
  Result := FormatFloat(',0' + Copy('.0000000', 1, DecimalPlaces + 1), Value);
end;

procedure TCurrencyEditFixer.CurrencyPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  EditValue: Variant;
begin
  inherited;
  TcxCurrencyEdit(Sender).PrepareEditValue(DisplayValue, EditValue, True);

  if VarToStr(DisplayValue) = '' then Exit;

  if Error then
  begin
    with  TcxCurrencyEdit(Sender).ActiveProperties do
     if (AssignedValues.MinValue and (DisplayValue < MinValue)) or
          (AssignedValues.MaxValue and (DisplayValue > MaxValue)) then
     begin
       if AssignedValues.MinValue and AssignedValues.MaxValue then
         ErrorText := Format(SMinMaxValueError, [FloatAsStr(MinValue, DecimalPlaces), FloatAsStr(MaxValue, DecimalPlaces)])
       else if  AssignedValues.MaxValue then
         ErrorText := Format(SMaxValueError, [FloatAsStr(MaxValue, DecimalPlaces)])
       else
        ErrorText := Format(SMinValueError, [FloatAsStr(MinValue, DecimalPlaces)])
     end;
  end
   else
     if not VarIsNull(EditValue) then
     begin
       DisplayValue := RoundTo(EditValue, -TcxCurrencyEdit(Sender).ActiveProperties.DecimalPlaces);
       ErrorText := '';
     end;
  Error := ErrorText <> '';
end;

initialization
    SetRoundMode(rmNearest);
    FormManager.AddNotifier(TCurrencyEditFixer.Create);

end.
