unit uClassTest;

interface

uses uBasicClass, System.SysUtils, System.Classes, Json;

type
{$METHODINFO ON}
  tTestClass = class(TBasicClass)
  private
  //private methods
  protected
  //protected methods
  public
  //public methods
    function teste: String;
{$METHODINFO OFF}
end;

implementation
{ tTestClass }

function tTestClass.teste: String;
begin

  Result := 'asdasd';
end;

end.
